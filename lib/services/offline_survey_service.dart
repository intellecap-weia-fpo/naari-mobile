import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../graphql/queries/surveys.graphql.dart';
import '../schema.graphql.dart';
import 'connectivity_service.dart';
import 'offline_file_storage_service.dart';
import 'offline_storage_service.dart';
import 'survey_service.dart';
import 'submission_service.dart';
import 'sync_manager.dart';

/// Service that wraps survey operations with offline support
/// Use this instead of SurveyService directly for offline-aware operations
class OfflineSurveyService {
  static OfflineSurveyService? _instance;
  static OfflineSurveyService get instance =>
      _instance ??= OfflineSurveyService._();

  OfflineSurveyService._();

  final ConnectivityService _connectivity = ConnectivityService.instance;
  final OfflineStorageService _storage = OfflineStorageService.instance;
  final SurveyService _surveyService = SurveyService.instance;
  final SyncManager _syncManager = SyncManager.instance;

  /// Cache duration for surveys (default: 30 days)
  Duration cacheDuration = const Duration(days: 30);

  static const String _basicCacheLanguage = '__basic__';
  static const String _listCacheLanguage = '__list__';

  /// Fetch basic survey info with offline fallback
  Future<Query$SurveyBasic$survey?> getSurveyBasic(
    String id, {
    bool forceRefresh = false,
  }) async {
    final isOnline = _connectivity.isOnline;

    if (isOnline) {
      try {
        final survey = await _surveyService.getSurveyBasic(
          id,
          fetchPolicy: forceRefresh ? FetchPolicy.networkOnly : null,
        );
        // Cache the survey JSON for offline access
        if (survey != null) {
          try {
            final surveyJson = jsonEncode(survey.toJson());
            final cached = CachedSurvey(
              id: survey.id,
              surveyJson: surveyJson,
              language: _basicCacheLanguage,
              expiresAt: DateTime.now().add(cacheDuration),
              surveyUpdatedAt: survey.updatedAt,
            );
            await _storage.cacheSurvey(cached);
            debugPrint('OfflineSurvey: Cached basic survey $id');
          } catch (e) {
            debugPrint('OfflineSurvey: Error caching basic survey: $e');
          }
        }
        return survey;
      } catch (e) {
        debugPrint('OfflineSurvey: Error fetching basic survey: $e');
        // Fallback to cache
      }
    }

    // Offline or error - try cache using the __basic__ language tag
    debugPrint('OfflineSurvey: getSurveyBasic - trying cache for $id');
    final cached = await _storage.getCachedSurvey(
      id,
      language: _basicCacheLanguage,
    );
    debugPrint(
      'OfflineSurvey: getSurveyBasic - cached result: ${cached != null ? 'found' : 'null'}',
    );
    if (cached != null) {
      try {
        final json = jsonDecode(cached.surveyJson);
        debugPrint(
          'OfflineSurvey: getSurveyBasic - parsed JSON, keys: ${json is Map ? json.keys.toList() : 'not a map'}',
        );
        // Try to parse as SurveyBasic first
        try {
          final result = Query$SurveyBasic$survey.fromJson(json);
          debugPrint(
            'OfflineSurvey: getSurveyBasic - successfully parsed as SurveyBasic',
          );
          return result;
        } catch (e) {
          debugPrint(
            'OfflineSurvey: Could not parse as SurveyBasic: $e, trying to extract basic fields',
          );
        }

        // If that fails, the cache might contain a full Survey object
        // Try to extract the basic fields manually and create a SurveyBasic object
        // The JSON structure has the same base fields, just with extra data
        if (json is Map<String, dynamic>) {
          // Check if this is an old list query entry (no consent data) - skip it
          if (json['consentText'] == null &&
              (json['consentTranslations'] == null ||
                  (json['consentTranslations'] as List).isEmpty)) {
            debugPrint(
              'OfflineSurvey: getSurveyBasic - __basic__ entry lacks consent data, skipping to full cache',
            );
            // Fall through to full survey cache below
          } else {
            // Create a new map with only the fields needed for SurveyBasic
            final basicJson = <String, dynamic>{
              'id': json['id'] ?? id,
              'submissionCount': json['submissionCount'] ?? 0,
              'title': json['title'] ?? 'Untitled Survey',
              'description': json['description'],
              'isActive': json['isActive'] ?? true,
              'visibility': json['visibility'] ?? 'PRIVATE',
              'consentText': json['consentText'],
              'endDate': json['endDate'],
              'allowMultipleSubmissions':
                  json['allowMultipleSubmissions'] ?? false,
              'defaultLanguage': json['defaultLanguage'] ?? 'EN',
              'availableLanguages': json['availableLanguages'] ?? ['en'],
              'hasSubmitted': json['hasSubmitted'] ?? false,
              'updatedAt':
                  json['updatedAt'] ?? DateTime.now().toIso8601String(),
              'consentTranslations': json['consentTranslations'] ?? [],
              '__typename': json['__typename'] ?? 'SurveyNode',
            };

            debugPrint(
              'OfflineSurvey: getSurveyBasic - extracted basic fields, trying to parse',
            );
            final result = Query$SurveyBasic$survey.fromJson(basicJson);
            debugPrint(
              'OfflineSurvey: getSurveyBasic - successfully created from basic fields',
            );
            return result;
          }
        }
      } catch (e, stack) {
        debugPrint(
          'OfflineSurvey: Error deserializing cached survey as basic: $e',
        );
        debugPrint('OfflineSurvey: Stack: $stack');
      }
    }

    // Fallback: try any full survey cache entry and extract basic fields
    debugPrint(
      'OfflineSurvey: getSurveyBasic - no __basic__ cache, trying full survey cache for $id',
    );
    final fullCached = await _findCachedFullSurvey(id);
    if (fullCached != null) {
      try {
        final json = jsonDecode(fullCached.surveyJson);
        if (json is Map<String, dynamic>) {
          final basicJson = <String, dynamic>{
            'id': json['id'] ?? id,
            'submissionCount': json['submissionCount'] ?? 0,
            'title': json['title'] ?? 'Untitled Survey',
            'description': json['description'],
            'isActive': json['isActive'] ?? true,
            'visibility': json['visibility'] ?? 'PRIVATE',
            'consentText': json['consentText'],
            'endDate': json['endDate'],
            'allowMultipleSubmissions':
                json['allowMultipleSubmissions'] ?? false,
            'defaultLanguage': json['defaultLanguage'] ?? 'EN',
            'availableLanguages': json['availableLanguages'] ?? ['en'],
            'hasSubmitted': json['hasSubmitted'] ?? false,
            'updatedAt': json['updatedAt'] ?? DateTime.now().toIso8601String(),
            'consentTranslations': json['consentTranslations'] ?? [],
            '__typename': json['__typename'] ?? 'SurveyNode',
          };
          final result = Query$SurveyBasic$survey.fromJson(basicJson);
          debugPrint(
            'OfflineSurvey: getSurveyBasic - created from full survey cache (language: ${fullCached.language})',
          );
          return result;
        }
      } catch (e) {
        debugPrint(
          'OfflineSurvey: Error extracting basic from full survey cache: $e',
        );
      }
    }

    debugPrint('OfflineSurvey: getSurveyBasic - returning null for $id');
    return null;
  }

