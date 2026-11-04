import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'connectivity_service.dart';
import 'offline_storage_service.dart';
import 'offline_survey_service.dart';
import 'survey_service.dart';
import '../utils/language_utils.dart';

/// Status of the offline download process
enum OfflineDownloadStatus { idle, downloading, completed, failed, cancelled }

/// Progress update for offline download
class OfflineDownloadProgress {
  final OfflineDownloadStatus status;
  final int totalSurveys;
  final int downloadedSurveys;
  final int totalItems; // total language downloads across all surveys
  final int downloadedItems; // language downloads completed so far
  final String? currentSurveyTitle;
  final String? currentDetail; // e.g. "Downloading Hindi..."
  final String? errorMessage;
  final DateTime? completedAt;

  OfflineDownloadProgress({
    required this.status,
    this.totalSurveys = 0,
    this.downloadedSurveys = 0,
    this.totalItems = 0,
    this.downloadedItems = 0,
    this.currentSurveyTitle,
    this.currentDetail,
    this.errorMessage,
    this.completedAt,
  });

  double get progress {
    if (totalItems > 0) return downloadedItems / totalItems;
    if (totalSurveys == 0) return 0.0;
    return downloadedSurveys / totalSurveys;
  }

  bool get isComplete => status == OfflineDownloadStatus.completed;
  bool get isDownloading => status == OfflineDownloadStatus.downloading;
  bool get hasFailed => status == OfflineDownloadStatus.failed;
}

/// Manager for downloading surveys for offline use
/// Handles bulk downloading after login with progress tracking
class OfflineDownloadManager extends ChangeNotifier {
  static OfflineDownloadManager? _instance;
  static OfflineDownloadManager get instance =>
      _instance ??= OfflineDownloadManager._();

  OfflineDownloadManager._();

  final ConnectivityService _connectivity = ConnectivityService.instance;
  final SurveyService _surveyService = SurveyService.instance;
  final OfflineSurveyService _offlineSurveyService =
      OfflineSurveyService.instance;
  final OfflineStorageService _storage = OfflineStorageService.instance;

  // Download state
  OfflineDownloadStatus _status = OfflineDownloadStatus.idle;
  int _totalSurveys = 0;
  int _downloadedSurveys = 0;
  int _totalItems = 0; // total language downloads
  int _downloadedItems = 0; // language downloads completed
  String? _currentSurveyTitle;
  String? _currentDetail;
  String? _errorMessage;
  DateTime? _lastDownloadAt;
  bool _isCancelled = false;

  // Progress stream
  final _progressController =
      StreamController<OfflineDownloadProgress>.broadcast();
  Stream<OfflineDownloadProgress> get progressStream =>
      _progressController.stream;

  // Getters
  OfflineDownloadStatus get status => _status;
  int get totalSurveys => _totalSurveys;
  int get downloadedSurveys => _downloadedSurveys;
  String? get currentSurveyTitle => _currentSurveyTitle;
  String? get errorMessage => _errorMessage;
  DateTime? get lastDownloadAt => _lastDownloadAt;
  bool get isDownloading => _status == OfflineDownloadStatus.downloading;
  bool get isReady =>
      _status == OfflineDownloadStatus.completed && _lastDownloadAt != null;

  OfflineDownloadProgress get currentProgress => OfflineDownloadProgress(
    status: _status,
    totalSurveys: _totalSurveys,
    downloadedSurveys: _downloadedSurveys,
    totalItems: _totalItems,
    downloadedItems: _downloadedItems,
    currentSurveyTitle: _currentSurveyTitle,
    currentDetail: _currentDetail,
    errorMessage: _errorMessage,
    completedAt: _lastDownloadAt,
  );

  // SharedPreferences keys
  static const String _lastDownloadKey = 'offline_last_download_at';
  static const String _downloadedSurveyCountKey =
      'offline_downloaded_survey_count';

  /// Initialize the download manager and restore last download state
  Future<void> initialize() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final lastDownloadTimestamp = prefs.getInt(_lastDownloadKey);

      if (lastDownloadTimestamp != null) {
        _lastDownloadAt = DateTime.fromMillisecondsSinceEpoch(
          lastDownloadTimestamp,
        );
        _downloadedSurveys = prefs.getInt(_downloadedSurveyCountKey) ?? 0;
        _status = OfflineDownloadStatus.completed;
        notifyListeners();
      }

