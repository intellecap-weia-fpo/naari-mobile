import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../schema.graphql.dart';
import 'connectivity_service.dart';
import 'offline_storage_service.dart';
import 'offline_file_storage_service.dart';
import 'survey_service.dart';
import 'submission_service.dart';

/// Configuration for sync manager behavior
class SyncConfig {
  /// Maximum number of retry attempts for failed operations
  final int maxRetryCount;

  /// Base delay between retries (uses exponential backoff)
  final Duration retryBaseDelay;

  /// Maximum delay between retries
  final Duration maxRetryDelay;

  /// How often to attempt sync when online
  final Duration syncInterval;

  /// Whether to automatically sync when connectivity is restored
  final bool autoSyncOnConnectivity;

  const SyncConfig({
    this.maxRetryCount = 5,
    this.retryBaseDelay = const Duration(seconds: 5),
    this.maxRetryDelay = const Duration(minutes: 5),
    this.syncInterval = const Duration(minutes: 2),
    this.autoSyncOnConnectivity = true,
  });
}

/// Result of a sync operation
class SyncResult {
  final int successCount;
  final int failureCount;
  final int pendingCount;
  final List<String> errors;
  final DateTime syncedAt;

  SyncResult({
    this.successCount = 0,
    this.failureCount = 0,
    this.pendingCount = 0,
    this.errors = const [],
    DateTime? syncedAt,
  }) : syncedAt = syncedAt ?? DateTime.now();

  bool get hasErrors => errors.isNotEmpty;
  bool get isComplete => pendingCount == 0;
}

/// Service to manage offline/online sync operations
class SyncManager extends ChangeNotifier {
  static SyncManager? _instance;
  static SyncManager get instance => _instance ??= SyncManager._();

  SyncManager._() {
    _initialize();
  }

  final ConnectivityService _connectivity = ConnectivityService.instance;
  final OfflineStorageService _storage = OfflineStorageService.instance;
  final SurveyService _surveyService = SurveyService.instance;
  final SubmissionService _submissionService = SubmissionService.instance;

  SyncConfig _config = const SyncConfig();

  bool _isSyncing = false;
  bool _pausedForAccountDeletion = false;
  bool _isInitialized = false;
  int _pendingCount = 0;
  SyncResult? _lastSyncResult;
  Timer? _syncTimer;
  StreamSubscription<bool>? _connectivitySubscription;

  /// Whether sync is currently in progress
  bool get isSyncing => _isSyncing;

  /// Whether the sync manager is initialized
  bool get isInitialized => _isInitialized;

  /// Number of pending sync operations
  int get pendingCount => _pendingCount;

  /// Result of the last sync operation
  SyncResult? get lastSyncResult => _lastSyncResult;

  /// Whether there are items waiting to be synced
  bool get hasPendingItems => _pendingCount > 0;

  /// Current connectivity status
  bool get isOnline => _connectivity.isOnline;

  /// Stream of sync progress updates
  Stream<SyncProgress> get syncProgress => _syncProgressController.stream;
  final _syncProgressController = StreamController<SyncProgress>.broadcast();

  void _initialize() async {
    debugPrint('SyncManager: Initializing');

    // Wait for storage to be ready
    await _storage.database;

    // Get initial pending count
    await _updatePendingCount();

    // Listen for connectivity changes
    if (_config.autoSyncOnConnectivity) {
      _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
        _onConnectivityChanged,
      );
    }

    _isInitialized = true;
    notifyListeners();

    debugPrint('SyncManager: Initialized with $_pendingCount pending items');