  /// Fetch survey with offline fallback
  ///
  /// If online: fetches from server and caches the result
  /// If offline: returns cached data if available
  Future<Query$Survey$survey?> getSurvey(
    String id, {
    String? language,
    bool forceRefresh = false,
  }) async {
    final isOnline = _connectivity.isOnline;

    debugPrint(
      'OfflineSurvey: getSurvey called - id: $id, language: $language, isOnline: $isOnline',
    );

    // If forceRefresh, skip cache and fetch from server
    if (forceRefresh && isOnline) {
      try {
        final survey = await _surveyService.getSurvey(id, language: language);
        if (survey != null) {
          await _cacheSurvey(id, survey, language);
          return survey;
        }
      } catch (e) {
        debugPrint('OfflineSurvey: Error fetching survey: $e');
        rethrow;
      }
    }

    // First, try to get from cache (fast path — instant if already downloaded)
    final cached = await _storage.getCachedSurvey(id, language: language);
    if (cached != null && !cached.isExpired) {
      final survey = _deserializeSurvey(cached.surveyJson);
      if (survey != null) {
        debugPrint(
          'OfflineSurvey: Returning cached survey $id (language: $language)',
        );
        return survey;
      }
    }

    // Fallback: look for any cached FULL survey for this ID
    final cachedFull = await _findCachedFullSurvey(
      id,
      preferredLanguage: language,
    );
    if (cachedFull != null && !cachedFull.isExpired) {
      final survey = _deserializeSurvey(cachedFull.surveyJson);
      if (survey != null) {
        debugPrint(
          'OfflineSurvey: Returning fallback cached survey $id (language: ${cachedFull.language})',
        );
        return survey;
      }
    }

    // Cache miss or expired — fetch from server if online
    if (isOnline) {
      try {
        final survey = await _surveyService.getSurvey(id, language: language);
        if (survey != null) {
          await _cacheSurvey(id, survey, language);
          return survey;
        }
      } catch (e) {
        debugPrint('OfflineSurvey: Error fetching survey: $e');
        // Use expired cache as fallback
        if (cached != null) {
          debugPrint('OfflineSurvey: Using expired cache as fallback');
          final survey = _deserializeSurvey(cached.surveyJson);
          if (survey != null) return survey;
        }
        rethrow;
      }
    }

    // Offline with expired or no cache
    if (cached != null) {
      debugPrint('OfflineSurvey: Offline, using expired cache for $id');
      final survey = _deserializeSurvey(cached.surveyJson);
      if (survey != null) return survey;
    }

    debugPrint('OfflineSurvey: Survey $id not available offline');
    return null;
  }

