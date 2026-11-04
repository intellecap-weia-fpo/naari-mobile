import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../graphql/queries/submissions.graphql.dart';
import '../graphql/queries/surveys.graphql.dart';
import '../schema.graphql.dart';
import '../models/survey_mode.dart';
import '../services/auth_service.dart';
import '../services/connectivity_service.dart';
import '../services/location_service.dart';
import '../services/offline_storage_service.dart';
import '../services/offline_survey_service.dart';
import '../services/submission_service.dart';
import '../services/survey_service.dart';
import '../services/tts_service.dart';
import '../utils/language_utils.dart';
import '../widgets/app_version_text.dart';
import '../widgets/language_download_tutorial_dialog.dart';
import '../widgets/sync_status_widget.dart';

class SurveyDetailPage extends StatefulWidget {
  final String surveyId;

  const SurveyDetailPage({super.key, required this.surveyId});

  @override
  State<SurveyDetailPage> createState() => _SurveyDetailPageState();
}

class _SurveyDetailPageState extends State<SurveyDetailPage>
    with WidgetsBindingObserver {
  Query$SurveyBasic$survey? _survey;
  bool _isLoadingSurvey = true;
  String? _surveyError;
  List<Fragment$SubmissionListItem> _submissions = [];
  List<OfflineSubmission> _pendingOfflineSubmissions = [];
  List<OfflineSubmission> _drafts = []; // Draft submissions that can be resumed
  bool _isLoadingSubmission = false;
  bool _hasNoSubmissions = false;
  bool _isStartingSurvey = false;
  StreamSubscription<bool>? _connectivitySubscription;

  // Pagination variables
  bool _hasNextPage = false;
  String? _endCursor;
  bool _isLoadingMore = false;
  static const int _pageSize = 5;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Load survey first (fast), then conditionally load submissions
    _loadInitialData();

    // Listen for connectivity changes to refresh submissions when coming online
    _connectivitySubscription = ConnectivityService
        .instance
        .onConnectivityChanged
        .listen(_onConnectivityChanged);
  }

  void _onConnectivityChanged(bool isOnline) {
    if (isOnline && mounted) {
      // When coming online, refresh submissions to sync and load from server
      debugPrint(
        'SurveyDetailPage: Connectivity restored, refreshing submissions',
      );
      _loadMySubmission();
    }
  }

  Future<void> _loadInitialData() async {
    // Load survey first - this is fast with the lightweight query
    await _loadSurvey();

    // Always load drafts (even if user hasn't submitted before)
    // Must await to ensure drafts are loaded before checking isEmpty
    await _loadDrafts();

    // Only load submissions if user has actually submitted before
    // This saves a network call for users who haven't submitted yet
    if (_survey?.hasSubmitted == true) {
      _loadMySubmission(); // Don't await - let it load in background
    } else {
      // No submissions to load, but we may still have drafts
      if (mounted) {
        setState(() {
          _isLoadingSubmission = false;
          _hasNoSubmissions = _drafts.isEmpty;
        });
      }
    }

    // Request location permission in background (non-blocking)
    LocationService.instance.ensurePermission();
  }

  /// Load drafts for this survey
  Future<void> _loadDrafts() async {
    try {
      final drafts = await OfflineStorageService.instance.getDraftsForSurvey(
        widget.surveyId,
      );
      if (mounted) {
        setState(() {
          _drafts = drafts;
        });
      }
      debugPrint('SurveyDetailPage: Loaded ${drafts.length} drafts');
    } catch (e) {
      debugPrint('SurveyDetailPage: Error loading drafts: $e');
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // Refresh data when app becomes visible again (after returning from survey form)
    if (state == AppLifecycleState.resumed && mounted) {
      _refreshData();
    }
  }

  Future<void> _refreshData() async {
    await _loadSurvey();
    await _loadDrafts();
    if (_survey?.hasSubmitted == true) {
      await _loadMySubmission();
    }
  }

  Future<void> _loadSurvey() async {
    debugPrint('SurveyDetailPage: Loading survey with id: ${widget.surveyId}');
    setState(() {
      _isLoadingSurvey = true;
      _surveyError = null;
    });

    try {
      // Use OfflineSurveyService
      final survey = await OfflineSurveyService.instance.getSurveyBasic(
        widget.surveyId,
      );

      debugPrint(
        'SurveyDetailPage: getSurveyBasic returned: ${survey != null ? 'survey with id ${survey.id}' : 'null'}',
      );

      if (mounted) {
        setState(() {
          _survey = survey;
          _isLoadingSurvey = false;
        });
      }
    } catch (e, stack) {
      debugPrint('Error loading survey: $e\n$stack');
      if (mounted) {
        setState(() {
          _surveyError = e.toString();
          _isLoadingSurvey = false;
        });
      }
    }
  }

  Future<void> _loadMySubmission({bool loadMore = false}) async {
    if (loadMore && !_hasNextPage) return;

    setState(() {
      if (loadMore) {
        _isLoadingMore = true;
      } else {
        _isLoadingSubmission = true;
        _submissions.clear(); // Clear existing submissions for fresh load
      }
    });

    // Always load drafts for this survey
    try {
      final drafts = await OfflineStorageService.instance.getDraftsForSurvey(
        widget.surveyId,
      );
      if (mounted) {
        setState(() {
          _drafts = drafts;
        });
      }
      debugPrint('SurveyDetailPage: Loaded ${drafts.length} drafts');
    } catch (e) {
      debugPrint('SurveyDetailPage: Error loading drafts: $e');
    }

    // Always load pending offline submissions for this survey
    try {
      final pendingSubmissions = await OfflineStorageService.instance
          .getOfflineSubmissionsForSurvey(widget.surveyId);
      // Show every completed offline submission waiting to sync, including
      // submissions linked to an existing server draft.
      final unsynced = pendingSubmissions.where((s) => s.isPendingSync).toList();
      if (mounted) {
        setState(() {
          _pendingOfflineSubmissions = unsynced;
        });
      }
    } catch (e) {
      debugPrint('SurveyDetailPage: Error loading offline submissions: $e');
    }

    // Skip server fetch if offline
    if (!ConnectivityService.instance.isOnline) {
      if (mounted) {
        setState(() {
          _isLoadingSubmission = false;
          _isLoadingMore = false;
          // Show "no submissions" only if we have no offline submissions either
          _hasNoSubmissions =
              _submissions.isEmpty && _pendingOfflineSubmissions.isEmpty;
        });
      }
      return;
    }

    try {
      // Use lightweight query for faster response
      final result = await SubmissionService.instance
          .getMySubmissionsList(
            first: _pageSize,
            after: loadMore ? _endCursor : null,
            surveyId: widget.surveyId,
          );

      final submissions =
          result['submissions'] as List<Fragment$SubmissionListItem>;
      final pageInfo =
          result['pageInfo'] as Query$MySubmissionsList$mySubmissions$pageInfo?;

      if (mounted) {
        setState(() {
          if (loadMore) {
            _submissions.addAll(submissions);
          } else {
            _submissions = submissions;
            _hasNoSubmissions =
                _submissions.isEmpty && _pendingOfflineSubmissions.isEmpty;
          }

          // Sort submissions by submittedAt descending (newest first)
          _submissions.sort((a, b) => b.submittedAt.compareTo(a.submittedAt));

          // Update pagination state from GraphQL pageInfo
          _hasNextPage = pageInfo?.hasNextPage ?? false;
          _endCursor = pageInfo?.endCursor;

          _isLoadingSubmission = false;
          _isLoadingMore = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingSubmission = false;
          _isLoadingMore = false;
        });
      }
    }
  }

  String _formatEndDate(String? dateString) {
    if (dateString == null) return 'No end date';

    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = date.difference(now);

      if (difference.isNegative) {
        return 'Expired on ${date.day}/${date.month}/${date.year}';
      } else if (difference.inDays == 0) {
        return 'Ends today';
      } else if (difference.inDays == 1) {
        return 'Ends tomorrow';
      } else if (difference.inDays <= 7) {
        return 'Ends in ${difference.inDays} days';
      } else {
        return 'Ends on ${date.day}/${date.month}/${date.year}';
      }
    } catch (e) {
      return dateString;
    }
  }

  bool _isExpired(String? dateString) {
    if (dateString == null) return false;

    try {
      final date = DateTime.parse(dateString);
      return DateTime.now().isAfter(date);
    } catch (e) {
      return false;
    }
  }

  String _getLanguageName(String languageCode) {
    final languageMap = {
      'en': 'English',
      'es': 'Spanish',
      'fr': 'French',
      'de': 'German',
      'ko': 'Korean',
      'hi': 'Hindi',
      'ja': 'Japanese',
      'zh': 'Chinese',
      'ar': 'Arabic',
      'pt': 'Portuguese',
      'ru': 'Russian',
      'it': 'Italian',
      'nl': 'Dutch',
      'sv': 'Swedish',
      'da': 'Danish',
      'no': 'Norwegian',
      'fi': 'Finnish',
      'as': 'Assamese',
      'bn': 'Bengali',
      'gu': 'Gujarati',
      'kn': 'Kannada',
      'kok': 'Konkani',
      'mai': 'Maithili',
      'ml': 'Malayalam',
      'mni': 'Manipuri',
      'mr': 'Marathi',
      'or': 'Odia',
      'pa': 'Punjabi',
      'ta': 'Tamil',
      'te': 'Telugu',
    };

    return languageMap[languageCode.toLowerCase()] ?? languageCode;
  }

  String? _getConsentTextForLanguage(
    String languageCode,
    Query$SurveyBasic$survey survey,
  ) {
    final translations = survey.consentTranslations ?? [];

    // 1) Try exact match for selected language
    final exact = translations.firstWhere(
      (t) => t?.language.name.toLowerCase() == languageCode.toLowerCase(),
      orElse: () => null,
    );
    if ((exact?.consentText ?? '').trim().isNotEmpty) return exact!.consentText;

    // 2) Try default survey language
    final defaultLang = survey.defaultLanguage.name.toLowerCase();
    final byDefault = translations.firstWhere(
      (t) => t?.language.name.toLowerCase() == defaultLang,
      orElse: () => null,
    );
    if ((byDefault?.consentText ?? '').trim().isNotEmpty) {
      return byDefault!.consentText;
    }

    // 3) Fallback to the main consentText field (from the GraphQL query)
    if (survey.consentText != null && survey.consentText!.trim().isNotEmpty) {
      return survey.consentText;
    }

    // 4) Fallback to any available translation text
    final any = translations.firstWhere(
      (t) => (t?.consentText ?? '').trim().isNotEmpty,
      orElse: () => null,
    );
    return any?.consentText;
  }

  List<String> _prioritizeLanguages(List<String> languages) {
    const priority = ['en', 'hi', 'te'];

    final seen = <String>{};
    final normalized = <String>[];
    for (final language in languages) {
      final code = language.toLowerCase();
      if (seen.add(code)) {
        normalized.add(code);
      }
    }

    normalized.sort((a, b) {
      final aIndex = priority.indexOf(a);
      final bIndex = priority.indexOf(b);

      if (aIndex != -1 && bIndex != -1) {
        return aIndex.compareTo(bIndex);
      }
      if (aIndex != -1) return -1;
      if (bIndex != -1) return 1;
      return a.compareTo(b);
    });

    return normalized;
  }

  List<String> _getAvailableLanguages() {
    if (_survey == null) return ['en'];

    // Language codes that have been removed from support
    const removedLanguages = {
      'brx',
      'doi',
      'ks',
      'ne',
      'sa',
      'sat',
      'sd',
      'ur',
    };

    final availableLanguages =
        _survey?.availableLanguages
            ?.where(
              (lang) =>
                  lang != null &&
                  !removedLanguages.contains(lang.toLowerCase()),
            )
            .cast<String>()
            .toList() ??
        ['en'];

    return _prioritizeLanguages(availableLanguages);
  }

  /// Get available languages, filtering to only cached languages when offline.
  /// When online, returns all available languages from the survey metadata.
  /// When offline, uses cached languages from SQLite as the source of truth,
  /// since the cached __basic__ survey JSON may not include availableLanguages.
  Future<List<String>> _getAvailableLanguagesFiltered() async {
    final all = _getAvailableLanguages();

    if (ConnectivityService.instance.isOnline) {
      return _prioritizeLanguages(all);
    }

    // Language codes that have been removed from support
    const removedLanguages = {
      'brx',
      'doi',
      'ks',
      'ne',
      'sa',
      'sat',
      'sd',
      'ur',
    };

    // Offline: only show languages that are actually cached
    final cachedLanguages = await OfflineStorageService.instance
        .getCachedLanguagesForSurvey(widget.surveyId);

    if (cachedLanguages.isEmpty) {
      // Nothing cached at all — return the full list so the user at least
      // sees what *should* be available (they'll get an error when loading).
      return all;
    }

    // Check if the survey metadata actually has availableLanguages populated.
    // The cached __basic__ JSON often doesn't include this field, so
    // _getAvailableLanguages() falls back to ['en'] which is unreliable.
    final hasReliableMetadata =
        _survey?.availableLanguages != null &&
        _survey!.availableLanguages!.length > 1;

    if (hasReliableMetadata) {
      // We have real metadata — intersect with cached languages
      final cachedSet = cachedLanguages.map((l) => l.toLowerCase()).toSet();
      final filtered = all
          .where((l) => cachedSet.contains(l.toLowerCase()))
          .toList();

      if (filtered.isNotEmpty) {
        return _prioritizeLanguages(filtered);
      }
    }

    // No reliable metadata from survey, or intersection was empty.
    // Use cached languages directly as the source of truth, filtering out
    // removed languages.
    final filteredCached = cachedLanguages
        .where((l) => !removedLanguages.contains(l.toLowerCase()))
        .toList();

    return _prioritizeLanguages(
      filteredCached.isNotEmpty ? filteredCached : cachedLanguages,
    );
  }

  Future<void> _showLanguageSelection(BuildContext context) async {
    // Use already loaded survey data instead of fetching again
    if (_survey == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Survey data not available')),
      );
      return;
    }

    final fullSurvey = _survey!;
    final languageCodes = await _getAvailableLanguagesFiltered();

    if (!context.mounted) return;

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.onSurfaceVariant.withOpacity(0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Select Language',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: languageCodes.length,
                itemBuilder: (context, index) {
                  final languageCode = languageCodes[index];
                  final languageName = _getLanguageName(languageCode);

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(languageName),
                      subtitle: Text(languageCode.toUpperCase()),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tileColor: Theme.of(context).colorScheme.surfaceVariant,
                      onTap: () {
                        Navigator.of(context).pop();
                        _showConsentDialog(context, languageCode, fullSurvey);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Show language selection dialog when editing a submission with no stored language
  Future<void> _showLanguageSelectionForEdit(
    BuildContext context,
    String responseId,
  ) async {
    if (_survey == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Survey data not available')),
      );
      return;
    }

    final languageCodes = await _getAvailableLanguagesFiltered();

    if (!context.mounted) return;

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.onSurfaceVariant.withOpacity(0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Language to Edit',
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Choose the language in which you submitted this survey',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: languageCodes.length,
                itemBuilder: (context, index) {
                  final languageCode = languageCodes[index];
                  final languageName = _getLanguageName(languageCode);

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(languageName),
                      subtitle: Text(languageCode.toUpperCase()),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tileColor: Theme.of(context).colorScheme.surfaceVariant,
                      onTap: () async {
                        Navigator.of(context).pop();
                        // Store the selected language for future edits
                        await SubmissionService.instance
                            .storeSubmissionLanguage(responseId, languageCode);
                        // Proceed to mode selection with the selected language
                        _showModeSelection(
                          context,
                          languageCode,
                          responseId: responseId,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Generate a hash of the consent text for version tracking
  /// Uses simple hashCode-based hashing (no external dependencies)
  String _generateConsentVersionHash(Query$SurveyBasic$survey survey) {
    final consentData = StringBuffer();
    consentData.write(survey.consentText ?? '');
    consentData.write(survey.defaultLanguage.name);

    // Include all consent translations
    final translations = survey.consentTranslations ?? [];
    for (final t in translations) {
      if (t != null) {
        consentData.write(t.language.name);
        consentData.write(t.consentText ?? '');
      }
    }

    // Simple hash using Dart's built-in hashCode
    // Combined with string length for better uniqueness
    final str = consentData.toString();
    final hash = str.hashCode;
    return '${hash.abs()}_${str.length}';
  }

  /// Save consent acceptance to offline storage
  Future<void> _saveConsentAcceptance(
    String surveyId,
    String language,
    String consentVersionHash,
  ) async {
    final userId = AuthService.instance.user?.id;
    await OfflineStorageService.instance.saveConsentAcceptance(
      surveyId: surveyId,
      language: language,
      consentVersionHash: consentVersionHash,
      userId: userId,
    );
  }

  /// Check if consent has been previously accepted
  Future<bool> _hasAcceptedConsent(
    String surveyId,
    String language,
    String consentVersionHash,
  ) async {
    final userId = AuthService.instance.user?.id;
    return await OfflineStorageService.instance.hasAcceptedConsent(
      surveyId: surveyId,
      language: language,
      consentVersionHash: consentVersionHash,
      userId: userId,
    );
  }

  void _showConsentDialog(
    BuildContext context,
    String selectedLanguage,
    Query$SurveyBasic$survey survey,
  ) async {
    final consentText = _getConsentTextForLanguage(selectedLanguage, survey);
    final theme = Theme.of(context);

    // If no consent text is available, show a simple confirmation dialog
    // instead of skipping straight to mode selection.
    final showGenericConfirm =
        (consentText == null || consentText.trim().isEmpty);

    debugPrint(
      'Survey: Consent dialog for $selectedLanguage - hasConsentText: ${consentText != null && consentText.trim().isNotEmpty}, showGeneric: $showGenericConfirm',
    );
    debugPrint(
      'Survey: consentTranslations count: ${survey.consentTranslations?.length ?? 0}, defaultLanguage: ${survey.defaultLanguage.name}',
    );

    // Generate consent version hash for tracking
    final consentVersionHash = _generateConsentVersionHash(survey);

    // Check if consent has been previously accepted (for offline scenarios)
    final hasAccepted = await _hasAcceptedConsent(
      survey.id,
      selectedLanguage,
      consentVersionHash,
    );

    debugPrint(
      'Survey: Consent check - hasAccepted: $hasAccepted, hash: $consentVersionHash',
    );

    if (!mounted) return;

    // Get consent title based on selected language
    String getConsentTitle(String languageCode) {
      return LanguageUtils.getConsentAgreementTitle(languageCode);
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useSafeArea: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurfaceVariant.withOpacity(0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      getConsentTitle(selectedLanguage),
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  showGenericConfirm
                      ? 'Do you agree to proceed with the survey?'
                      : consentText,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        LanguageUtils.getCancelText(selectedLanguage),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        // Save consent acceptance for offline use
                        await _saveConsentAcceptance(
                          survey.id,
                          selectedLanguage,
                          consentVersionHash,
                        );

                        if (context.mounted) {
                          Navigator.of(context).pop();
                          _showModeSelection(context, selectedLanguage);
                        }
                      },
                      child: Text(LanguageUtils.getAgreeText(selectedLanguage)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showModeSelection(
    BuildContext context,
    String selectedLanguage, {
    String? responseId,
  }) {
    _showModeSelectionBottomSheet(
      context,
      selectedLanguage,
      responseId: responseId,
    );
  }

  /// Check language availability and navigate to survey form for audio modes
  Future<void> _handleAudioModeSelection({
    required BuildContext context,
    required String selectedLanguage,
    required SurveyMode mode,
    String? responseId,
  }) async {
    // Convert language code to TTS format (e.g., "hi" -> "hi-IN")
    final ttsLanguageCode = LanguageUtils.getTTSLanguageCode(selectedLanguage);

    // Check if the language is available on the device
    final isAvailable = await TTSService.instance.isLanguageAvailable(
      ttsLanguageCode,
    );

    // Close mode selection dialog
    if (context.mounted) {
      Navigator.of(context).pop();
    }

    // If language is not available, show tutorial dialog first
    if (!isAvailable && mounted) {
      showLanguageDownloadTutorial(
        context: this.context,
        languageCode: selectedLanguage,
        onDismiss: () {
          _navigateToForm(
            '/survey/${widget.surveyId}/form?language=$selectedLanguage&mode=${mode.urlName}${responseId != null ? '&responseId=$responseId' : ''}',
          );
        },
      );
      return;
    }

    // If language is available, navigate directly
    if (mounted) {
      _navigateToForm(
        '/survey/${widget.surveyId}/form?language=$selectedLanguage&mode=${mode.urlName}${responseId != null ? '&responseId=$responseId' : ''}',
      );
    }
  }

  void _navigateToForm(String path) {
    context.push(path).then((_) {
      if (mounted) _refreshData();
    });
  }

  void _showModeSelectionBottomSheet(
    BuildContext context,
    String selectedLanguage, {
    String? responseId,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useSafeArea: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: colorScheme.onSurfaceVariant.withOpacity(0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      LanguageUtils.getSurveyModeQuestion(selectedLanguage),
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _ModeCard(
                    title: LanguageUtils.getManualModeTitle(selectedLanguage),
                    subtitle: LanguageUtils.getNoInternetRequiredText(
                      selectedLanguage,
                    ),
                    features: [],
                    mode: SurveyMode.manual,
                    onTap: () {
                      Navigator.of(context).pop();
                      _navigateToForm(
                        '/survey/${widget.surveyId}/form?language=$selectedLanguage&mode=${SurveyMode.manual.urlName}${responseId != null ? '&responseId=$responseId' : ''}',
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _ModeCard(
                    title: LanguageUtils.getAudioQuestionsModeTitle(
                      selectedLanguage,
                    ),
                    subtitle: LanguageUtils.getNoInternetRequiredText(
                      selectedLanguage,
                    ),
                    features: [
                      LanguageUtils.getVoiceQuestionsText(selectedLanguage),
                    ],
                    mode: SurveyMode.audioQuestions,
                    onTap: () async {
                      await _handleAudioModeSelection(
                        context: context,
                        selectedLanguage: selectedLanguage,
                        mode: SurveyMode.audioQuestions,
                        responseId: responseId,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Continue a draft submission - navigates to survey form with draft data
  void _continueDraft(OfflineSubmission draft, String language) {
    // If this draft has been synced to the server, use the server ID
    // so the form loads data from the server instead of local SQLite.
    // Otherwise use the local ID for unsynced drafts.
    final responseId = draft.serverSubmissionId ?? draft.localId;
    _showModeSelection(context, language, responseId: responseId);
  }

  /// Show confirmation dialog before deleting a draft
  Future<void> _confirmDeleteDraft(OfflineSubmission draft) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Draft?'),
        content: const Text(
          'Are you sure you want to delete this draft? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      try {
        await OfflineStorageService.instance.deleteDraft(draft.localId);
        // Refresh the drafts list
        setState(() {
          _drafts.removeWhere((d) => d.localId == draft.localId);
        });
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Draft deleted')));
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Failed to delete draft: $e')));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Show loading indicator while loading
    if (_isLoadingSurvey) {
      return Scaffold(
        appBar: AppBar(title: const Text('Survey')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_surveyError != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: colorScheme.error),
                const SizedBox(height: 16),
                Text(
                  'Failed to load survey',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  _surveyError!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.error,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _loadSurvey,
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (_survey == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Survey')),
        body: const Center(child: Text('Survey not found')),
      );
    }

    final isExpired = _isExpired(_survey!.endDate);
    final hasSubmitted = _survey!.hasSubmitted ?? false;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 68,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_survey!.title),
            const SizedBox(height: 2),
            AppVersionText(
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.78),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Survey Header Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _survey!.title,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: _survey!.visibility.name == 'PUBLIC'
                                ? colorScheme.secondaryContainer
                                : colorScheme.tertiaryContainer,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            _survey!.visibility.name,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: _survey!.visibility.name == 'PUBLIC'
                                  ? colorScheme.onSecondaryContainer
                                  : colorScheme.onTertiaryContainer,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (_survey!.description != null) ...[
                      const SizedBox(height: 12),
                      Text(
                        _survey!.description!,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onPrimaryContainer.withOpacity(
                            0.8,
                          ),
                          height: 1.5,
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        if (_survey!.submissionCount != null)
                          _InfoChip(
                            icon: Icons.poll_outlined,
                            label: '${_survey!.submissionCount} responses',
                            colorScheme: colorScheme,
                          ),
                        if (_survey!.endDate != null)
                          _InfoChip(
                            icon: Icons.calendar_today_outlined,
                            label: _formatEndDate(_survey!.endDate),
                            colorScheme: colorScheme,
                            isWarning: _isExpired(_survey!.endDate),
                          ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Action Buttons
              if (!isExpired) ...[
                // Take Survey Button (always show for multiple submissions)
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: (_isStartingSurvey || _isLoadingSubmission)
                        ? null
                        : () async {
                            if (mounted) {
                              setState(() => _isStartingSurvey = true);
                            }
                            try {
                              // Always show language selection dialog first
                              await _showLanguageSelection(context);
                            } finally {
                              if (mounted) {
                                setState(() => _isStartingSurvey = false);
                              }
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_isStartingSurvey || _isLoadingSubmission) ...[
                          SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                colorScheme.onPrimary,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                        ] else ...[
                          Icon(
                            Icons.play_arrow_outlined,
                            size: 20,
                            color: colorScheme.onPrimary,
                          ),
                          const SizedBox(width: 8),
                        ],
                        Text(
                          'Submit Entry',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ] else ...[
                // Expired Survey Message
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.schedule_outlined,
                        color: colorScheme.onErrorContainer,
                        size: 24,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Survey Expired',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onErrorContainer,
                              ),
                            ),
                            Text(
                              'This survey is no longer accepting responses',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onErrorContainer.withOpacity(
                                  0.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],

              // Drafts Section - Show resumable draft submissions
              if (_drafts.isNotEmpty) ...[
                Text(
                  'Continue Draft (${_drafts.length})',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Your progress has been saved. Tap to continue.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                ..._drafts.map((draft) {
                  final answersCount = draft.answerCount;
                  final lastUpdated = draft.updatedAt;
                  final language = draft.language ?? 'en';

                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: colorScheme.primary.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: colorScheme.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.edit_note_outlined,
                                color: colorScheme.primary,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Draft',
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: colorScheme.onPrimaryContainer,
                                        ),
                                  ),
                                  Text(
                                    '$answersCount answers saved',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onPrimaryContainer
                                          .withOpacity(0.8),
                                    ),
                                  ),
                                  Text(
                                    'Last updated: ${lastUpdated.day}/${lastUpdated.month}/${lastUpdated.year} ${lastUpdated.hour % 12 == 0 ? 12 : lastUpdated.hour % 12}:${lastUpdated.minute.toString().padLeft(2, '0')} ${lastUpdated.hour >= 12 ? 'PM' : 'AM'}',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onPrimaryContainer
                                          .withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.primary.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.save_outlined,
                                    size: 14,
                                    color: colorScheme.primary,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Draft',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  _continueDraft(draft, language);
                                },
                                icon: const Icon(Icons.play_arrow, size: 18),
                                label: const Text('Continue'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorScheme.primary,
                                  foregroundColor: colorScheme.onPrimary,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            IconButton(
                              onPressed: () => _confirmDeleteDraft(draft),
                              icon: Icon(
                                Icons.delete_outline,
                                color: colorScheme.error,
                              ),
                              tooltip: 'Delete draft',
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 24),
              ],

              // Pending Offline Submissions Section
              if (_pendingOfflineSubmissions.isNotEmpty) ...[
                Text(
                  'Pending Sync (${_pendingOfflineSubmissions.length})',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  ConnectivityService.instance.isOnline
                      ? 'These submissions will sync automatically'
                      : 'Connect to internet to sync',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                ..._pendingOfflineSubmissions.map((submission) {
                  final answersCount = submission.answerCount;
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: colorScheme.secondaryContainer.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: colorScheme.outline.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: colorScheme.onSecondaryContainer
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.cloud_upload_outlined,
                                color: colorScheme.onSecondaryContainer,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pending Submission',
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color:
                                              colorScheme.onSecondaryContainer,
                                        ),
                                  ),
                                  Text(
                                    'Created on ${submission.createdAt.day}/${submission.createdAt.month}/${submission.createdAt.year}',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onSecondaryContainer
                                          .withOpacity(0.8),
                                    ),
                                  ),
                                  Text(
                                    '$answersCount answers ready to sync',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.onSecondaryContainer
                                          .withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.tertiaryContainer,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.sync,
                                    size: 14,
                                    color: colorScheme.onTertiaryContainer,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Pending',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: colorScheme.onTertiaryContainer,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 24),
              ],

              // Submissions Section
              if (_submissions.isNotEmpty) ...[
                Text(
                  'My Submissions (${_submissions.length})',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                ..._submissions.map((submission) {
                  final submissionTitle = submission.title?.trim();
                  final displayTitle =
                      (submissionTitle != null && submissionTitle.isNotEmpty)
                      ? submissionTitle
                      : 'Submission';
                  final isDraftSubmission =
                      submission.status ==
                      Enum$SurveySubmissionStatusChoices.DRAFT;

                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: colorScheme.tertiaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: colorScheme.onTertiaryContainer
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.assignment_turned_in_outlined,
                                color: colorScheme.onTertiaryContainer,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    displayTitle,
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color:
                                              colorScheme.onTertiaryContainer,
                                        ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      final localTime = submission.submittedAt.toLocal();
                                      return Text(
                                        '${isDraftSubmission ? 'Draft saved on' : 'Submitted on'} ${localTime.day}/${localTime.month}/${localTime.year} ${localTime.hour % 12 == 0 ? 12 : localTime.hour % 12}:${localTime.minute.toString().padLeft(2, '0')} ${localTime.hour >= 12 ? 'PM' : 'AM'}',
                                        style: theme.textTheme.bodyMedium?.copyWith(
                                          color: colorScheme.onTertiaryContainer
                                              .withOpacity(0.8),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              'Answers: ${submission.answers.edges.length}',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onTertiaryContainer
                                    .withOpacity(0.9),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            if (isDraftSubmission)
                              ElevatedButton.icon(
                                onPressed: () {
                                  _showLanguageSelectionForEdit(
                                    context,
                                    submission.id,
                                  );
                                },
                                icon: const Icon(Icons.play_arrow, size: 16),
                                label: const Text('Continue'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorScheme
                                      .onTertiaryContainer
                                      .withOpacity(0.1),
                                  foregroundColor:
                                      colorScheme.onTertiaryContainer,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                              ),
                            if (!isDraftSubmission) ...[
                              ElevatedButton.icon(
                                onPressed: () => context.push(
                                  '/submission/${submission.id}',
                                ),
                                icon: const Icon(
                                  Icons.visibility_outlined,
                                  size: 16,
                                ),
                                label: const Text('View'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorScheme
                                      .onTertiaryContainer
                                      .withOpacity(0.1),
                                  foregroundColor:
                                      colorScheme.onTertiaryContainer,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton.icon(
                                onPressed: () {
                                  _showLanguageSelectionForEdit(
                                    context,
                                    submission.id,
                                  );
                                },
                                icon: const Icon(Icons.edit_outlined, size: 16),
                                label: const Text('Edit'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: colorScheme
                                      .onTertiaryContainer
                                      .withOpacity(0.1),
                                  foregroundColor:
                                      colorScheme.onTertiaryContainer,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  );
                }),

                // Load More Button
                if (_hasNextPage && !_isLoadingMore) ...[
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () => _loadMySubmission(loadMore: true),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Load More Submissions'),
                    ),
                  ),
                ] else if (_isLoadingMore) ...[
                  const SizedBox(height: 16),
                  const Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                ],

                const SizedBox(height: 24),
              ] else if (!_isLoadingSubmission && _hasNoSubmissions) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: colorScheme.onSurfaceVariant.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.inbox_outlined,
                          color: colorScheme.onSurfaceVariant,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'No Submissions',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            Text(
                              'You have not submitted any surveys yet',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant.withOpacity(
                                  0.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ] else if (hasSubmitted && _isLoadingSubmission) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Loading submission details...',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],

              // Status Section
              if (hasSubmitted) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: colorScheme.onSecondaryContainer.withOpacity(
                            0.1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.check_circle_outline,
                          color: colorScheme.onSecondaryContainer,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Survey Completed',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSecondaryContainer,
                              ),
                            ),
                            Text(
                              'You have already submitted your response',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSecondaryContainer
                                    .withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ModeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> features;
  final SurveyMode mode;
  final VoidCallback onTap;

  const _ModeCard({
    required this.title,
    required this.subtitle,
    required this.features,
    required this.mode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isOnline = ConnectivityService.instance.isOnline;
    final isDisabled = mode.requiresInternet && !isOnline;

    return Container(
      decoration: BoxDecoration(
        color: isDisabled
            ? colorScheme.surfaceVariant.withOpacity(0.5)
            : colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withOpacity(0.1)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: isDisabled ? null : onTap,
          child: Opacity(
            opacity: isDisabled ? 0.6 : 1.0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      if (isDisabled) ...[
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.errorContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.wifi_off,
                                size: 14,
                                color: colorScheme.error,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Offline',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: colorScheme.error,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ] else if (mode.hasVoice)
                        Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.volume_up,
                            size: 16,
                            color: colorScheme.primary,
                          ),
                        ),
                      if (!isDisabled)
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: colorScheme.onSurfaceVariant.withOpacity(0.6),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    isDisabled ? 'Requires internet connection' : subtitle,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDisabled
                          ? colorScheme.error.withOpacity(0.8)
                          : colorScheme.onSurfaceVariant.withOpacity(0.8),
                    ),
                  ),
                  if (features.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: features
                          .map(
                            (feature) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                feature,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onPrimaryContainer,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final ColorScheme colorScheme;
  final bool isWarning;

  const _InfoChip({
    required this.icon,
    required this.label,
    required this.colorScheme,
    this.isWarning = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isWarning
            ? colorScheme.errorContainer.withOpacity(0.3)
            : colorScheme.onPrimaryContainer.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: isWarning
                ? colorScheme.error
                : colorScheme.onPrimaryContainer.withOpacity(0.8),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: isWarning
                  ? colorScheme.error
                  : colorScheme.onPrimaryContainer.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