      debugPrint(
        'OfflineDownloadManager: Initialized, last download: $_lastDownloadAt',
      );
    } catch (e) {
      debugPrint('OfflineDownloadManager: Error initializing: $e');
    }
  }

  /// Check if we need to download surveys (based on TTL)
  bool shouldDownload({Duration ttl = const Duration(days: 30)}) {
    if (_lastDownloadAt == null) return true;
    return DateTime.now().difference(_lastDownloadAt!) > ttl;
  }

  // Language codes that have been removed from support
  // Keep in sync with survey_detail_page.dart's _getAvailableLanguages()
  static const Set<String> _removedLanguages = {
    'brx',
    'doi',
    'ks',
    'ne',
    'sa',
    'sat',
    'sd',
    'ur',
  };

  /// Download a specific survey for offline use
  /// Returns true if download was successful
  Future<bool> downloadSurvey({
    required String surveyId,
    required String surveyTitle,
    required List<String> languages,
    bool forceRefresh = true,
  }) async {
    if (_status == OfflineDownloadStatus.downloading) {
      debugPrint('OfflineDownloadManager: Download already in progress');
      return false;
    }

    if (!_connectivity.isOnline) {
      _setError('Cannot download while offline');
      return false;
    }

    _isCancelled = false;
    _status = OfflineDownloadStatus.downloading;
    _totalSurveys = 1;
    _downloadedSurveys = 0;
    _totalItems = languages.length;
    _downloadedItems = 0;
    _currentSurveyTitle = surveyTitle;
    _currentDetail = 'Checking for updates...';
    _errorMessage = null;
    _emitProgress();
    notifyListeners();

    try {
      // Check if the survey has been updated since last download.
      // IMPORTANT: We must check ALL requested languages, not just the first.
      // A previous download may have only cached some languages, so we need to
      // identify which ones are missing and download them.
      final serverSurvey = await _offlineSurveyService.getSurveyBasic(
        surveyId,
        forceRefresh: true,
      );

      // Determine which languages actually need downloading
      List<String> languagesToDownload = List.from(languages);

      if (serverSurvey != null) {
        final serverUpdatedAt = serverSurvey.updatedAt;
        final serverSeconds = serverUpdatedAt.millisecondsSinceEpoch ~/ 1000;

        // Check each requested language against its cached version
        final List<String> alreadyCached = [];
        for (final language in languages) {
          final cached = await _storage.getCachedSurvey(
            surveyId,
            language: language,
          );
          if (cached != null && cached.surveyUpdatedAt != null) {
            final cachedSeconds =
                cached.surveyUpdatedAt!.millisecondsSinceEpoch ~/ 1000;
            if (cachedSeconds == serverSeconds) {
              alreadyCached.add(language);
              debugPrint(
                'OfflineDownloadManager: Language $language already up-to-date for survey $surveyId',
              );
            }
          }
        }

        // Remove already-cached languages from the download list
        languagesToDownload.removeWhere((lang) => alreadyCached.contains(lang));

        // If ALL languages are already cached and up-to-date, skip download
        if (languagesToDownload.isEmpty) {
          debugPrint(
            'OfflineDownloadManager: Survey $surveyId is already up-to-date for all ${languages.length} languages (updatedAt: $serverUpdatedAt)',
          );
          _downloadedSurveys = 1;
          _downloadedItems = languages.length;
          _currentSurveyTitle = null;
          _currentDetail = null;
          _errorMessage = 'already_up_to_date'; // Signal for UI
          _setCompleted();
          return true;
        }

        // Some languages already cached — count them as pre-downloaded
        _downloadedItems = alreadyCached.length;
        debugPrint(
          'OfflineDownloadManager: ${alreadyCached.length} languages already cached, '
          '${languagesToDownload.length} to download: $languagesToDownload',
        );
      }

      _currentDetail = 'Preparing...';
      _emitProgress();
      notifyListeners();

      for (final language in languagesToDownload) {
        if (_isCancelled) {
          _setCancelled();
          return false;
        }

        if (!_connectivity.isOnline) {
          _setError('Lost connection during download');
          return false;
        }

        _currentDetail = 'Downloading ${_languageDisplayName(language)}...';
        _emitProgress();
        notifyListeners();

        final survey = await _offlineSurveyService.getSurvey(
          surveyId,
          language: language,
          forceRefresh: forceRefresh,
        );

        if (survey == null) {
          debugPrint(
            'OfflineDownloadManager: WARNING - getSurvey returned null for language $language',
          );
        }

        _downloadedItems++;
        _emitProgress();
        notifyListeners();
      }

      _downloadedSurveys = 1;
      _emitProgress();
      notifyListeners();

      _setCompleted();
      return true;
    } catch (e) {
      debugPrint('OfflineDownloadManager: Download failed: $e');
      _setError(e.toString());
      return false;
    }
  }

  /// Download all accessible surveys for offline use
  /// Returns true if download was successful
  ///
  /// When [languages] is not provided, the manager fetches each survey's
  /// availableLanguages from the server and downloads ALL of them (excluding
  /// removed languages). This ensures the offline language-selection bottom
  /// sheet shows the correct set of languages.
  Future<bool> downloadAllSurveys({
    List<String>? languages,
    bool forceRefresh = true,
  }) async {
    final normalizedLanguages = languages
        ?.map((l) => l.toLowerCase().trim())
        .where((l) => l.isNotEmpty)
        .toSet()
        .toList();
    // If explicit languages were passed, use them; otherwise we'll
    // derive per-survey languages from getSurveyBasic below.
    final bool usePerSurveyLanguages =
        normalizedLanguages == null || normalizedLanguages.isEmpty;

    if (_status == OfflineDownloadStatus.downloading) {
      debugPrint('OfflineDownloadManager: Download already in progress');
      return false;
    }

    if (!_connectivity.isOnline) {
      _setError('Cannot download while offline');
      return false;
    }

    // Check if we need to download (based on TTL)
    if (!forceRefresh && !shouldDownload()) {
      debugPrint('OfflineDownloadManager: Surveys are up to date');
      return true;
    }

    _isCancelled = false;
    _status = OfflineDownloadStatus.downloading;
    _totalSurveys = 0;
    _downloadedSurveys = 0;
    _totalItems = 0;
    _downloadedItems = 0;
    _currentSurveyTitle = null;
    _currentDetail = 'Fetching survey list...';
    _errorMessage = null;
    _emitProgress();
    notifyListeners();

    try {
      // Step 1: Get list of accessible surveys
      debugPrint('OfflineDownloadManager: Fetching accessible surveys...');
      final surveys = await _surveyService.getAccessibleSurveys(first: 100);

      if (_isCancelled) {
        _setCancelled();
        return false;
      }

      _totalSurveys = surveys.length;
      _emitProgress();
      notifyListeners();

      if (surveys.isEmpty) {
        _setCompleted();
        return true;
      }

      debugPrint(
        'OfflineDownloadManager: Found ${surveys.length} surveys to download',
      );

      // Step 2: Download full survey data for each survey
      for (int i = 0; i < surveys.length; i++) {
        if (_isCancelled) {
          _setCancelled();
          return false;
        }

        if (!_connectivity.isOnline) {
          _setError('Lost connection during download');
          return false;
        }

        final surveyBasic = surveys[i];
        _currentSurveyTitle = surveyBasic.title;
        _currentDetail = 'Preparing ${surveyBasic.title}...';
        _emitProgress();
        notifyListeners();

        try {
          // Determine which languages to download for this survey
          List<String> languagesToDownload;

          if (usePerSurveyLanguages) {
            // Fetch the survey's basic info to get its availableLanguages
            final basicInfo = await _offlineSurveyService.getSurveyBasic(
              surveyBasic.id,
            );

            if (basicInfo?.availableLanguages != null &&
                basicInfo!.availableLanguages!.isNotEmpty) {
              languagesToDownload = basicInfo.availableLanguages!
                  .where(
                    (lang) =>
                        lang != null &&
                        !_removedLanguages.contains(lang.toLowerCase()),
                  )
                  .map((lang) => lang!.toLowerCase())
                  .toSet() // deduplicate
                  .toList();
            } else {
              // Fallback if availableLanguages is empty/null
              languagesToDownload = const ['en', 'hi'];
            }

            debugPrint(
              'OfflineDownloadManager: Survey ${surveyBasic.id} languages: $languagesToDownload',
            );
          } else {
            languagesToDownload = normalizedLanguages;
          }

          // Update total items now that we know this survey's language count
          _totalItems += languagesToDownload.length;
          _emitProgress();
          notifyListeners();

          // Download full survey in each language
          for (final language in languagesToDownload) {
            if (_isCancelled) break;
            _currentDetail = 'Downloading ${_languageDisplayName(language)}...';
            _emitProgress();
            notifyListeners();

            await _offlineSurveyService.getSurvey(
              surveyBasic.id,
              language: language,
              forceRefresh: true,
            );

            _downloadedItems++;
            _emitProgress();
            notifyListeners();
          }

          _downloadedSurveys = i + 1;
          _emitProgress();
          notifyListeners();

          debugPrint(
            'OfflineDownloadManager: Downloaded survey ${i + 1}/${surveys.length}: ${surveyBasic.title}',
          );
        } catch (e) {
          debugPrint(
            'OfflineDownloadManager: Error downloading survey ${surveyBasic.id}: $e',
          );
          // Continue with next survey instead of failing completely
        }
      }

      _setCompleted();
      return true;
    } catch (e) {
      debugPrint('OfflineDownloadManager: Download failed: $e');
      _setError(e.toString());
      return false;
    }
  }

  /// Cancel the current download
  void cancelDownload() {
    if (_status == OfflineDownloadStatus.downloading) {
      _isCancelled = true;
      debugPrint('OfflineDownloadManager: Download cancelled');
    }
  }

  /// Clear all cached surveys and reset download state
  Future<void> clearCache() async {
    await _storage.clearAllData();
    await resetDownloadState();
    debugPrint('OfflineDownloadManager: Cache cleared');
  }

  /// Reset the visible/persisted download state without touching SQLite data.
  Future<void> resetDownloadState() async {
    _lastDownloadAt = null;
    _downloadedSurveys = 0;
    _totalSurveys = 0;
    _totalItems = 0;
    _downloadedItems = 0;
    _currentSurveyTitle = null;
    _currentDetail = null;
    _errorMessage = null;
    _status = OfflineDownloadStatus.idle;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_lastDownloadKey);
    await prefs.remove(_downloadedSurveyCountKey);

    _emitProgress();
    notifyListeners();
    debugPrint('OfflineDownloadManager: Download state reset');
  }

  /// Get a human-readable language name for progress display
  String _languageDisplayName(String code) {
    return LanguageUtils.getLanguageName(code) ?? code.toUpperCase();
  }

  void _setCompleted() {
    _status = OfflineDownloadStatus.completed;
    _lastDownloadAt = DateTime.now();
    _currentSurveyTitle = null;
    _currentDetail = null;
    _saveDownloadState();
    _emitProgress();
    notifyListeners();
    debugPrint('OfflineDownloadManager: Download completed');
  }

  void _setError(String message) {
    _status = OfflineDownloadStatus.failed;
    _errorMessage = message;
    _currentSurveyTitle = null;
    _currentDetail = null;
    _emitProgress();
    notifyListeners();
  }

  void _setCancelled() {
    _status = OfflineDownloadStatus.cancelled;
    _currentSurveyTitle = null;
    _currentDetail = null;
    _emitProgress();
    notifyListeners();
    debugPrint('OfflineDownloadManager: Download cancelled');
  }

  void _emitProgress() {
    _progressController.add(currentProgress);
  }

  Future<void> _saveDownloadState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (_lastDownloadAt != null) {
        await prefs.setInt(
          _lastDownloadKey,
          _lastDownloadAt!.millisecondsSinceEpoch,
        );
        await prefs.setInt(_downloadedSurveyCountKey, _downloadedSurveys);
      }
    } catch (e) {
      debugPrint('OfflineDownloadManager: Error saving download state: $e');
    }
  }

  /// Get a human-readable status message
  String getStatusMessage() {
    switch (_status) {
      case OfflineDownloadStatus.idle:
        return 'Not downloaded';
      case OfflineDownloadStatus.downloading:
        if (_currentSurveyTitle != null) {
          return 'Downloading: $_currentSurveyTitle';
        }
        return 'Downloading surveys...';
      case OfflineDownloadStatus.completed:
        if (_lastDownloadAt != null) {
          final ago = DateTime.now().difference(_lastDownloadAt!);
          if (ago.inMinutes < 1) return 'Just updated';
          if (ago.inHours < 1) return 'Updated ${ago.inMinutes}m ago';
          if (ago.inDays < 1) return 'Updated ${ago.inHours}h ago';
          return 'Updated ${ago.inDays}d ago';
        }
        return 'Ready for offline use';
      case OfflineDownloadStatus.failed:
        return _errorMessage ?? 'Download failed';
      case OfflineDownloadStatus.cancelled:
        return 'Download cancelled';
    }
  }

  @override
  void dispose() {
    _progressController.close();
    super.dispose();
  }
}