  /// Get accessible surveys with offline caching
  Future<List<Query$AccessibleSurveys$accessibleSurveys$edges$node>>
  getAccessibleSurveys({
    int? first = 20,
    String? after,
    bool forceRefresh = false,
  }) async {
    final isOnline = _connectivity.isOnline;
    debugPrint(
      'OfflineSurvey: getAccessibleSurveys called - isOnline: $isOnline, forceRefresh: $forceRefresh',
    );

    if (isOnline && !forceRefresh) {
      try {
        final surveys = await _surveyService.getAccessibleSurveys(
          first: first,
          after: after,
        );

        debugPrint(
          'OfflineSurvey: Fetched ${surveys.length} surveys from server',
        );

        // Cache each survey for offline access
        for (final survey in surveys) {
          await _cacheSurveyBasic(survey);
        }

        return surveys;
      } catch (e) {
        debugPrint('OfflineSurvey: Error fetching surveys: $e');
        // Fallback to cache
      }
    }

    debugPrint('OfflineSurvey: Using offline cache for surveys');
    // Offline or error - return cached surveys
    try {
      final cachedSurveys = await _storage.getAllCachedSurveys();
      final List<Query$AccessibleSurveys$accessibleSurveys$edges$node> results =
          [];
      final seenSurveyIds = <String>{};

      debugPrint(
        'OfflineSurvey: Found ${cachedSurveys.length} cached surveys for offline',
      );

      for (final cached in cachedSurveys) {
        debugPrint(
          'OfflineSurvey: Processing cached survey - db id: ${cached.id}, language: "${cached.language}"',
        );
        try {
          final Map<String, dynamic> json = jsonDecode(cached.surveyJson);
          debugPrint('OfflineSurvey: JSON id field: ${json['id']}');
          // Try to deserialize as list node first
          try {
            final node =
                Query$AccessibleSurveys$accessibleSurveys$edges$node.fromJson(
                  json,
                );
            if (seenSurveyIds.add(node.id)) {
              results.add(node);
            }
            debugPrint(
              'OfflineSurvey: Successfully parsed as AccessibleSurveys node',
            );
            continue;
          } catch (e) {
            // Might be a full Survey object, try to extract fields
            debugPrint(
              'OfflineSurvey: Could not parse as AccessibleSurveys: $e',
            );
          }

          // Extract fields for AccessibleSurveys node from potentially different survey types
          // Use default values for required fields that may be null in full Survey objects
          final now = DateTime.now().toIso8601String();

          // Shared surveys can outlive their creator's account.
          final createdByJson = json['createdBy'];

          final accessibleJson = <String, dynamic>{
            'id': json['id'],
            'title': json['title'] ?? 'Untitled Survey',
            'description': json['description'],
            'isActive': json['isActive'] ?? true,
            'visibility': json['visibility'] ?? 'PRIVATE',
            'createdAt': json['createdAt'] ?? json['updatedAt'] ?? now,
            'updatedAt': json['updatedAt'] ?? now,
            'endDate': json['endDate'],
            'createdBy': createdByJson,
            'submissionCount': json['submissionCount'] ?? 0,
            'hasSubmitted': json['hasSubmitted'] ?? false,
            '__typename': 'SurveyNode',
          };

          debugPrint(
            'OfflineSurvey: Extracted accessibleJson id: ${accessibleJson['id']}',
          );
          final node =
              Query$AccessibleSurveys$accessibleSurveys$edges$node.fromJson(
                accessibleJson,
              );
          if (seenSurveyIds.add(node.id)) {
            results.add(node);
          }
          debugPrint(
            'OfflineSurvey: Successfully created from extracted fields',
          );
        } catch (e) {
          debugPrint(
            'OfflineSurvey: Error deserializing cached survey ${cached.id}: $e',
          );
        }
      }

      debugPrint(
        'OfflineSurvey: Successfully deserialized ${results.length} surveys for offline',
      );
      return results;
    } catch (e) {
      debugPrint('OfflineSurvey: Error retrieving cached surveys: $e');
      return [];
    }
  }