    // Start sync if online and has pending items
    if (_connectivity.isOnline && _pendingCount > 0) {
      _scheduleSyncSoon();
    }
  }

  /// Update sync configuration
  void configure(SyncConfig config) {
    _config = config;

    // Restart sync timer if needed
    if (_config.autoSyncOnConnectivity) {
      _connectivitySubscription?.cancel();
      _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
        _onConnectivityChanged,
      );
    } else {
      _connectivitySubscription?.cancel();
      _connectivitySubscription = null;
    }
  }

  void _onConnectivityChanged(bool isOnline) async {
    debugPrint('SyncManager: Connectivity changed - online: $isOnline');

    if (isOnline) {
      // Always re-check pending count when coming online
      // This handles the race condition where submissions were queued
      // while offline but _pendingCount wasn't updated yet
      await _updatePendingCount();
      if (_pendingCount > 0) {
        debugPrint(
          'SyncManager: Online with $_pendingCount pending items, scheduling sync',
        );
        _scheduleSyncSoon();
      }
    } else {
      _syncTimer?.cancel();
      _syncTimer = null;
    }
  }

  void _scheduleSyncSoon() {
    _syncTimer?.cancel();
    _syncTimer = Timer(const Duration(seconds: 2), () {
      syncNow();
    });
  }

  Future<void> _updatePendingCount() async {
    final count = await _storage.getPendingSyncCount();
    debugPrint(
      'SyncManager: Pending count updated: $count (was: $_pendingCount)',
    );
    if (_pendingCount != count) {
      _pendingCount = count;
      notifyListeners();
    }
  }

  Future<void> _addSyncLog({
    required String operationType,
    required SyncStatus status,
    required String message,
    String? localId,
    String? surveyId,
    String? questionId,
    String? serverSubmissionId,
  }) async {
    try {
      await _storage.addSyncLog(
        SyncLogEntry(
          operationType: operationType,
          status: status,
          message: message,
          localId: localId,
          surveyId: surveyId,
          questionId: questionId,
          serverSubmissionId: serverSubmissionId,
        ),
      );
      notifyListeners();
    } catch (e) {
      debugPrint('SyncManager: Failed to write sync log: $e');
    }
  }

  String _queueItemLabel(SyncQueueItem item) {
    try {
      switch (item.operationType) {
        case SyncOperationType.submitSurvey:
          final data = item.data;
          return data['isDraft'] == true
              ? 'draft submission'
              : 'survey submission';
        case SyncOperationType.saveAnswer:
          return 'answer';
        case SyncOperationType.uploadSignature:
          return 'signature upload';
        case SyncOperationType.uploadPhoto:
          return 'photo upload';
      }
    } catch (_) {
      return item.operationType.name;
    }
  }

  // ==================== PUBLIC API ====================

  /// Queue a survey submission for sync
  /// Returns a local ID that can be used to track the submission
  ///
  /// [surveyVersionUsed] is the survey's updatedAt timestamp when the user started filling the survey.
  /// This is used for conflict detection during sync - if the survey was updated on the server
  /// after the user cached it, the sync may need special handling.
  Future<String> queueSurveySubmission({
    required String surveyId,
    required List<Input$AnswerInput> answers,
    String? language,
    double? latitude,
    double? longitude,
    DateTime? surveyVersionUsed,
    String? localId,
    String? serverSubmissionId,
  }) async {
    final effectiveServerSubmissionId =
        serverSubmissionId ?? (localId != null && !localId.startsWith('local_')
            ? localId
            : null);
    final effectiveLocalId =
        localId ?? effectiveServerSubmissionId ?? 'local_${const Uuid().v4()}';

    // Convert answers to JSON-serializable format
    final answersJson = answers.map((a) => a.toJson()).toList();

    // Save offline submission with survey version for conflict detection
    final submission = OfflineSubmission(
      localId: effectiveLocalId,
      surveyId: surveyId,
      answersJson: jsonEncode(answersJson),
      language: language,
      latitude: latitude,
      longitude: longitude,
      surveyVersionUsed: surveyVersionUsed,
      serverSubmissionId: effectiveServerSubmissionId,
    );
    await _storage.saveOfflineSubmission(submission);

    if (effectiveServerSubmissionId != null) {
      await _storage.deleteDraftsForServerSubmission(
        effectiveServerSubmissionId,
        exceptLocalId: effectiveLocalId,
      );
    }

    // Add to sync queue
    final queueItem = SyncQueueItem(
      operationType: SyncOperationType.submitSurvey,
      dataJson: jsonEncode({
        'localId': effectiveLocalId,
        'surveyId': surveyId,
        'answers': answersJson,
        'language': language,
        'latitude': latitude,
        'longitude': longitude,
        'surveyVersionUsed': surveyVersionUsed?.toIso8601String(),
        'serverSubmissionId': effectiveServerSubmissionId,
      }),
      priority: 5, // High priority for submissions
    );
    await _storage.addToSyncQueue(queueItem);

    await _updatePendingCount();

    debugPrint(
      'SyncManager: Queued survey submission with localId: $effectiveLocalId, serverSubmissionId: $effectiveServerSubmissionId, surveyVersion: ${surveyVersionUsed?.toIso8601String()}',
    );

    // Try to sync immediately if online
    if (_connectivity.isOnline && !_isSyncing) {
      _scheduleSyncSoon();
    }

    return effectiveLocalId;
  }

  /// Keep draft state local. Draft/incomplete submissions should not upload
  /// until the user explicitly submits them.
  Future<void> queueDraftSubmission({
    required String localId,
    required String surveyId,
    required Map<String, dynamic> rawAnswers,
    String? language,
    double? latitude,
    double? longitude,
    DateTime? surveyVersionUsed,
    Map<String, String>? questionTypes,
  }) async {
    final existingItems = await _storage.getPendingSyncItems();
    for (final item in existingItems) {
      if (item.operationType == SyncOperationType.submitSurvey) {
        final data = item.data;
        if (data['localId'] == localId && data['isDraft'] == true) {
          debugPrint(
            'SyncManager: Removing queued draft $localId. Drafts stay local until submitted.',
          );
          await _storage.updateSyncQueueItem(
            item.copyWith(status: SyncStatus.completed),
          );
        }
      }
    }
    await _storage.removeCompletedSyncItems();

    await _updatePendingCount();

    debugPrint(
      'SyncManager: Draft $localId saved locally for survey $surveyId. It will sync only after submit.',
    );
  }

  /// Queue an answer save operation for sync
  Future<void> queueAnswerSave({
    required String submissionId,
    required String questionId,
    String? textAnswer,
    List<String>? selectedOptionIds,
    String? otherText,
  }) async {
    final queueItem = SyncQueueItem(
      operationType: SyncOperationType.saveAnswer,
      dataJson: jsonEncode({
        'submissionId': submissionId,
        'questionId': questionId,
        'textAnswer': textAnswer,
        'selectedOptionIds': selectedOptionIds,
        'otherText': otherText,
      }),
      priority: 10, // Normal priority for answer saves
    );
    await _storage.addToSyncQueue(queueItem);
    await _updatePendingCount();

    debugPrint('SyncManager: Queued answer save for question: $questionId');
  }

  /// Queue a file upload (signature or photo)
  /// Files are copied to offline storage to prevent OS cleanup of temp files
  /// If the file is already in offline storage, it won't be copied again
  Future<void> queueFileUpload({
    required String localPath,
    required String fileType, // 'signature' or 'photo'
    required String submissionId,
  }) async {
    String persistedPath = localPath;

    // Check if file is already in offline storage directory
    final offlineStorageDir =
        await OfflineFileStorageService.instance.baseDirectory;
    final isAlreadyPersisted = localPath.startsWith(offlineStorageDir.path);

    if (!isAlreadyPersisted) {
      // Copy file to offline storage to prevent OS cleanup of temp files
      final offlineFileType = fileType == 'signature'
          ? OfflineFileType.signature
          : OfflineFileType.photo;

      try {
        persistedPath = await OfflineFileStorageService.instance
            .copyToOfflineStorage(
              sourcePath: localPath,
              fileType: offlineFileType,
              customFileName:
                  '${submissionId}_$fileType${_getFileExtension(localPath)}',
            );
      } catch (e) {
        debugPrint('SyncManager: Error copying file to offline storage: $e');
        // Fallback to original path if copy fails - this may fail on iOS
        persistedPath = localPath;
      }
    } else {
      debugPrint('SyncManager: File already in offline storage: $localPath');
    }

    await _storage.addPendingFile(
      localPath: persistedPath,
      fileType: fileType,
      submissionId: submissionId,
    );

    final queueItem = SyncQueueItem(
      operationType: fileType == 'signature'
          ? SyncOperationType.uploadSignature
          : SyncOperationType.uploadPhoto,
      dataJson: jsonEncode({
        'localPath': persistedPath,
        'submissionId': submissionId,
      }),
      priority: 8, // Medium priority for file uploads
    );
    await _storage.addToSyncQueue(queueItem);
    await _updatePendingCount();

    debugPrint(
      'SyncManager: Queued $fileType upload for submission: $submissionId (stored at $persistedPath)',
    );
  }

  String _getFileExtension(String path) {
    final lastDot = path.lastIndexOf('.');
    if (lastDot == -1) return '';
    return path.substring(lastDot);
  }

  /// Execute sync now
  Future<SyncResult> syncNow() async {
    if (_pausedForAccountDeletion) return SyncResult();
    if (_isSyncing) {
      debugPrint('SyncManager: Sync already in progress');
      return _lastSyncResult ?? SyncResult();
    }

    if (!_connectivity.isOnline) {
      debugPrint('SyncManager: Cannot sync - device is offline');
      return SyncResult(
        pendingCount: _pendingCount,
        errors: ['Device is offline'],
      );
    }

    _isSyncing = true;
    notifyListeners();

    int successCount = 0;
    int failureCount = 0;
    final errors = <String>[];

    debugPrint('SyncManager: Starting sync');
    _syncProgressController.add(
      SyncProgress(status: SyncStatus.syncing, message: 'Starting sync...'),
    );

    try {
      await _requeueOrphanedSubmissions();

      // Get pending items ordered by priority
      final pendingItems = await _storage.getPendingSyncItems();
      final totalItems = pendingItems.length;

      debugPrint('SyncManager: Found $totalItems pending items');

      for (int i = 0; i < pendingItems.length; i++) {
        var item = pendingItems[i];

        // Check connectivity before each operation
        if (!_connectivity.isOnline) {
          debugPrint('SyncManager: Lost connectivity during sync');
          break;
        }

        // Reset failed items to pending for retry
        if (item.status == SyncStatus.failed) {
          debugPrint(
            'SyncManager: Resetting failed item ${item.id} to pending for retry',
          );
          item = item.copyWith(
            status: SyncStatus.pending,
            retryCount: 0,
            errorMessage: null,
            lastAttemptAt: DateTime.now(),
          );
          await _storage.updateSyncQueueItem(item);
        }

        _syncProgressController.add(
          SyncProgress(
            status: SyncStatus.syncing,
            message: 'Syncing item ${i + 1} of $totalItems',
            current: i + 1,
            total: totalItems,
          ),
        );

        try {
          await _processQueueItem(item);

          // Mark as completed
          debugPrint(
            'SyncManager: Marking queue item ${item.id} (${item.operationType}) as completed',
          );
          await _storage.updateSyncQueueItem(
            item.copyWith(status: SyncStatus.completed),
          );
          successCount++;
          debugPrint(
            'SyncManager: Queue item ${item.id} successfully marked as completed',
          );
        } catch (e) {
          debugPrint('SyncManager: Error processing item ${item.id}: $e');
          await _addSyncLog(
            operationType: item.operationType.name,
            status: SyncStatus.failed,
            message: 'Failed to sync ${_queueItemLabel(item)}: $e',
          );

          final newRetryCount = item.retryCount + 1;

          if (newRetryCount >= _config.maxRetryCount) {
            // Mark as failed permanently
            await _storage.updateSyncQueueItem(
              item.copyWith(
                status: SyncStatus.failed,
                retryCount: newRetryCount,
                lastAttemptAt: DateTime.now(),
                errorMessage: e.toString(),
              ),
            );
            errors.add('Item ${item.id}: $e');
            failureCount++;
          } else {
            // Mark for retry
            await _storage.updateSyncQueueItem(
              item.copyWith(
                status: SyncStatus.pending,
                retryCount: newRetryCount,
                lastAttemptAt: DateTime.now(),
                errorMessage: e.toString(),
              ),
            );
          }
        }
      }

      // Clean up completed items
      debugPrint('SyncManager: Cleaning up completed sync items...');
      await _storage.removeCompletedSyncItems();

      // Clean up invalid saveAnswer items for local submissions
      await _storage.removeLocalSubmissionAnswerSaves();

      await _storage.removeUploadedFiles();

      // Periodic cleanup of old entries
      await _storage.cleanupOldEntries();

      debugPrint('SyncManager: Completed items cleanup done');
    } catch (e) {
      debugPrint('SyncManager: Sync error: $e');
      errors.add('Sync error: $e');
    } finally {
      _isSyncing = false;
      await _updatePendingCount();

      _lastSyncResult = SyncResult(
        successCount: successCount,
        failureCount: failureCount,
        pendingCount: _pendingCount,
        errors: errors,
      );

      _syncProgressController.add(
        SyncProgress(
          status: _pendingCount == 0
              ? SyncStatus.completed
              : SyncStatus.pending,
          message: _pendingCount == 0
              ? 'Sync complete'
              : '$_pendingCount items pending',
          current: successCount,
          total: successCount + failureCount + _pendingCount,
        ),
      );

      notifyListeners();

      debugPrint(
        'SyncManager: Sync complete - success: $successCount, failed: $failureCount, pending: $_pendingCount',
      );

      // If there are still pending items and we had some success, schedule another sync
      // This handles the case where file uploads were waiting for submissions to sync
      if (_pendingCount > 0 && successCount > 0 && _connectivity.isOnline) {
        debugPrint(
          'SyncManager: Scheduling follow-up sync for remaining items',
        );
        _scheduleSyncSoon();
      }
    }

    return _lastSyncResult!;
  }

  /// Re-queue orphaned items that exist in storage tables but are missing from sync_queue.
  Future<void> _requeueOrphanedSubmissions() async {
    final pendingItems = await _storage.getPendingSyncItems();

    final pendingSubmissionIds = pendingItems
        .where((item) => item.operationType == SyncOperationType.submitSurvey)
        .map((item) => item.data['localId'] as String?)
        .whereType<String>()
        .toSet();

    final pendingFilePaths = pendingItems
        .where(
          (item) =>
              item.operationType == SyncOperationType.uploadSignature ||
              item.operationType == SyncOperationType.uploadPhoto,
        )
        .map((item) => item.data['localPath'] as String?)
        .whereType<String>()
        .toSet();

    int requeuedSubmissions = 0;
    int requeuedFiles = 0;

    final unsyncedSubmissions = await _storage.getPendingSyncSubmissions();
    for (final submission in unsyncedSubmissions) {
      if (!pendingSubmissionIds.contains(submission.localId)) {
        await _storage.addToSyncQueue(
          SyncQueueItem(
            operationType: SyncOperationType.submitSurvey,
            dataJson: jsonEncode({
              'localId': submission.localId,
              'surveyId': submission.surveyId,
              'answers': jsonDecode(submission.answersJson),
              'language': submission.language,
              'latitude': submission.latitude,
              'longitude': submission.longitude,
              'surveyVersionUsed': submission.surveyVersionUsed
                  ?.toIso8601String(),
              'isDraft': submission.status == OfflineSubmissionStatus.draft,
            }),
            priority: 5,
          ),
        );
        requeuedSubmissions++;
      }
    }

    final pendingFiles = await _storage.getAllPendingFiles();
    for (final file in pendingFiles) {
      final localPath = file['local_path'] as String?;
      final fileType = file['file_type'] as String?;
      final submissionId = file['submission_id'] as String?;

      if (localPath == null || fileType == null || submissionId == null) {
        continue;
      }

      final fileExists = await File(localPath).exists();
      if (!fileExists) {
        await _storage.markFileUploadedByPath(localPath);
        continue;
      }

      if (submissionId.startsWith('local_')) {
        final submission = await _storage.getOfflineSubmission(submissionId);
        if (submission?.status == OfflineSubmissionStatus.draft) {
          continue;
        }
      }

      if (!pendingFilePaths.contains(localPath)) {
        await _storage.addToSyncQueue(
          SyncQueueItem(
            operationType: fileType == 'signature'
                ? SyncOperationType.uploadSignature
                : SyncOperationType.uploadPhoto,
            dataJson: jsonEncode({
              'localPath': localPath,
              'submissionId': submissionId,
            }),
            priority: 8,
          ),
        );
        requeuedFiles++;
      }
    }

    if (requeuedSubmissions > 0 || requeuedFiles > 0) {
      debugPrint(
        'SyncManager: Re-queued orphaned items - submissions: $requeuedSubmissions, files: $requeuedFiles',
      );
    }
  }

  Future<void> _processQueueItem(SyncQueueItem item) async {
    switch (item.operationType) {
      case SyncOperationType.submitSurvey:
        await _processSurveySubmission(item);
        break;

      case SyncOperationType.saveAnswer:
        await _processAnswerSave(item);
        break;

      case SyncOperationType.uploadSignature:
      case SyncOperationType.uploadPhoto:
        await _processFileUpload(item);
        break;
    }
  }

  Future<void> _processSurveySubmission(SyncQueueItem item) async {
    final data = item.data;
    final localId = data['localId'] as String;
    final surveyId = data['surveyId'] as String;
    final answersData = data['answers'];
    final language = data['language'] as String?;
    final latitude = data['latitude'] as double?;
    final longitude = data['longitude'] as double?;
    final surveyVersionUsedStr = data['surveyVersionUsed'] as String?;
    final isDraft = data['isDraft'] == true;
    final queuedServerSubmissionId = data['serverSubmissionId'] as String?;

    final localSubmission = await _storage.getOfflineSubmission(localId);
    final existingServerSubmissionId =
        localSubmission?.serverSubmissionId ?? queuedServerSubmissionId;
    if (isDraft || localSubmission?.status == OfflineSubmissionStatus.draft) {
      await _addSyncLog(
        operationType: 'draftSubmission',
        status: SyncStatus.pending,
        message: 'Draft saved locally. It will sync after user submits.',
        localId: localId,
        surveyId: surveyId,
      );
      debugPrint(
        'SyncManager: Skipping draft $localId. Drafts stay local until submitted.',
      );
      return;
    }

    // Parse the survey version used during offline submission
    DateTime? surveyVersionUsed;
    if (surveyVersionUsedStr != null) {
      surveyVersionUsed = DateTime.tryParse(surveyVersionUsedStr);
    }

    // Convert answers back to Input$AnswerInput (supports legacy queued formats)
    final answers = _parseQueuedAnswers(answersData);

    // --- LEGACY DRAFT HANDLING ---
    // Kept unreachable by the draft guard above so older queued draft payloads
    // are skipped locally instead of uploaded to the server.
    if (data['legacyDraftUpload'] == true) {
      debugPrint(
        'SyncManager: Processing draft submission for survey $surveyId (local: $localId)',
      );
      await _addSyncLog(
        operationType: 'draftSubmission',
        status: SyncStatus.syncing,
        message: 'Syncing draft submission with ${answers.length} answers',
        localId: localId,
        surveyId: surveyId,
      );

      final localDraft = await _storage.getOfflineSubmission(localId);
      String? serverSubmissionId = localDraft?.serverSubmissionId;

      if (serverSubmissionId == null || serverSubmissionId.isEmpty) {
        // 1. Create a server-side draft submission with localId for offline sync
        final serverSubmission = await _surveyService.createSubmission(
          surveyId: surveyId,
          status: 'draft',
          localId: localId,
        );

        if (serverSubmission == null || serverSubmission.id.isEmpty) {
          throw Exception('Failed to create server-side draft submission');
        }

        serverSubmissionId = serverSubmission.id;
        await _storage.updateDraftServerId(localId, serverSubmissionId);
        await _addSyncLog(
          operationType: 'draftSubmission',
          status: SyncStatus.completed,
          message: 'Created server draft for offline submission',
          localId: localId,
          surveyId: surveyId,
          serverSubmissionId: serverSubmissionId,
        );
      } else {
        await _addSyncLog(
          operationType: 'draftSubmission',
          status: SyncStatus.syncing,
          message: 'Continuing sync for existing server draft',
          localId: localId,
          surveyId: surveyId,
          serverSubmissionId: serverSubmissionId,
        );
      }

      final serverDraftId = serverSubmissionId;
      if (serverDraftId == null || serverDraftId.isEmpty) {
        throw Exception('Failed to resolve server draft submission ID');
      }

      debugPrint(
        'SyncManager: Created server draft $serverDraftId for local draft $localId',
      );

      // 2. Save each answer to the server draft
      var savedAnswers = 0;
      for (final answer in answers) {
        debugPrint(
          'SyncManager: Saving answer - question: ${answer.questionId}, '
          'textAnswer: "${answer.textAnswer}", '
          'selectedOptionIds: ${answer.selectedOptionIds}, '
          'otherText: "${answer.otherText}"',
        );
        try {
          await _surveyService.saveAnswer(
            submissionId: serverDraftId,
            questionId: answer.questionId,
            textAnswer: answer.textAnswer,
            selectedOptionIds: answer.selectedOptionIds
                ?.where((e) => e != null)
                .cast<String>()
                .toList(),
            otherText: answer.otherText,
          );
          savedAnswers++;
          await _addSyncLog(
            operationType: 'draftAnswer',
            status: SyncStatus.completed,
            message: 'Saved answer ${savedAnswers}/${answers.length}',
            localId: localId,
            surveyId: surveyId,
            questionId: answer.questionId,
            serverSubmissionId: serverDraftId,
          );
        } catch (e) {
          await _addSyncLog(
            operationType: 'draftAnswer',
            status: SyncStatus.failed,
            message:
                'Answer ${savedAnswers + 1}/${answers.length} failed: $e',
            localId: localId,
            surveyId: surveyId,
            questionId: answer.questionId,
            serverSubmissionId: serverDraftId,
          );
          throw Exception(
            'Draft partially synced: $savedAnswers/${answers.length} answers saved. Failed question ${answer.questionId}: $e',
          );
        }
      }

      debugPrint(
        'SyncManager: Saved ${answers.length} answers to server draft $serverSubmissionId',
      );

      // 3. Update pending file uploads with the server submission ID
      await _storage.updatePendingFileSubmissionIds(
        localId,
        serverDraftId,
      );

      await _addSyncLog(
        operationType: 'draftSubmission',
        status: SyncStatus.completed,
        message:
            'Draft synced successfully: $savedAnswers/${answers.length} answers saved',
        localId: localId,
        surveyId: surveyId,
        serverSubmissionId: serverDraftId,
      );
      debugPrint(
        'SyncManager: Successfully synced draft $surveyId (local: $localId -> server: $serverDraftId)',
      );
      return;
    }

    // --- COMPLETED SUBMISSION HANDLING (existing behavior) ---

    // Check for version conflicts before submitting
    if (surveyVersionUsed != null) {
      final versionConflict = await _checkSurveyVersionConflict(
        surveyId: surveyId,
        cachedVersion: surveyVersionUsed,
        language: language,
      );

      if (versionConflict != null) {
        debugPrint(
          'SyncManager: Survey version conflict detected: $versionConflict',
        );
        // Log the conflict but still attempt submission
        // The server will ultimately decide if the submission is valid
        _syncProgressController.add(
          SyncProgress(
            status: SyncStatus.syncing,
            message: 'Survey may have been updated - submitting anyway',
          ),
        );
      }
    }

    // Submit to server
    String? serverSubmissionId;
    try {
      await _addSyncLog(
        operationType: 'surveySubmission',
        status: SyncStatus.syncing,
        message: 'Uploading survey submission with ${answers.length} answers',
        localId: localId,
        surveyId: surveyId,
      );
      serverSubmissionId = await _surveyService.submitSurveyWithLocation(
        surveyId: surveyId,
        answers: answers,
        language: language,
        latitude: latitude,
        longitude: longitude,
        localId: existingServerSubmissionId == null ? localId : null,
        submissionId: existingServerSubmissionId,
      );
    } catch (e) {
      // Check if this is a version-related rejection from server
      final errorStr = e.toString().toLowerCase();
      if (errorStr.contains('version') ||
          errorStr.contains('outdated') ||
          errorStr.contains('conflict') ||
          errorStr.contains('survey has been modified')) {
        debugPrint(
          'SyncManager: Server rejected submission due to version conflict',
        );
        // Mark as version conflict for user review
        await _markSubmissionAsConflict(
          localId,
          'Survey was updated on server',
        );
        await _addSyncLog(
          operationType: 'surveySubmission',
          status: SyncStatus.failed,
          message:
              'Survey was updated while offline. Review answers before retrying.',
          localId: localId,
          surveyId: surveyId,
        );
        throw SurveyVersionConflictException(
          'Survey was updated while you were offline. Your answers may need review.',
        );
      }
      if (_isDuplicateSubmissionAnswerError(e)) {
        final recoveredSubmissionId = await _recoverDuplicateSubmissionRetry(
          localId: localId,
          surveyId: surveyId,
          answers: answers,
        );
        if (recoveredSubmissionId != null) {
          serverSubmissionId = recoveredSubmissionId;
        } else {
          await _addSyncLog(
            operationType: 'surveySubmission',
            status: SyncStatus.failed,
            message:
                'Duplicate answer retry failed. Existing server submission could not be completed.',
            localId: localId,
            surveyId: surveyId,
          );
          rethrow;
        }
      } else {
        await _addSyncLog(
          operationType: 'surveySubmission',
          status: SyncStatus.failed,
          message: 'Survey submission failed: $e',
          localId: localId,
          surveyId: surveyId,
        );
        rethrow;
      }
    }

    if (serverSubmissionId == null || serverSubmissionId.isEmpty) {
      await _addSyncLog(
        operationType: 'surveySubmission',
        status: SyncStatus.failed,
        message: 'Server accepted submission but did not return an ID',
        localId: localId,
        surveyId: surveyId,
      );
      throw Exception('Survey submitted but server did not return submission ID');
    }

    // Update pending file uploads with the server submission ID
    debugPrint(
      'SyncManager: Updating pending file uploads from local ID $localId to server ID $serverSubmissionId',
    );
    await _storage.updatePendingFileSubmissionIds(localId, serverSubmissionId);
    await _storage.markSubmissionSynced(localId, serverSubmissionId);

    // Mark local submission as synced
    await _storage.deleteOfflineSubmission(localId);
    await _addSyncLog(
      operationType: 'surveySubmission',
      status: SyncStatus.completed,
      message: 'Survey submission synced with ${answers.length} answers',
      localId: localId,
      surveyId: surveyId,
      serverSubmissionId: serverSubmissionId,
    );

    debugPrint(
      'SyncManager: Successfully submitted survey $surveyId (local: $localId)',
    );
  }

  bool _isDuplicateSubmissionAnswerError(Object error) {
    final message = error.toString().toLowerCase();
    return message.contains('duplicate key') &&
        (message.contains('survey_submissionanswer_submission_id_question_id') ||
            message.contains('submissionanswer'));
  }

  Future<String?> _recoverDuplicateSubmissionRetry({
    required String localId,
    required String surveyId,
    required List<Input$AnswerInput> answers,
  }) async {
    await _addSyncLog(
      operationType: 'surveySubmission',
      status: SyncStatus.syncing,
      message:
          'Duplicate answer detected. Recovering existing server submission.',
      localId: localId,
      surveyId: surveyId,
    );

    final serverSubmission = await _submissionService.getSubmissionByLocalId(
      localId,
    );
    if (serverSubmission == null) {
      return null;
    }

    final serverSubmissionId = serverSubmission.id;
    final existingQuestionIds = serverSubmission.answers.edges
        .where((edge) => edge?.node != null)
        .map((edge) => edge!.node!.question.id)
        .toSet();

    var recoveredAnswers = existingQuestionIds.length;
    final missingAnswers = answers
        .where((answer) => !existingQuestionIds.contains(answer.questionId))
        .toList();

    await _addSyncLog(
      operationType: 'surveySubmission',
      status: SyncStatus.syncing,
      message:
          'Found server submission with $recoveredAnswers/${answers.length} answers',
      localId: localId,
      surveyId: surveyId,
      serverSubmissionId: serverSubmissionId,
    );

    for (final answer in missingAnswers) {
      try {
        await _surveyService.saveAnswer(
          submissionId: serverSubmissionId,
          questionId: answer.questionId,
          textAnswer: answer.textAnswer,
          selectedOptionIds: answer.selectedOptionIds
              ?.where((e) => e != null)
              .cast<String>()
              .toList(),
          otherText: answer.otherText,
        );
        recoveredAnswers++;
        await _addSyncLog(
          operationType: 'answerRecovery',
          status: SyncStatus.completed,
          message: 'Recovered answer $recoveredAnswers/${answers.length}',
          localId: localId,
          surveyId: surveyId,
          questionId: answer.questionId,
          serverSubmissionId: serverSubmissionId,
        );
      } catch (e) {
        if (!_isDuplicateSubmissionAnswerError(e)) {
          rethrow;
        }
        await _addSyncLog(
          operationType: 'answerRecovery',
          status: SyncStatus.completed,
          message: 'Answer already existed during recovery',
          localId: localId,
          surveyId: surveyId,
          questionId: answer.questionId,
          serverSubmissionId: serverSubmissionId,
        );
      }
    }

    final refreshedSubmission = await _submissionService.getSubmissionByLocalId(
      localId,
    );
    final refreshedQuestionIds = refreshedSubmission?.answers.edges
            .where((edge) => edge?.node != null)
            .map((edge) => edge!.node!.question.id)
            .toSet() ??
        <String>{};
    final expectedQuestionIds = answers
        .map((answer) => answer.questionId)
        .toSet();
    final missingAfterRecovery = expectedQuestionIds
        .where((questionId) => !refreshedQuestionIds.contains(questionId))
        .toList();

    if (missingAfterRecovery.isNotEmpty) {
      await _addSyncLog(
        operationType: 'surveySubmission',
        status: SyncStatus.failed,
        message:
            'Recovery incomplete. Missing ${missingAfterRecovery.length} answer(s).',
        localId: localId,
        surveyId: surveyId,
        serverSubmissionId: serverSubmissionId,
      );
      return null;
    }

    await _addSyncLog(
      operationType: 'surveySubmission',
      status: SyncStatus.completed,
      message: 'Recovered duplicate retry with ${answers.length} answers',
      localId: localId,
      surveyId: surveyId,
      serverSubmissionId: serverSubmissionId,
    );
    return serverSubmissionId;
  }

  List<Input$AnswerInput> _parseQueuedAnswers(dynamic answersData) {
    if (answersData == null) return const [];

    if (answersData is String) {
      try {
        return _parseQueuedAnswers(jsonDecode(answersData));
      } catch (e) {
        debugPrint('SyncManager: Failed to decode queued answers: $e');
        return const [];
      }
    }

    if (answersData is List) {
      final parsed = <Input$AnswerInput>[];
      for (final item in answersData) {
        if (item is Map) {
          final answer = _parseSingleQueuedAnswer(
            item is Map<String, dynamic>
                ? item
                : Map<String, dynamic>.from(item),
          );
          if (answer != null) parsed.add(answer);
        }
      }
      return parsed;
    }

    if (answersData is Map) {
      final map = answersData is Map<String, dynamic>
          ? answersData
          : Map<String, dynamic>.from(answersData);

      if (map.containsKey('questionId')) {
        final answer = _parseSingleQueuedAnswer(map);
        return answer == null ? const [] : [answer];
      }

      return _parseRawAnswersMap(map);
    }

    return const [];
  }

  Input$AnswerInput? _parseSingleQueuedAnswer(Map<String, dynamic> map) {
    final questionId = map['questionId']?.toString();
    if (questionId == null || questionId.isEmpty) return null;

    String? textAnswer = map['textAnswer']?.toString();
    if (textAnswer != null && textAnswer.trim().isEmpty) {
      textAnswer = null;
    }

    final rawSelected = map['selectedOptionIds'] ?? map['optionIds'];
    List<String>? selectedOptionIds;
    if (rawSelected is List) {
      final ids = rawSelected
          .where((e) => e != null && e.toString().isNotEmpty)
          .map((e) => e.toString())
          .toList();
      if (ids.isNotEmpty) selectedOptionIds = ids;
    } else if (rawSelected is String && rawSelected.isNotEmpty) {
      selectedOptionIds = [rawSelected];
    }

    String? otherText = map['otherText']?.toString();
    if (otherText != null && otherText.trim().isEmpty) {
      otherText = null;
    }

    if (textAnswer == null && (selectedOptionIds == null || selectedOptionIds.isEmpty)) {
      return null;
    }

    return Input$AnswerInput(
      questionId: questionId,
      textAnswer: textAnswer,
      selectedOptionIds: selectedOptionIds,
      otherText: otherText,
    );
  }

  List<Input$AnswerInput> _parseRawAnswersMap(Map<String, dynamic> rawAnswers) {
    final parsed = <Input$AnswerInput>[];
    final otherTextKeys = rawAnswers.keys.where((k) => k.endsWith('_other')).toSet();

    rawAnswers.forEach((key, value) {
      final questionId = key.toString();
      if (otherTextKeys.contains(questionId) || value == null) {
        return;
      }

      String? textAnswer;
      List<String>? selectedOptionIds;

      if (value is List && value.isNotEmpty) {
        selectedOptionIds = value
            .where((e) => e != null)
            .map((e) => e.toString())
            .toList();
      } else if (value is String && value.isNotEmpty) {
        if (_looksLikeOptionId(value)) {
          selectedOptionIds = [value];
        } else {
          textAnswer = value;
        }
      }

      String? otherText;
      final radioOther = rawAnswers['${questionId}_other'];
      if (radioOther is String && radioOther.trim().isNotEmpty) {
        otherText = radioOther.trim();
      }

      if (value is List) {
        for (final optionId in value) {
          final optionOther = rawAnswers['${questionId}_${optionId}_other'];
          if (optionOther is String && optionOther.trim().isNotEmpty) {
            otherText = optionOther.trim();
            break;
          }
        }
      } else if (value is String) {
        final optionOther = rawAnswers['${questionId}_${value}_other'];
        if (optionOther is String && optionOther.trim().isNotEmpty) {
          otherText = optionOther.trim();
        }
      }

      if ((textAnswer != null && textAnswer.isNotEmpty) ||
          (selectedOptionIds != null && selectedOptionIds.isNotEmpty)) {
        parsed.add(
          Input$AnswerInput(
            questionId: questionId,
            textAnswer: textAnswer,
            selectedOptionIds: selectedOptionIds,
            otherText: otherText,
          ),
        );
      }
    });

    return parsed;
  }

  bool _looksLikeOptionId(String answer) {
    if (!answer.contains(' ') && answer.length >= 16 && answer.length < 60) {
      if (RegExp(r'^[A-Za-z0-9+/]+=*$').hasMatch(answer)) return true;
    }

    if (!answer.contains(' ') && answer.length == 36) {
      if (RegExp(r'^[a-fA-F0-9\-]+$').hasMatch(answer)) return true;
    }

    return false;
  }

  /// Check if the survey version has changed since the offline submission was created
  Future<String?> _checkSurveyVersionConflict({
    required String surveyId,
    required DateTime cachedVersion,
    String? language,
  }) async {
    try {
      // Fetch current survey to check version
      final currentSurvey = await _surveyService.getSurvey(
        surveyId,
        language: language,
      );
      if (currentSurvey == null) {
        return null; // Can't check version if survey not found
      }

      // Get server's updatedAt
      final serverVersion = currentSurvey.updatedAt;

      // Check if server version is newer than cached version
      if (serverVersion.isAfter(cachedVersion)) {
        final difference = serverVersion.difference(cachedVersion);
        return 'Survey updated ${_formatDuration(difference)} after your cache';
      }

      return null; // No conflict
    } catch (e) {
      debugPrint('SyncManager: Error checking survey version: $e');
      return null; // Can't check, proceed anyway
    }
  }

  String _formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays} day${duration.inDays > 1 ? 's' : ''}';
    } else if (duration.inHours > 0) {
      return '${duration.inHours} hour${duration.inHours > 1 ? 's' : ''}';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes} minute${duration.inMinutes > 1 ? 's' : ''}';
    } else {
      return '${duration.inSeconds} second${duration.inSeconds > 1 ? 's' : ''}';
    }
  }

  /// Mark a submission as having a conflict (for user review)
  Future<void> _markSubmissionAsConflict(String localId, String reason) async {
    final submission = await _storage.getOfflineSubmission(localId);
    if (submission != null) {
      // Update the submission with conflict info
      // For now, we keep it in storage but could add a conflict flag
      debugPrint(
        'SyncManager: Marked submission $localId as conflict: $reason',
      );
    }
  }

  Future<void> _processAnswerSave(SyncQueueItem item) async {
    final data = item.data;
    final submissionId = data['submissionId'] as String;

    debugPrint(
      'SyncManager: Processing answer save - Queue Item ID: ${item.id}, Question: ${data['questionId']}, Submission: $submissionId',
    );

    // CRITICAL FIX: Skip saveAnswer operations for local submissions
    // Local submissions don't exist on the backend yet, so saveAnswer will fail
    // These answers will be sent when the full submission is synced via submitSurvey
    if (submissionId.startsWith('local_')) {
      debugPrint(
        'SyncManager: Skipping answer save for local submission $submissionId - will be sent with full submission',
      );
      await _addSyncLog(
        operationType: 'answer',
        status: SyncStatus.completed,
        message: 'Answer is stored inside the pending local submission',
        localId: submissionId,
        questionId: data['questionId'] as String?,
      );
      // Don't throw error - just skip this operation
      // The answers are already stored locally and will be sent via submitSurvey
      return;
    }

    final questionId = data['questionId'] as String;
    try {
      await _surveyService.saveAnswer(
        submissionId: submissionId,
        questionId: questionId,
        textAnswer: data['textAnswer'] as String?,
        selectedOptionIds: (data['selectedOptionIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        otherText: data['otherText'] as String?,
      );
      await _addSyncLog(
        operationType: 'answer',
        status: SyncStatus.completed,
        message: 'Answer synced successfully',
        questionId: questionId,
        serverSubmissionId: submissionId,
      );
    } catch (e) {
      await _addSyncLog(
        operationType: 'answer',
        status: SyncStatus.failed,
        message: 'Answer sync failed: $e',
        questionId: questionId,
        serverSubmissionId: submissionId,
      );
      rethrow;
    }

    debugPrint(
      'SyncManager: Successfully saved answer for question ${data['questionId']}, Queue Item ID: ${item.id} will be marked completed',
    );
  }

  Future<void> _processFileUpload(SyncQueueItem item) async {
    // Re-fetch the item from DB to get the latest data
    // This is important because the submission ID may have been updated
    // after the survey submission was synced
    final freshItem = await _storage.getSyncQueueItem(item.id!);
    if (freshItem == null) {
      debugPrint('SyncManager: File upload queue item ${item.id} not found');
      return;
    }

    final data = freshItem.data;
    final localPath = data['localPath'] as String;
    final submissionId = data['submissionId'] as String;

    // Check if submission ID is still local - if so, check if the submission exists
    if (submissionId.startsWith('local_')) {
      // Check if the offline submission actually exists
      final offlineSubmission = await _storage.getOfflineSubmission(
        submissionId,
      );
      if (offlineSubmission == null) {
        // Orphan file upload - the submission was never created or was deleted
        debugPrint(
          'SyncManager: Orphan file upload for non-existent submission $submissionId - removing from queue',
        );
        // Mark as completed to remove from queue
        await _storage.updateSyncQueueItem(
          freshItem.copyWith(status: SyncStatus.completed),
        );
        // Mark pending file as uploaded so it is cleaned up and not re-queued forever
        await _storage.markFileUploadedByPath(localPath);
        // Also try to delete the file since it's no longer needed
        await _deleteUploadedFile(localPath);
        return;
      }

      if (offlineSubmission.status == OfflineSubmissionStatus.draft) {
        debugPrint(
          'SyncManager: Removing file upload queue for draft $submissionId - will requeue after submit',
        );
        await _storage.updateSyncQueueItem(
          freshItem.copyWith(status: SyncStatus.completed),
        );
        await _addSyncLog(
          operationType: freshItem.operationType.name,
          status: SyncStatus.pending,
          message: 'Draft file kept local until survey is submitted',
          localId: submissionId,
        );
        return;
      }

      debugPrint(
        'SyncManager: Skipping file upload for local submission $submissionId - waiting for submission sync',
      );
      await _addSyncLog(
        operationType: freshItem.operationType.name,
        status: SyncStatus.pending,
        message: 'Waiting for survey submission before uploading file',
        localId: submissionId,
      );
      throw Exception(
        'Submission not yet synced - will retry after submission syncs',
      );
    }

    final file = await _getFileFromPath(localPath);
    if (file == null) {
      debugPrint(
        'SyncManager: Missing file at $localPath - marking pending file as uploaded to prevent sync loop',
      );
      await _storage.markFileUploadedByPath(localPath);
      await _addSyncLog(
        operationType: freshItem.operationType.name,
        status: SyncStatus.failed,
        message: 'File missing on device, skipped upload',
        serverSubmissionId: submissionId,
      );
      return;
    }

    try {
      await _addSyncLog(
        operationType: freshItem.operationType.name,
        status: SyncStatus.syncing,
        message: freshItem.operationType == SyncOperationType.uploadSignature
            ? 'Uploading signature'
            : 'Uploading photo',
        serverSubmissionId: submissionId,
      );
      if (freshItem.operationType == SyncOperationType.uploadSignature) {
        await _submissionService.uploadSignatureImage(submissionId, file);
      } else {
        await _submissionService.uploadPhotoImage(submissionId, file);
      }
    } catch (e) {
      await _addSyncLog(
        operationType: freshItem.operationType.name,
        status: SyncStatus.failed,
        message: 'File upload failed: $e',
        serverSubmissionId: submissionId,
      );
      rethrow;
    }

    // Mark file as uploaded in the pending_files table
    await _storage.markFileUploadedByPath(localPath);

    // Clean up the local file after successful upload
    await _deleteUploadedFile(localPath);
    await _addSyncLog(
      operationType: freshItem.operationType.name,
      status: SyncStatus.completed,
      message: freshItem.operationType == SyncOperationType.uploadSignature
          ? 'Signature uploaded successfully'
          : 'Photo uploaded successfully',
      serverSubmissionId: submissionId,
    );

    debugPrint(
      'SyncManager: Successfully uploaded file for submission $submissionId',
    );
  }

  /// Get a File from a path, verifying it exists
  Future<File?> _getFileFromPath(String path) async {
    try {
      final file = File(path);
      if (await file.exists()) {
        return file;
      }
      debugPrint('SyncManager: File does not exist at $path');
      return null;
    } catch (e) {
      debugPrint('SyncManager: Error accessing file at $path: $e');
      return null;
    }
  }

  /// Delete a file after successful upload
  Future<void> _deleteUploadedFile(String path) async {
    try {
      await OfflineFileStorageService.instance.deleteFile(path);
    } catch (e) {
      debugPrint('SyncManager: Error deleting uploaded file: $e');
    }
  }

  /// Get offline submissions waiting to be synced
  Future<List<OfflineSubmission>> getUnsyncedSubmissions() async {
    return await _storage.getUnsyncedSubmissions();
  }

  /// Get sync queue statistics
  Future<Map<String, int>> getQueueStats() async {
    return await _storage.getStorageStats();
  }

  /// Re-read pending counts after debug/test code writes directly to storage.
  Future<void> refreshPendingCount() async {
    await _updatePendingCount();
  }

  /// Cancel a pending sync item
  Future<bool> cancelPendingItem(int itemId) async {
    final item = await _storage.getSyncQueueItem(itemId);
    if (item == null || item.status != SyncStatus.pending) {
      return false;
    }

    await _storage.updateSyncQueueItem(
      item.copyWith(status: SyncStatus.completed),
    );
    await _updatePendingCount();
    return true;
  }

  /// Let in-flight uploads finish before deleting their server records.
  Future<void> pauseForAccountDeletion() async {
    _pausedForAccountDeletion = true;
    _syncTimer?.cancel();
    while (_isSyncing) {
      await Future<void>.delayed(const Duration(milliseconds: 100));
    }
  }

  void resumeAfterAccountDeletion() {
    _pausedForAccountDeletion = false;
    if (_connectivity.isOnline && _pendingCount > 0) _scheduleSyncSoon();
  }

  /// Clear all sync data
  Future<void> clearAll() async {
    await _storage.clearAllData();
    await _updatePendingCount();
    _lastSyncResult = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _syncTimer?.cancel();
    _connectivitySubscription?.cancel();
    _syncProgressController.close();
    super.dispose();
  }
}

/// Progress update for sync operations
class SyncProgress {
  final SyncStatus status;
  final String message;
  final int? current;
  final int? total;

  SyncProgress({
    required this.status,
    required this.message,
    this.current,
    this.total,
  });

  double? get progress {
    if (current == null || total == null || total == 0) return null;
    return current! / total!;
  }
}

/// Exception thrown when survey version conflict is detected during sync
class SurveyVersionConflictException implements Exception {
  final String message;

  SurveyVersionConflictException(this.message);

  @override
  String toString() => 'SurveyVersionConflictException: $message';
}