  /// Submit survey with offline queuing
  ///
  /// If online: submits immediately
  /// If offline: queues for later sync and returns a local ID
  ///
  /// The survey version is automatically retrieved from cache to enable
  /// conflict detection during sync.
  Future<SubmitResult> submitSurveyWithOfflineSupport({
    required String surveyId,
    required List<Input$AnswerInput> answers,
    String? language,
    double? latitude,
    double? longitude,
    String? localSubmissionId,
    String? submissionId,
  }) async {
    final isOnline = _connectivity.isOnline;

    // Get the cached survey version for conflict detection
    final surveyVersion = await getCachedSurveyVersion(
      surveyId,
      language: language,
    );

    if (isOnline) {
      try {
        final resultId = await _surveyService.submitSurveyWithLocation(
          surveyId: surveyId,
          answers: answers,
          language: language,
          latitude: latitude,
          longitude: longitude,
          submissionId: submissionId,
        );

        if (resultId == null || resultId.isEmpty) {
          throw Exception('Server did not return a submission ID');
        }
        final serverSubmissionId = resultId;

        if (localSubmissionId != null) {
          try {
            await _storage.updatePendingFileSubmissionIds(
              localSubmissionId,
              serverSubmissionId,
            );
            await _storage.deleteOfflineSubmission(localSubmissionId);
          } catch (e) {
            debugPrint(
              'OfflineSurvey: Failed to update local submission references for $localSubmissionId: $e',
            );
          }
        }

        return SubmitResult(
          success: true,
          isOffline: false,
          submissionId: serverSubmissionId,
          message: 'Survey submitted successfully',
        );
      } catch (e) {
        debugPrint('OfflineSurvey: Online submission failed: $e');

        // If submission failed, queue for retry with survey version
        final localId = await _syncManager.queueSurveySubmission(
          surveyId: surveyId,
          answers: answers,
          language: language,
          latitude: latitude,
          longitude: longitude,
          surveyVersionUsed: surveyVersion,
          localId: localSubmissionId,
          serverSubmissionId: submissionId,
        );

        return SubmitResult(
          success: true,
          isOffline: true,
          localId: localId,
          message: 'Saved offline - will sync when connected',
        );
      }
    }

    // Offline - queue for later sync with survey version
    final localId = await _syncManager.queueSurveySubmission(
      surveyId: surveyId,
      answers: answers,
      language: language,
      latitude: latitude,
      longitude: longitude,
      surveyVersionUsed: surveyVersion,
      localId: localSubmissionId,
      serverSubmissionId: submissionId,
    );

    return SubmitResult(
      success: true,
      isOffline: true,
      localId: localId,
      message: 'Saved offline - will sync when connected',
    );
  }

  /// Save/update draft answers locally for a submission
  /// This stores all current answers to SQLite so they can be restored later
  /// Works for both online and offline modes - always saves locally as a backup
  /// The lastGroupIndex parameter tracks the question group the user was on for resuming
  /// When offline, also queues the draft for sync when connectivity is restored
  Future<void> saveDraftAnswers({
    required String submissionId,
    required String surveyId,
    required Map<String, dynamic> answers,
    String? language,
    double? latitude,
    double? longitude,
    DateTime? surveyVersionUsed,
    int? lastGroupIndex,
    Map<String, String>? questionTypes,
    String? serverSubmissionId,
  }) async {
    if (answers.isEmpty) {
      debugPrint('OfflineSurvey: No answers to save for draft $submissionId');
      return;
    }

    // Convert answers map to the format expected by the submission
    final answersJson = jsonEncode(answers);

    // Use the new saveDraft method which properly sets the draft status
    await _storage.saveDraft(
      localId: submissionId,
      surveyId: surveyId,
      answersJson: answersJson,
      language: language,
      latitude: latitude,
      longitude: longitude,
      surveyVersionUsed: surveyVersionUsed,
      lastGroupIndex: lastGroupIndex,
      serverSubmissionId: serverSubmissionId,
    );

    // When offline, queue draft for sync when connectivity is restored.
    // When online, the draft is saved to backend directly via _saveAllAnswersToBackend
    // in survey_form_page.dart, so we don't need to queue it here.
    if (!_connectivity.isOnline) {
      await _syncManager.queueDraftSubmission(
        localId: submissionId,
        surveyId: surveyId,
        rawAnswers: answers,
        language: language,
        latitude: latitude,
        longitude: longitude,
        surveyVersionUsed: surveyVersionUsed,
        questionTypes: questionTypes,
      );
      debugPrint(
        'OfflineSurvey: Draft kept local until submit (submission: $submissionId)',
      );
    }

    debugPrint(
      'OfflineSurvey: Saved draft with ${answers.length} answers for submission $submissionId (group: $lastGroupIndex)',
    );
  }

  /// Load draft answers from local storage
  /// Returns the answers map or null if no draft exists
  Future<Map<String, dynamic>?> loadDraftAnswers(String submissionId) async {
    final submission = await _storage.getOfflineSubmission(submissionId);
    if (submission == null) {
      debugPrint('OfflineSurvey: No draft found for $submissionId');
      return null;
    }
    debugPrint(
      'OfflineSurvey: Loaded draft for $submissionId with ${submission.answers.length} answers',
    );
    return submission.answers;
  }

  /// Delete draft answers from local storage
  Future<void> deleteDraftAnswers(String submissionId) async {
    await _storage.deleteOfflineSubmission(submissionId);
    debugPrint('OfflineSurvey: Deleted draft for $submissionId');
  }

  /// Save answer with offline queuing
  Future<void> saveAnswerWithOfflineSupport({
    required String submissionId,
    required String questionId,
    String? textAnswer,
    List<String>? selectedOptionIds,
    String? otherText,
  }) async {
    final isOnline = _connectivity.isOnline;

    // If submission ID is local (not yet synced to server), always queue locally
    final isLocalSubmission = submissionId.startsWith('local_');

    if (isOnline && !isLocalSubmission) {
      try {
        await _surveyService.saveAnswer(
          submissionId: submissionId,
          questionId: questionId,
          textAnswer: textAnswer,
          selectedOptionIds: selectedOptionIds,
          otherText: otherText,
        );
        return;
      } catch (e) {
        debugPrint('OfflineSurvey: Online save failed, queuing: $e');
      }
    }

    // For local submissions, DON'T queue individual answer saves
    // They will be sent all at once via submitSurvey when user clicks submit
    if (isLocalSubmission) {
      debugPrint(
        'OfflineSurvey: Local submission $submissionId - answer stored locally, will sync on submit',
      );
      return; // Answers are already stored locally
    }

    // Queue for later sync (offline with real backend submission ID)
    await _syncManager.queueAnswerSave(
      submissionId: submissionId,
      questionId: questionId,
      textAnswer: textAnswer,
      selectedOptionIds: selectedOptionIds,
      otherText: otherText,
    );
  }

  /// Pre-cache surveys for offline use
  /// Call this when user views survey list to prepare for offline access
  Future<void> preCacheSurveys(
    List<String> surveyIds, {
    String? language,
  }) async {
    if (!_connectivity.isOnline) {
      debugPrint('OfflineSurvey: Cannot pre-cache while offline');
      return;
    }

    for (final id in surveyIds) {
      try {
        final survey = await _surveyService.getSurvey(id, language: language);
        if (survey != null) {
          await _cacheSurvey(id, survey, language);
          debugPrint('OfflineSurvey: Pre-cached survey $id');
        }
      } catch (e) {
        debugPrint('OfflineSurvey: Failed to pre-cache survey $id: $e');
      }
    }
  }

  /// Check if a survey is available offline
  Future<bool> isSurveyAvailableOffline(String id, {String? language}) async {
    final cached = await _storage.getCachedSurvey(id, language: language);
    return cached != null && !cached.isExpired;
  }

  /// Check which surveys from the server list have newer versions than cached.
  /// Returns a list of survey titles that need re-downloading.
  /// Only checks surveys that have been previously downloaded (cached).
  /// Compares against full downloaded survey cache (excludes __basic__ entries
  /// which are refreshed on every survey list load).
  Future<List<String>> getOutdatedSurveyTitles(
    List<Query$AccessibleSurveys$accessibleSurveys$edges$node> serverSurveys,
  ) async {
    final allCached = await _storage.getAllCachedSurveys();

    debugPrint(
      'OfflineSurvey: getOutdatedSurveyTitles - ${allCached.length} cached entries, ${serverSurveys.length} server surveys',
    );

    // Build a map of surveyId -> newest surveyUpdatedAt from full downloads only.
    // We use the newest because if any language was downloaded with the current
    // server version, the survey content is current. Older language downloads
    // may have stale timestamps from a previous survey version.
    final cachedVersions = <String, DateTime>{};
    for (final cached in allCached) {
      debugPrint(
        'OfflineSurvey:   cached entry - id: ${cached.id}, lang: "${cached.language}", updatedAt: ${cached.surveyUpdatedAt}',
      );
      if (cached.language == _basicCacheLanguage ||
          cached.language == _listCacheLanguage)
        continue;
      if (cached.surveyUpdatedAt == null) continue;

      final existing = cachedVersions[cached.id];
      if (existing == null || cached.surveyUpdatedAt!.isAfter(existing)) {
        cachedVersions[cached.id] = cached.surveyUpdatedAt!;
      }
    }

    debugPrint(
      'OfflineSurvey: cachedVersions (full downloads only): ${cachedVersions.entries.map((e) => '${e.key}: ${e.value}').join(', ')}',
    );

    final outdated = <String>[];
    for (final survey in serverSurveys) {
      final cachedVersion = cachedVersions[survey.id];
      if (cachedVersion == null) {
        debugPrint(
          'OfflineSurvey:   ${survey.title} (${survey.id}) - no full download cached, skipping',
        );
        continue;
      }

      final cachedSeconds = cachedVersion.millisecondsSinceEpoch ~/ 1000;
      final serverSeconds = survey.updatedAt.millisecondsSinceEpoch ~/ 1000;

      debugPrint(
        'OfflineSurvey:   ${survey.title} - server: ${survey.updatedAt} ($serverSeconds) vs cached: $cachedVersion ($cachedSeconds) → ${serverSeconds > cachedSeconds ? "OUTDATED" : "OK"}',
      );

      if (serverSeconds > cachedSeconds) {
        outdated.add(survey.title);
      }
    }
    debugPrint('OfflineSurvey: outdated surveys: $outdated');
    return outdated;
  }

  /// Get the cached survey version (updatedAt) for conflict detection
  Future<DateTime?> getCachedSurveyVersion(
    String id, {
    String? language,
  }) async {
    final cached = await _storage.getCachedSurvey(id, language: language);
    return cached?.surveyUpdatedAt;
  }

  /// Get offline submission by local ID
  Future<OfflineSubmission?> getOfflineSubmission(String localId) async {
    return await _storage.getOfflineSubmission(localId);
  }

  /// Upload file with offline support
  ///
  /// If online and has real server submission ID: uploads directly to server
  /// If offline or local submission ID: saves file reference for later sync
  Future<Map<String, dynamic>> uploadFileWithOfflineSupport({
    required String submissionId,
    required File file,
    required String fileType, // 'signature' or 'photo'
  }) async {
    final isOnline = _connectivity.isOnline;

    // If submission ID is local (not yet synced to server), always queue for later
    final isLocalSubmission = submissionId.startsWith('local_');

    // IMPORTANT: On iOS, temp files from image_picker can be cleaned up immediately.
    // We ALWAYS copy to persistent storage FIRST before any async operations.
    // This ensures we have the file even if iOS cleans up the temp directory.
    // On Android, this also provides a reliable backup in case upload fails.
    String persistedPath = file.path;

    try {
      final offlineFileType = fileType == 'signature'
          ? OfflineFileType.signature
          : OfflineFileType.photo;

      // Copy file immediately to prevent iOS temp file cleanup
      // This works on both iOS and Android
      persistedPath = await OfflineFileStorageService.instance
          .copyToOfflineStorage(
            sourcePath: file.path,
            fileType: offlineFileType,
            customFileName:
                '${submissionId}_$fileType${_getFileExtension(file.path)}',
          );
      debugPrint(
        'OfflineSurvey: Copied $fileType to persistent storage: $persistedPath',
      );
    } catch (e) {
      debugPrint(
        'OfflineSurvey: Error copying $fileType to persistent storage: $e',
      );
      // Continue with original path as fallback, but this may fail on iOS
    }

    // Try to upload if online and has a real server submission ID
    if (isOnline && !isLocalSubmission) {
      try {
        // Use the persisted file for upload
        final fileToUpload = File(persistedPath);

        Map<String, dynamic> result;
        if (fileType == 'signature') {
          result = await SubmissionService.instance.uploadSignatureImage(
            submissionId,
            fileToUpload,
          );
        } else {
          result = await SubmissionService.instance.uploadPhotoImage(
            submissionId,
            fileToUpload,
          );
        }

        // Upload succeeded - clean up the persisted file
        try {
          await OfflineFileStorageService.instance.deleteFile(persistedPath);
          debugPrint(
            'OfflineSurvey: Cleaned up persisted $fileType after successful upload',
          );
        } catch (e) {
          debugPrint('OfflineSurvey: Error cleaning up persisted file: $e');
        }

        return result;
      } catch (e) {
        debugPrint('OfflineSurvey: Error uploading $fileType online: $e');
        // Fall through to queue for offline sync - file is already persisted
      }
    }

    // Offline, local submission, or upload error - queue sync with persisted path
    await _syncManager.queueFileUpload(
      submissionId: submissionId,
      localPath: persistedPath,
      fileType: fileType,
    );

    // Return the persisted path to display in UI
    return {'${fileType}_url': persistedPath, 'is_offline': true};
  }

  /// Get file extension from path
  String _getFileExtension(String path) {
    final lastDot = path.lastIndexOf('.');
    if (lastDot == -1) return '';
    return path.substring(lastDot);
  }

  /// Clear cached survey data
  Future<void> clearCache() async {
    await _storage.clearExpiredCache();
  }

  // ==================== PRIVATE HELPERS ====================

  Future<void> _cacheSurvey(
    String id,
    Query$Survey$survey survey,
    String? language,
  ) async {
    try {
      final surveyJson = jsonEncode(survey.toJson());

      // Extract updatedAt from survey for version tracking
      final surveyUpdatedAt = survey.updatedAt;

      final cached = CachedSurvey(
        id: id,
        surveyJson: surveyJson,
        language: language,
        expiresAt: DateTime.now().add(cacheDuration),
        surveyUpdatedAt: surveyUpdatedAt,
      );
      await _storage.cacheSurvey(cached);
      debugPrint(
        'OfflineSurvey: Cached survey $id with version ${surveyUpdatedAt.toIso8601String()}',
      );
    } catch (e) {
      debugPrint('OfflineSurvey: Error caching survey: $e');
    }
  }

  Future<void> _cacheSurveyBasic(
    Query$AccessibleSurveys$accessibleSurveys$edges$node survey,
  ) async {
    try {
      final surveyJson = jsonEncode(survey.toJson());

      // Extract updatedAt from survey for version tracking
      DateTime? surveyUpdatedAt = survey.updatedAt;

      final cached = CachedSurvey(
        id: survey.id,
        surveyJson: surveyJson,
        language: _listCacheLanguage,
        expiresAt: DateTime.now().add(cacheDuration),
        surveyUpdatedAt: surveyUpdatedAt,
      );
      await _storage.cacheSurvey(cached);
    } catch (e) {
      debugPrint('OfflineSurvey: Error caching basic survey: $e');
    }
  }

  Future<CachedSurvey?> _findCachedFullSurvey(
    String id, {
    String? preferredLanguage,
  }) async {
    final allCached = await _storage.getAllCachedSurveys();
    final candidates = allCached
        .where(
          (s) =>
              s.id == id &&
              s.language != _basicCacheLanguage &&
              s.language != _listCacheLanguage,
        )
        .toList();

    // If a specific language is requested, ONLY return that language
    // Do NOT fall back to other languages as this causes wrong translations
    if (preferredLanguage != null) {
      for (final candidate in candidates) {
        if (candidate.language == preferredLanguage &&
            _isLikelyFullSurveyJson(candidate.surveyJson)) {
          return candidate;
        }
      }
      // Don't fall back to any language when specific language was requested
      debugPrint(
        'OfflineSurvey: No full survey cache for $id with language $preferredLanguage',
      );
      return null;
    }

    // Only allow fallback to any language when NO specific language was requested
    for (final candidate in candidates) {
      if (_isLikelyFullSurveyJson(candidate.surveyJson)) {
        return candidate;
      }
    }

    return null;
  }

  bool _isLikelyFullSurveyJson(String json) {
    try {
      final Map<String, dynamic> data = jsonDecode(json);
      return data.containsKey('pages') || data.containsKey('questions');
    } catch (_) {
      return false;
    }
  }

  Query$Survey$survey? _deserializeSurvey(String json) {
    try {
      final Map<String, dynamic> data = jsonDecode(json);
      debugPrint(
        'OfflineSurvey: Deserializing survey with keys: ${data.keys.toList()}',
      );
      final survey = Query$Survey$survey.fromJson(data);
      debugPrint(
        'OfflineSurvey: Successfully deserialized survey: ${survey.id}',
      );
      return survey;
    } catch (e, stack) {
      debugPrint('OfflineSurvey: Error deserializing survey: $e');
      debugPrint('OfflineSurvey: Stack trace: $stack');
      return null;
    }
  }
}

/// Result of a submit operation
class SubmitResult {
  final bool success;
  final bool isOffline;
  final String? localId;
  final String? submissionId;
  final String message;
  final String? error;

  SubmitResult({
    required this.success,
    required this.isOffline,
    this.localId,
    this.submissionId,
    required this.message,
    this.error,
  });
}
