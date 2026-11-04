import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../graphql/queries/surveys.graphql.dart';
import '../graphql/queries/submissions.graphql.dart';
import '../models/survey_mode.dart';
import '../schema.graphql.dart';
import '../services/connectivity_service.dart';
import '../services/location_service.dart';
import '../services/offline_file_storage_service.dart';
import '../services/offline_storage_service.dart';
import '../services/offline_survey_service.dart';
import '../services/submission_service.dart';
import '../services/survey_service.dart';
import '../services/sync_manager.dart';
import '../services/tts_service.dart';
import '../utils/language_utils.dart';
import '../utils/types.dart';
import '../utils/utils.dart';
import '../widgets/sub_questions_bottom_sheet.dart';

class SurveyFormPage extends StatefulWidget {
  final String surveyId;
  final String language;
  final SurveyMode mode;
  final String? responseId;

  const SurveyFormPage({
    super.key,
    required this.surveyId,
    required this.language,
    required this.mode,
    this.responseId,
  });

  @override
  State<SurveyFormPage> createState() => _SurveyFormPageState();
}

class _SurveyFormPageState extends State<SurveyFormPage> {
  Query$Survey$survey? _survey;
  String? _submissionId;
  bool _isLoading = true;
  String? _error;

  // Image upload states
  bool _isUploadingSignature = false;
  bool _isUploadingPhoto = false;
  String? _signatureUploadError;
  String? _photoUploadError;
  String? _signatureUrl;
  String? _photoUrl;

  // Skip states
  bool _skippedPhoto = false;

  // Helper getter for language check
  bool get isHindi => widget.language.toLowerCase() == 'hi';

  // Saving state
  bool _isSaving = false;
  bool _isSubmitting = false;
  bool _isLoadingDialogVisible = false;
  bool _templateErrorSnackbarShowing = false;

  // Track whether the loaded server submission is a draft
  // Used to decide submit behavior: drafts go through submitSurvey,
  // completed submissions just update answers individually.
  bool _isServerDraft = false;

  // Modal context tracking
  bool _isInModalContext = false;

  // TTS language availability
  bool _isTTSLanguageAvailable = false;

  // Track which question is currently being spoken (by question ID)
  String? _currentlySpeakingQuestionId;

  // Track which question ID should be cleared on TTS completion
  // This prevents race conditions when switching questions quickly
  String? _expectedCompletionQuestionId;

  // Page navigation states
  bool _showPageList = true;

  void _showSubmittingDialog() {
    if (!mounted || _isLoadingDialogVisible) return;
    _isLoadingDialogVisible = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          contentPadding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.language.toLowerCase() == 'hi'
                      ? 'जमा किया जा रहा है...'
                      : widget.language.toLowerCase() == 'te'
                          ? 'సమర్పిస్తోంది...'
                          : 'Submitting...',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Track if uploads are completed (signature is mandatory, photo can be skipped)
  bool get _uploadsCompleted =>
      _signatureUrl != null && (_photoUrl != null || _skippedPhoto);

  final Map<String, dynamic> _answers = {};
  final Map<String, dynamic> _subQuestionAnswers = {};
  final Map<String, TextEditingController> _textControllers = {};
  final Map<String, TextEditingController> _otherOptionControllers = {};
  final Map<String, FocusNode> _focusNodes = {};
  final _formKey = GlobalKey<FormState>();
  int _currentGroupIndex = 0;
  final PageController _pageController = PageController();
  Timer? _saveDebounceTimer;
  SharedPreferences? _prefs;

  // Place data for state/district/block/clf cascading dropdowns
  Map<String, Map<String, List<String>>>? _placeData;
  Map<String, List<String>>? _clfData;

  // Memoization caches for expensive computations
  List<Fragment$QuestionFetch>? _cachedSortedQuestions;
  List<Fragment$QuestionFetch>? _cachedFilteredQuestions;
  List<QuestionGroup>? _cachedQuestionGroups;

  // Invalidate dependent caches (filtered questions and groups depend on answers)
  void _invalidateDependentCaches() {
    _cachedFilteredQuestions = null;
    _cachedQuestionGroups = null;
  }

  // Invalidate all caches (including sorted questions - use when survey data changes)
  void _invalidateAllCaches() {
    _cachedSortedQuestions = null;
    _cachedFilteredQuestions = null;
    _cachedQuestionGroups = null;
  }

  List<TextInputFormatter> _inputFormattersForQuestion(
    Fragment$QuestionFetch question,
  ) {
    final List<TextInputFormatter> formatters = [];

    // Numeric questions: restrict to digits only.
    if (_isNumericQuestionType(question.questionType)) {
      return [FilteringTextInputFormatter.digitsOnly];
    }

    final raw = question.validationPattern?.trim();
    if (raw != null && raw.isNotEmpty) {
      // If the server sent a known label, use a permissive per-character allow.
      final allow = presetAllowForLabel(raw);
      if (allow != null && allow.isNotEmpty) {
        try {
          formatters.add(FilteringTextInputFormatter.allow(RegExp(allow)));
          return formatters;
        } catch (_) {}
      }
      // Otherwise, avoid using a full anchored regex in an allow-filter
      // as it blocks partial input; rely on validator instead.
    }

    return formatters;
  }

  // Helper method to get questions sorted by page order, then question order within page
  // Uses memoization to avoid repeated sorting on every call
  List<Fragment$QuestionFetch> _getSortedQuestions() {
    if (_survey?.pages == null) return [];

    // Return cached result if available
    if (_cachedSortedQuestions != null) {
      return _cachedSortedQuestions!;
    }

    final List<Fragment$QuestionFetch> allQuestions = [];

    // Get all pages and sort them by order
    final pages =
        _survey!.pages.edges
            .where((edge) => edge?.node != null)
            .map((edge) => edge!.node!)
            .toList()
          ..sort((a, b) => a.order.compareTo(b.order));

    // For each page, get its questions and sort them by question order
    for (final page in pages) {
      final pageQuestions =
          page.questions.edges
              .where((edge) => edge?.node != null)
              .map((edge) => edge!.node!)
              .toList()
            ..sort((a, b) => a.order.compareTo(b.order));

      allQuestions.addAll(pageQuestions);
    }

    // Cache the result
    _cachedSortedQuestions = allQuestions;
    return allQuestions;
  }

  /// Helper to extract the numeric question key from a question ID
  /// The ID may be base64 encoded and decode to something like "QuestionType:<number>".
  String? _getQuestionKeyFromId(String questionId) {
    // First try to decode if it's base64 encoded
    final decoded = _tryDecodeGlobalId(questionId);
    if (decoded != null) {
      // Extract the numeric part after the colon
      final parts = decoded.split(':');
      if (parts.length > 1) {
        return parts.last;
      }
    }
    // Fallback: return the original ID if it looks like a number
    if (RegExp(r'^\d+$').hasMatch(questionId)) {
      return questionId;
    }
    return null;
  }

  /// Helper to get an answer by decoded numeric question key.
  /// Searches through all answers and questions to find a match
  String? _getAnswerByQuestionKey(String questionKey) {
    // Search through all questions to find the one with matching key
    for (final question in _getSortedQuestions()) {
      final key = _getQuestionKeyFromId(question.id);
      if (key == questionKey) {
        final answer = _answers[question.id];
        if (answer is String) {
          return answer;
        } else if (answer != null) {
          return answer.toString();
        }
        return null;
      }
    }
    return null;
  }

  /// Helper to get an answer by the question's key field (e.g., "c5")
  /// This uses the question.key property set in the backend, not the numeric ID.
  String? _getAnswerByQuestionFieldKey(String fieldKey) {
    final fieldKeyLower = fieldKey.trim().toLowerCase();
    for (final question in _getSortedQuestions()) {
      final qKey = question.key?.trim().toLowerCase();
      if (qKey == fieldKeyLower) {
        final answer = _answers[question.id];
        if (answer is String) {
          return answer;
        } else if (answer != null) {
          return answer.toString();
        }
        return null;
      }
    }
    return null;
  }

  bool _matchesQuestionFieldKey(Fragment$QuestionFetch question, String fieldKey) {
    final qKey = question.key?.trim().toLowerCase();
    return qKey == fieldKey.trim().toLowerCase();
  }

  bool _isWarningTargetQuestionKey(dynamic rawTarget, String fieldKey) {
    if (rawTarget == null) return false;

    final target = rawTarget.toString().trim().toLowerCase();
    if (target == fieldKey.trim().toLowerCase()) return true;

    final resolvedTarget = _resolveWarningTargetQuestionId(rawTarget, null);
    if (resolvedTarget == null) return false;

    for (final question in _getSortedQuestions()) {
      if (question.id == resolvedTarget) {
        return _matchesQuestionFieldKey(question, fieldKey);
      }
    }

    return false;
  }

  /// Helper to get option text from an option ID (for internal comparison - uses English)
  String? _getOptionTextFromId(String? optionId) {
    if (optionId == null) return null;

    for (final question in _getSortedQuestions()) {
      for (final optionEdge in question.options.edges) {
        final option = optionEdge?.node;
        if (option?.id == optionId) {
          // Return English text for comparison (condition values are in English)
          return option?.text;
        }
      }
    }
    return null;
  }

  /// Helper to get localized option text from an option ID (for display purposes)
  String? _getOptionTextFromIdForDisplay(String? optionId) {
    if (optionId == null) return null;

    final isHindi = widget.language.toLowerCase() == 'hi';

    for (final question in _getSortedQuestions()) {
      for (final optionEdge in question.options.edges) {
        final option = optionEdge?.node;
        if (option?.id == optionId) {
          // Return localized text if available and in non-English mode
          if (isHindi &&
              option?.localizedText != null &&
              option!.localizedText!.isNotEmpty) {
            return option.localizedText;
          }
          return option?.text;
        }
      }
    }
    return null;
  }

  /// Convert land value to acres based on unit
  /// Conversion rates:
  /// - Hectare = 2.471 acres
  /// - Acre = 1.0 acres
  /// - Bigha = 0.62 acres
  /// - Biswa = 0.031 acres
  /// - Guntha = 0.025 acres
  /// - Killa = 1.0 acres (killa = acre in some regions)
  /// - Kanal = 0.125 acres
  /// - Kattha = 0.033 acres
  /// - Dismil = 0.01 acres
  double _convertToAcres(num value, String? unit) {
    if (unit == null) return value.toDouble(); // Default: assume acres

    final unitLower = unit.toLowerCase().trim();

    switch (unitLower) {
      case 'hectare':
      case 'hectares':
        return value * 2.471;
      case 'acre':
      case 'acres':
        return value.toDouble();
      case 'bigha':
        return value * 0.62;
      case 'biswa':
        return value * 0.031;
      case 'guntha':
        return value * 0.025;
      case 'killa':
        return value.toDouble(); // 1 Killa = 1 Acre
      case 'kanal':
        return value * 0.125;
      case 'kattha':
        return value * 0.033;
      case 'dismil':
        return value * 0.01;
      default:
        // Unknown unit, assume acres
        debugPrint('Unknown land unit: $unit, assuming acres');
        return value.toDouble();
    }
  }

  /// Validate that land in your name does not exceed total land owned.
  /// Uses unit conversion when the unit questions are available.
  /// Returns error message if validation fails, null if valid
  /// Only validates when the current group contains the land-in-name question.
  String? _validateLandComparison(QuestionGroup currentGroup) {
    const String totalLandFieldKey = 'total_land_owned';
    const String totalLandUnitFieldKey = 'total_land_unit';
    const String landInNameFieldKey = 'land_in_name';
    const String landInNameUnitFieldKey = 'land_in_name_unit';

    // Check if current group contains the land-in-name question or its unit.
    bool containsLandInNameQuestion = false;
    for (final question in currentGroup.questions) {
      if (_matchesQuestionFieldKey(question, landInNameFieldKey) ||
          _matchesQuestionFieldKey(question, landInNameUnitFieldKey)) {
        containsLandInNameQuestion = true;
        break;
      }
    }

    // Only validate on the page with the land-in-name question.
    if (!containsLandInNameQuestion) {
      return null;
    }

    // Get land values
    final landInNameAnswer = _getAnswerByQuestionFieldKey(landInNameFieldKey);
    final totalLandAnswer = _getAnswerByQuestionFieldKey(totalLandFieldKey);

    // If either value is missing, skip validation (other validations will handle required fields)
    if (landInNameAnswer == null ||
        landInNameAnswer.isEmpty ||
        totalLandAnswer == null ||
        totalLandAnswer.isEmpty) {
      return null;
    }

    // Get land unit selections
    final landInNameUnitId = _getAnswerByQuestionFieldKey(
      landInNameUnitFieldKey,
    );
    final totalLandUnitId = _getAnswerByQuestionFieldKey(totalLandUnitFieldKey);

    // Resolve option IDs to option text (English for conversion)
    final landInNameUnit = _getOptionTextFromId(landInNameUnitId);
    final totalLandUnit = _getOptionTextFromId(totalLandUnitId);

    // Resolve option IDs to localized text (for display in warning message)
    final landInNameUnitDisplay = _getOptionTextFromIdForDisplay(
      landInNameUnitId,
    );
    final totalLandUnitDisplay = _getOptionTextFromIdForDisplay(
      totalLandUnitId,
    );

    debugPrint(
      'LandValidation: land_in_name=$landInNameAnswer ($landInNameUnit), total_land_owned=$totalLandAnswer ($totalLandUnit)',
    );

    final landInNameValue = num.tryParse(landInNameAnswer);
    final totalLandValue = num.tryParse(totalLandAnswer);

    if (landInNameValue == null || totalLandValue == null) {
      return null; // Can't compare non-numeric values
    }

    // Convert both to acres for comparison
    final landInNameInAcres = _convertToAcres(landInNameValue, landInNameUnit);
    final totalLandInAcres = _convertToAcres(totalLandValue, totalLandUnit);

    debugPrint(
      'LandValidation (acres): land_in_name=$landInNameInAcres, total_land_owned=$totalLandInAcres',
    );

    // Validation fails if land in name >= total land owned (must be strictly less)
    if (landInNameInAcres >= totalLandInAcres) {
      final isHindi = widget.language.toLowerCase() == 'hi';
      final isTelugu = widget.language.toLowerCase() == 'te';

      if (isHindi) {
        return 'आपके नाम की भूमि ($landInNameValue ${landInNameUnitDisplay ?? 'एकड़'}) कुल भूमि ($totalLandValue ${totalLandUnitDisplay ?? 'एकड़'}) से कम होनी चाहिए';
      } else if (isTelugu) {
        return 'మీ పేరుపై ఉన్న భూమి ($landInNameValue ${landInNameUnitDisplay ?? 'ఎకరాలు'}) మొత్తం భూమి ($totalLandValue ${totalLandUnitDisplay ?? 'ఎకరాలు'}) కంటే తక్కువగా ఉండాలి';
      } else {
        return 'Land in your name ($landInNameValue ${landInNameUnitDisplay ?? 'Acre'}) must be less than total land owned ($totalLandValue ${totalLandUnitDisplay ?? 'Acre'})';
      }
    }

    return null; // Validation passed
  }

  /// Validate children household consistency:
  /// If any "also care for children while" question answer is "Yes"
  /// but the sum of children count questions (0-5, 6-14, 15-17) is 0,
  /// show a warning.
  /// Matches questions by their question.key field set in the backend.
  String? _validateChildrenHouseholdConsistency(QuestionGroup currentGroup) {
    // question.key values for children count questions
    const List<String> childrenFieldKeys = [
      'c5', // Q742: children ages 0-5
      'c4', // Q743: children ages 6-14
      'c3', // Q744: children ages 15-17
    ];

    // Find any "care for children" question in the current group by text pattern
    Fragment$QuestionFetch? careForChildrenQuestion;
    for (final question in currentGroup.questions) {
      final textLower = question.text.trim().toLowerCase();
      if (textLower.contains('also care for children while')) {
        careForChildrenQuestion = question;
        break;
      }
    }

    if (careForChildrenQuestion == null) {
      return null;
    }

    // Get the answer for this care-for-children question
    final careAnswer = _answers[careForChildrenQuestion.id];
    if (careAnswer == null) {
      return null;
    }

    // The answer is an option ID (radio question) - resolve to text
    final String? answerOptionId = careAnswer is String ? careAnswer : null;
    if (answerOptionId == null || answerOptionId.isEmpty) {
      return null;
    }

    final careOptionText = _getOptionTextFromId(answerOptionId);
    if (careOptionText == null) {
      return null;
    }

    final isYesSelected = careOptionText.trim().toLowerCase() == 'yes';
    if (!isYesSelected) {
      return null;
    }

    // Sum children count questions by their question.key field
    num totalChildren = 0;
    bool anyAnswered = false;

    for (final fieldKey in childrenFieldKeys) {
      final answer = _getAnswerByQuestionFieldKey(fieldKey);
      if (answer != null && answer.isNotEmpty) {
        final value = num.tryParse(answer);
        if (value != null) {
          totalChildren += value;
          anyAnswered = true;
        }
      }
    }

    // Only warn if at least one was answered and the total is 0
    if (!anyAnswered || totalChildren > 0) {
      return null;
    }

    final isHindi = widget.language.toLowerCase() == 'hi';
    final isTelugu = widget.language.toLowerCase() == 'te';

    if (isHindi) {
      return 'आपने घरेलू सदस्य प्रश्न में बच्चों की संख्या 0 चुनी है।';
    } else if (isTelugu) {
      return 'మీరు గృహ సభ్యుల ప్రశ్నలో పిల్లల సంఖ్యను 0 గా ఎంచుకున్నారు.';
    } else {
      return 'You have selected 0 children in the household members question.';
    }
  }

  // Get all pages sorted by order
  List<Query$Survey$survey$pages$edges$node> _getSortedPages() {
    if (_survey?.pages == null) return [];

    return _survey!.pages.edges
        .where((edge) => edge?.node != null)
        .map((edge) => edge!.node!)
        .toList()
      ..sort((a, b) => a.order.compareTo(b.order));
  }

  // Find the first question index for a given page index
  int _findFirstQuestionIndexForPage(int pageIndex) {
    final sortedPages = _getSortedPages();
    if (pageIndex < 0 || pageIndex >= sortedPages.length) {
      debugPrint(
        '_findFirstQuestionIndexForPage: Invalid page index $pageIndex, returning 0',
      );
      return 0;
    }

    final targetPage = sortedPages[pageIndex];
    return _findFirstQuestionIndexForPageById(targetPage.id) ?? 0;
  }

  // Calculate completion percentage for a given page
  double _calculatePageCompletionPercentage(int pageIndex) {
    final sortedPages = _getSortedPages();
    if (pageIndex < 0 || pageIndex >= sortedPages.length || _survey == null) {
      debugPrint(
        '_calculatePageCompletionPercentage: Invalid page index $pageIndex',
      );
      return 0.0;
    }

    final targetPage = sortedPages[pageIndex];
    final shouldDebug = pageIndex == 4;

    if (shouldDebug) {
      debugPrint(
        '_calculatePageCompletionPercentage: Calculating for page "${targetPage.title}" (index: $pageIndex)',
      );
    }

    final questionGroups = _getQuestionGroups();
    if (shouldDebug) {
      debugPrint(
        '_calculatePageCompletionPercentage: Total question groups: ${questionGroups.length}',
      );
    }

    // Get all question groups that belong to this page (same logic as in build method)
    final pageGroups = questionGroups
        .where(
          (group) => group.questions.any(
            (question) => question.page?.id == targetPage.id,
          ),
        )
        .toList();

    if (shouldDebug) {
      debugPrint(
        '_calculatePageCompletionPercentage: Page groups for ${targetPage.title}: ${pageGroups.length}',
      );
    }

    if (pageGroups.isEmpty) {
      if (shouldDebug) {
        debugPrint(
          '_calculatePageCompletionPercentage: No groups found for page, returning 1.0',
        );
      }
      return 1.0;
    }

    // Calculate completion at group level: a group is considered complete if at least one question is answered
    int completedGroups = 0;
    int totalGroups = pageGroups.length;

    for (int i = 0; i < pageGroups.length; i++) {
      final group = pageGroups[i];
      if (shouldDebug) {
        debugPrint(
          '_calculatePageCompletionPercentage: Processing group $i with ${group.questions.length} questions',
        );
      }

      // Filter out consent questions since they're handled by evaluator logic
      final relevantQuestions = group.questions
          .where(
            (question) =>
                question.questionType !=
                    Enum$SurveyQuestionQuestionTypeChoices.CONSENT &&
                question.questionType !=
                    Enum$SurveyQuestionQuestionTypeChoices.NOTE,
          )
          .toList();

      if (shouldDebug) {
        debugPrint(
          '_calculatePageCompletionPercentage: Group $i - Total questions: ${group.questions.length}, Relevant (non-consent) questions: ${relevantQuestions.length}',
        );

        // Log question types for debugging
        for (final q in group.questions) {
          debugPrint(
            '_calculatePageCompletionPercentage: Question "${q.localizedText}" - Type: ${q.questionType}',
          );
        }
      }

      if (relevantQuestions.isEmpty) {
        // If no relevant questions in this group, consider it complete
        if (shouldDebug) {
          debugPrint(
            '_calculatePageCompletionPercentage: Group $i - No relevant questions, marking as complete',
          );
        }
        completedGroups++;
        continue;
      }

      // Check if at least one question in this group is answered
      final hasAnyAnswer = relevantQuestions.any(
        (question) => _hasAnswer(question),
      );
      if (shouldDebug) {
        debugPrint(
          '_calculatePageCompletionPercentage: Group $i - Has any answer: $hasAnyAnswer',
        );
      }

      if (hasAnyAnswer) {
        completedGroups++;
      }
    }

    final percentage = completedGroups / totalGroups;
    if (shouldDebug) {
      debugPrint(
        '_calculatePageCompletionPercentage: Page "${targetPage.title}" - Completed groups: $completedGroups/$totalGroups, Percentage: ${(percentage * 100).toStringAsFixed(1)}%',
      );
    }
    return percentage.clamp(0.0, 1.0).toDouble();
  }

  // Check if a page should be enabled (previous pages are completed)
  bool _isPageEnabled(int pageIndex) {
    // First page is always enabled
    if (pageIndex == 0) {
      return true;
    }

    // Check if all previous pages are completed
    for (int i = 0; i < pageIndex; i++) {
      final completionPercentage = _calculatePageCompletionPercentage(i);
      if (completionPercentage < 1.0) {
        return false; // Previous page not completed
      }
    }

    return true;
  }

  // Calculate page display number considering grouping (similar to header logic)
  int _calculatePageDisplayNumber(int pageIndex) {
    final sortedPages = _getSortedPages();
    if (pageIndex < 0 || pageIndex >= sortedPages.length) {
      return 0;
    }

    final questionGroups = _getQuestionGroups();

    // Calculate the starting position by counting groups in previous pages
    int groupPosition = 0;
    for (int i = 0; i < pageIndex; i++) {
      final previousPage = sortedPages[i];
      final previousPageGroups = questionGroups
          .where(
            (group) =>
                group.questions.any((q) => q.page?.id == previousPage.id),
          )
          .toList();
      groupPosition += previousPageGroups.length;
    }

    // Return 1-based position + groups in current page
    return groupPosition + 1;
  }

  // Helper method to get filtered questions based on conditions
  // Uses memoization - cache is invalidated when answers change via _invalidateCaches()
  List<Fragment$QuestionFetch> _getFilteredQuestions() {
    // Return cached result if available
    if (_cachedFilteredQuestions != null) {
      return _cachedFilteredQuestions!;
    }

    final allQuestions = _getSortedQuestions();
    final filteredQuestions = <Fragment$QuestionFetch>[];

    for (final question in allQuestions) {
      // If question has no conditions, always show it
      bool shouldShow = true;
      if (!(question.conditions == null || question.conditions!.isEmpty)) {
        // Evaluate all conditions for this question
        shouldShow = _evaluateConditions(question.conditions!);
      }

      if (!shouldShow) continue;

      // Consent-specific evaluatorCondition handling
      if (question.questionType ==
          Enum$SurveyQuestionQuestionTypeChoices.CONSENT) {
        final evalExpr = question.evaluatorCondition?.trim();
        if (evalExpr != null && evalExpr.isNotEmpty) {
          final evalResult = _evaluateBooleanExpression(evalExpr);
          // If evaluator says true, skip consent entirely
          if (evalResult == true) continue;
        }
      }

      filteredQuestions.add(question);
    }

    // Cache the result
    _cachedFilteredQuestions = filteredQuestions;
    return filteredQuestions;
  }

  // Uses memoization - cache is invalidated when answers change via _invalidateCaches()
  List<QuestionGroup> _getQuestionGroups() {
    // Return cached result if available
    if (_cachedQuestionGroups != null) {
      return _cachedQuestionGroups!;
    }

    final filteredQuestions = _getFilteredQuestions();
    if (filteredQuestions.isEmpty) return const <QuestionGroup>[];

    final groups = <QuestionGroup>[];

    for (final question in filteredQuestions) {
      final rawGroupKey = question.group?.trim();
      final normalizedGroupKey = rawGroupKey != null && rawGroupKey.isNotEmpty
          ? rawGroupKey
          : null;
      final pageId = question.page?.id;

      if (normalizedGroupKey == null) {
        groups.add(
          QuestionGroup(pageId: pageId, groupKey: null, questions: [question]),
        );
        continue;
      }

      final lastGroup = groups.isNotEmpty ? groups.last : null;
      if (lastGroup != null &&
          lastGroup.groupKey != null &&
          lastGroup.groupKey == normalizedGroupKey &&
          lastGroup.pageId == pageId) {
        lastGroup.questions.add(question);
      } else {
        groups.add(
          QuestionGroup(
            pageId: pageId,
            groupKey: normalizedGroupKey,
            questions: [question],
          ),
        );
      }
    }

    // Cache the result
    _cachedQuestionGroups = groups;
    return groups;
  }

  // Get question groups excluding consent groups for progress calculation
  List<QuestionGroup> _getNonConsentQuestionGroups() {
    final allGroups = _getQuestionGroups();
    return allGroups.where((group) {
      // Exclude groups that contain only consent questions
      return group.questions.any(
        (question) =>
            question.questionType !=
            Enum$SurveyQuestionQuestionTypeChoices.CONSENT,
      );
    }).toList();
  }

  // Build expression evaluation context from all questions/answers
  Map<String, dynamic> _buildExpressionContext() {
    final context = <String, dynamic>{};
    final allQuestions = _getSortedQuestions();

    for (final q in allQuestions) {
      if (q.key != null && q.key!.isNotEmpty) {
        final answer = _answers[q.id];
        if (answer == null || answer == '') {
          if (_isNumericQuestionType(q.questionType)) {
            context[q.key!] = 0;
          } else {
            context[q.key!] = '';
          }
        } else {
          if (answer is String) {
            if (_isNumericQuestionType(q.questionType)) {
              final numValue = num.tryParse(answer);
              context[q.key!] = numValue ?? 0;
            } else {
              // For RADIO and DROPDOWN questions, convert option ID to option text
              if (q.questionType ==
                      Enum$SurveyQuestionQuestionTypeChoices.RADIO ||
                  q.questionType ==
                      Enum$SurveyQuestionQuestionTypeChoices.DROPDOWN) {
                final selectedOption = q.options.edges
                    .where((edge) => edge?.node != null)
                    .map((edge) => edge!.node!)
                    .firstWhere(
                      (option) => option.id == answer,
                      orElse: () => Fragment$QuestionFetch$options$edges$node(
                        id: answer,
                        text: answer,
                        order: 0,
                      ),
                    );
                context[q.key!] = selectedOption.text ?? answer;
              } else {
                context[q.key!] = answer;
              }
            }
          } else if (answer is num) {
            context[q.key!] = answer;
          } else if (answer is List<String>) {
            // For CHECKBOX questions, convert option IDs to option texts
            if (q.questionType ==
                Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX) {
              final selectedTexts = <String>[];
              for (final optionId in answer) {
                final selectedOption = q.options.edges
                    .where((edge) => edge?.node != null)
                    .map((edge) => edge!.node!)
                    .firstWhere(
                      (option) => option.id == optionId,
                      orElse: () => Fragment$QuestionFetch$options$edges$node(
                        id: optionId,
                        text: optionId,
                        order: 0,
                      ),
                    );
                selectedTexts.add(selectedOption.text ?? optionId);
              }
              context[q.key!] = selectedTexts.join(', ');
            } else {
              context[q.key!] = answer.join(', ');
            }
          } else {
            context[q.key!] = answer.toString();
          }
        }

        final otherText = _otherTextForQuestion(q);
        final otherKey = '${q.key!}_other';
        if (otherText != null && otherText.isNotEmpty) {
          context[otherKey] = otherText;
        } else {
          context[otherKey] = '';
        }
      }
    }

    return context;
  }

  // Evaluate a boolean expression (used for consent evaluatorCondition)
  bool _evaluateBooleanExpression(String expression) {
    try {
      final parsed = Expression.parse(expression);
      const evaluator = ExpressionEvaluator();
      final context = _buildExpressionContext();
      final result = evaluator.eval(parsed, context);
      if (result is bool) return result;
      if (result is num) return result != 0;
      if (result is String) return result.toLowerCase() == 'true';
      return false;
    } catch (e) {
      debugPrint('Error evaluating evaluatorCondition "$expression": $e');
      return false;
    }
  }

  // Compute effective options for a question, applying filterOptionsQuestion if set
  List<Fragment$QuestionFetch$options$edges$node> _effectiveOptions(
    Fragment$QuestionFetch question,
  ) {
    // Check if this is a location question (state/district/block/clf) and use place.json data
    final locationOptions = _getLocationOptions(question);
    if (locationOptions != null) {
      return locationOptions;
    }

    final baseOptions =
        question.options.edges
            .where((edge) => edge?.node != null)
            .map((edge) => edge!.node!)
            .toList()
          ..sort((a, b) => a.order.compareTo(b.order));

    final filterRef = question.filterOptionsQuestion;
    if (filterRef == null) {
      // Additionally apply per-option conditions filtering
      return baseOptions.where((opt) => _isOptionVisible(opt)).toList()
        ..sort((a, b) => a.order.compareTo(b.order));
    }

    // Find the referenced source question
    Fragment$QuestionFetch? sourceQuestion;
    for (final q in _getSortedQuestions()) {
      if (q.id == filterRef.id) {
        sourceQuestion = q;
        break;
      }
    }

    if (sourceQuestion == null) {
      return baseOptions.where((opt) => _isOptionVisible(opt)).toList()
        ..sort((a, b) => a.order.compareTo(b.order));
    }

    // Check if the filter is within the same question
    final bool isSameQuestion = question.id == filterRef.id;

    // Get selected option ids from the source question answer
    final srcAns = _answers[filterRef.id];
    final List<String> selectedIds = [];
    if (srcAns is String && srcAns.isNotEmpty) {
      selectedIds.add(srcAns);
    } else if (srcAns is List<String>) {
      selectedIds.addAll(srcAns);
    } else {
      // No selection yet -> return only "None" options if not same question
      if (!isSameQuestion) {
        // Return only "None" options for cross-question filtering
        return baseOptions.where((opt) {
          final effectiveText = opt.localizedText ?? opt.text;
          return _isOptionNone(effectiveText) && _isOptionVisible(opt);
        }).toList()..sort((a, b) => a.order.compareTo(b.order));
      }
      return []; // No selection and same question -> no options to show
    }

    // Build set of selected option texts from source question
    final Set<String> selectedTexts = {};
    for (final e in sourceQuestion.options.edges) {
      final opt = e?.node;
      if (opt == null) continue;
      if (selectedIds.contains(opt.id)) {
        String? otherText;
        if (_isOtherOption(opt)) {
          final perOptionKey = '${sourceQuestion.id}_${opt.id}_other';
          final baseOtherKey = '${sourceQuestion.id}_other';
          final perOptionValue = _answers[perOptionKey];
          final baseOtherValue = _answers[baseOtherKey];

          if (perOptionValue is String && perOptionValue.trim().isNotEmpty) {
            otherText = perOptionValue.trim();
          } else if (baseOtherValue is String &&
              baseOtherValue.trim().isNotEmpty) {
            otherText = baseOtherValue.trim();
          }
        }

        // Add BOTH localized text AND English text for matching
        // This ensures filtering works even if localized translations differ
        final localizedText = opt.localizedText;
        final englishText = opt.text;

        if (otherText != null) {
          selectedTexts.add(otherText.trim().toLowerCase());
        } else {
          if (localizedText != null && localizedText.trim().isNotEmpty) {
            selectedTexts.add(localizedText.trim().toLowerCase());
          }
          // Always add English text as fallback
          selectedTexts.add(englishText.trim().toLowerCase());
        }
      }
    }

    if (selectedTexts.isEmpty) {
      // If no selection, return only "None" options for cross-question filtering
      if (!isSameQuestion) {
        return baseOptions.where((opt) {
          final effectiveText = opt.localizedText ?? opt.text;
          return _isOptionNone(effectiveText) && _isOptionVisible(opt);
        }).toList()..sort((a, b) => a.order.compareTo(b.order));
      }
      return []; // No selection and same question -> no options to show
    }

    // Filter current question's options
    List<Fragment$QuestionFetch$options$edges$node> filteredOptions = [];

    if (isSameQuestion) {
      // Filter within same question: show only options that match the selected texts
      filteredOptions = baseOptions.where((opt) {
        // Check both localized and English text for matching
        final localizedText = opt.localizedText?.trim().toLowerCase();
        final englishText = opt.text.trim().toLowerCase();

        if (selectedTexts.contains(englishText)) {
          return true;
        }
        if (localizedText != null &&
            localizedText.isNotEmpty &&
            selectedTexts.contains(localizedText)) {
          return true;
        }

        // For "other" options in the current question, check if any selected text
        // matches the custom text entered for this "other" option
        if (_isOtherOption(opt)) {
          final perOptionKey = '${question.id}_${opt.id}_other';
          final baseOtherKey = '${question.id}_other';
          final perOptionValue = _answers[perOptionKey];
          final baseOtherValue = _answers[baseOtherKey];

          String? customText;
          if (perOptionValue is String && perOptionValue.trim().isNotEmpty) {
            customText = perOptionValue.trim().toLowerCase();
          } else if (baseOtherValue is String &&
              baseOtherValue.trim().isNotEmpty) {
            customText = baseOtherValue.trim().toLowerCase();
          }

          // If we have custom text, check if it matches any selected text
          if (customText != null && selectedTexts.contains(customText)) {
            return true;
          }

          // Always include "other" options in same question filtering
          // The display logic will handle showing the custom text when available
          return true;
        }

        return false;
      }).toList();
    } else {
      // Filter across different questions: show options that match OR "None" options OR "other" options
      filteredOptions = baseOptions.where((opt) {
        // Check both localized and English text for matching
        final localizedText = opt.localizedText?.trim().toLowerCase();
        final englishText = opt.text.trim().toLowerCase();

        if (selectedTexts.contains(englishText)) {
          return true;
        }
        if (localizedText != null &&
            localizedText.isNotEmpty &&
            selectedTexts.contains(localizedText)) {
          return true;
        }

        // For "other" options in the current question, check if any selected text
        // matches the custom text entered for this "other" option
        if (_isOtherOption(opt)) {
          final perOptionKey = '${question.id}_${opt.id}_other';
          final baseOtherKey = '${question.id}_other';
          final perOptionValue = _answers[perOptionKey];
          final baseOtherValue = _answers[baseOtherKey];

          String? customText;
          if (perOptionValue is String && perOptionValue.trim().isNotEmpty) {
            customText = perOptionValue.trim().toLowerCase();
          } else if (baseOtherValue is String &&
              baseOtherValue.trim().isNotEmpty) {
            customText = baseOtherValue.trim().toLowerCase();
          }

          // If we have custom text, check if it matches any selected text
          if (customText != null && selectedTexts.contains(customText)) {
            return true;
          }

          return true;
        }

        if (_isOptionNone(opt.text)) {
          return true;
        }
        if (opt.localizedText != null && _isOptionNone(opt.localizedText!)) {
          return true;
        }
        return false;
      }).toList();
    }

    // Apply option-level conditions after mapping
    final finalOptions =
        filteredOptions.where((opt) => _isOptionVisible(opt)).toList()
          ..sort((a, b) => a.order.compareTo(b.order));

    return finalOptions;
  }

  // Generate location-based options for state/district/block/clf questions from place.json
  List<Fragment$QuestionFetch$options$edges$node>? _getLocationOptions(
    Fragment$QuestionFetch question,
  ) {
    // Only process if place data is loaded and question has a key
    if (_placeData == null || question.key == null) return null;

    final key = question.key!.trim().toLowerCase();

    // State dropdown: return all states
    if (key == 'state') {
      final states = _placeData!.keys.toList()..sort();
      return states.asMap().entries.map((entry) {
        return Fragment$QuestionFetch$options$edges$node(
          id: entry.value, // Use text value directly without prefix
          text: entry.value,
          localizedText: null,
          order: entry.key,
        );
      }).toList();
    }

    // District dropdown: filter by selected state
    if (key == 'district') {
      // Find the state question by looking for key="state"
      String? selectedState;
      for (final q in _getSortedQuestions()) {
        if (q.key?.trim().toLowerCase() == 'state') {
          final stateAnswer = _answers[q.id];
          if (stateAnswer is String && stateAnswer.isNotEmpty) {
            // State answer is now stored directly as the state name
            selectedState = stateAnswer;
          }
          break;
        }
      }

      if (selectedState == null || !_placeData!.containsKey(selectedState)) {
        return []; // No state selected or invalid state
      }

      final districts = _placeData![selectedState]!.keys.toList()..sort();
      return districts.asMap().entries.map((entry) {
        return Fragment$QuestionFetch$options$edges$node(
          id: entry.value, // Use text value directly without prefix
          text: entry.value,
          localizedText: null,
          order: entry.key,
        );
      }).toList();
    }

    // Block dropdown: filter by selected district
    if (key == 'block') {
      // Find the state and district questions
      String? selectedState;
      String? selectedDistrict;

      for (final q in _getSortedQuestions()) {
        final qKey = q.key?.trim().toLowerCase();
        if (qKey == 'state') {
          final stateAnswer = _answers[q.id];
          if (stateAnswer is String && stateAnswer.isNotEmpty) {
            // State answer is now stored directly as the state name
            selectedState = stateAnswer;
          }
        } else if (qKey == 'district') {
          final districtAnswer = _answers[q.id];
          if (districtAnswer is String && districtAnswer.isNotEmpty) {
            // District answer is now stored directly as the district name
            selectedDistrict = districtAnswer;
          }
        }
      }

      if (selectedState == null ||
          selectedDistrict == null ||
          !_placeData!.containsKey(selectedState) ||
          !_placeData![selectedState]!.containsKey(selectedDistrict)) {
        return []; // No state/district selected or invalid selection
      }

      final blocks = _placeData![selectedState]![selectedDistrict]!..sort();
      return blocks.asMap().entries.map((entry) {
        return Fragment$QuestionFetch$options$edges$node(
          id: entry.value, // Use text value directly without prefix
          text: entry.value,
          localizedText: null,
          order: entry.key,
        );
      }).toList();
    }

    // CLF dropdown: filter by selected block
    if (key == 'clf') {
      if (_clfData == null) return [];

      String? selectedBlock;

      for (final q in _getSortedQuestions()) {
        final qKey = q.key?.trim().toLowerCase();
        final answer = _answers[q.id];
        if (answer is! String || answer.isEmpty) continue;

        if (qKey == 'block') {
          selectedBlock = answer;
          break;
        }
      }

      if (selectedBlock == null) {
        return [];
      }

      final clfs = _clfData![selectedBlock];
      if (clfs == null || clfs.isEmpty) {
        return [];
      }

      final sortedClfs = List<String>.from(clfs)..sort();
      return sortedClfs.asMap().entries.map((entry) {
        return Fragment$QuestionFetch$options$edges$node(
          id: entry.value,
          text: entry.value,
          localizedText: null,
          order: entry.key,
        );
      }).toList();
    }

    return null; // Not a location question
  }

  bool _isOptionNone(String text) {
    // Check if the option text indicates "None" or similar in both English and Hindi
    final lowerText = text.trim().toLowerCase();
    return lowerText == 'none' ||
        lowerText == 'no' ||
        lowerText.contains('none') ||
        lowerText.contains('no') ||
        lowerText == 'कोई नहीं' ||
        lowerText == 'नहीं' ||
        lowerText.contains('कोई नहीं');
  }

  bool _isOptionVisible(Fragment$QuestionFetch$options$edges$node option) {
    final conditions = option.conditions;
    if (conditions == null || conditions.isEmpty) return true;
    return _evaluateOptionConditions(conditions);
  }

  bool _evaluateOptionConditions(
    List<Fragment$QuestionFetch$options$edges$node$conditions?> conditions,
  ) {
    if (conditions.isEmpty) return true;

    bool finalResult = false;
    bool hasConditions = false;

    for (final condition in conditions) {
      if (condition == null) continue;
      hasConditions = true;

      final conditionResult = _evaluateSingleOptionCondition(condition);

      if (condition.logicOperator ==
          Enum$SurveyOptionConditionLogicOperatorChoices.AND) {
        if (!conditionResult) return false; // AND: any false blocks visibility
        finalResult = true;
      } else if (condition.logicOperator ==
          Enum$SurveyOptionConditionLogicOperatorChoices.OR) {
        if (conditionResult) return true; // OR: any true grants visibility
        finalResult = finalResult || conditionResult;
      }
    }

    return hasConditions ? finalResult : true;
  }

  List<String>? _getBlockingWarningMessages(QuestionGroup group) {
    final Set<String> satisfiedTargets = {};
    // Changed to List to collect ALL warning messages, not just one per target
    final List<String> pendingBlockingMessages = [];
    final List<String> hardFailures = [];

    // Track all options that have warnings targeting each question (regardless of condition match)
    // Map: targetQuestionId -> List of option IDs that have warnings targeting it
    final Map<String, List<String>> targetToOptionsMap = {};

    // Track or_group -> List of option IDs for OR grouping across multiple options
    // If ANY option in an or_group is selected, ALL options in that group are satisfied
    final Map<String, List<String>> orGroupToOptionsMap = {};

    // Map option IDs to their auto-detected or_group (for frontend-based grouping)
    final Map<String, String> optionIdToAutoOrGroup = {};

    // Helper to find target question text for logging
    String getTargetText(String targetId) {
      if (targetId == group.questions.first.id) {
        return 'Self';
      }
      try {
        final targetQ = _getSortedQuestions().firstWhere(
          (q) => q.id == targetId,
        );
        return targetQ.localizedText ?? targetQ.text;
      } catch (_) {
        return targetId;
      }
    }

    // OR-GROUPING for Land Ownership Type:
    // Options that have not_selected warnings targeting land_ownership_type are grouped together.
    // This allows selecting either "Agricultural Land" OR "Other Land" to satisfy the requirement.

    const String landOwnershipFieldKey = 'land_ownership_type';

    // Map: target_question_id -> List of option IDs that have not_selected warnings targeting it
    final Map<String, List<String>> targetToOptionsForAutoGroup = {};

    // PRE-PASS: Build auto or_group mappings for land ownership only
    final isEnglishPre = widget.language.toLowerCase() == 'en';
    for (final question in _getSortedQuestions()) {
      final options = question.options.edges
          .map((edge) => edge?.node)
          .whereType<Fragment$QuestionFetch$options$edges$node>()
          .toList();

      for (final option in options) {
        // Get warning data
        final warningData =
            (!isEnglishPre &&
                option.localizedOptionWarning != null &&
                option.localizedOptionWarning!.trim().isNotEmpty)
            ? option.localizedOptionWarning
            : option.optionWarning;
        final warningEntries = _extractWarningEntries(warningData);
        if (warningEntries.isEmpty) continue;

        for (final warning in warningEntries) {
          final trigger =
              (warning['__trigger'] as String?)?.toLowerCase() ?? 'selected';

          // Only process not_selected warnings for OR grouping
          if (trigger == 'not_selected') {
            final rawTarget =
                warning['target_question_id'] ??
                warning['targetQuestionId'] ??
                warning['target_question_key'] ??
                warning['targetQuestionKey'];

            if (rawTarget != null) {
              final resolvedTarget = _resolveWarningTargetQuestionId(
                rawTarget,
                question,
              );
              final targetId = resolvedTarget ?? rawTarget.toString();

              // ONLY group options targeting land ownership
              // AND only if their condition matches
              if (_isWarningTargetQuestionKey(
                rawTarget,
                landOwnershipFieldKey,
              )) {
                // Check if the warning condition matches before grouping
                final matchesCondition = _doesWarningConditionMatch(
                  warning,
                  question,
                );

                if (matchesCondition) {
                  targetToOptionsForAutoGroup
                      .putIfAbsent(targetId, () => [])
                      .add(option.id);
                }
              }
            }
          }
        }
      }
    }

    // Create or_groups for land ownership if multiple options target it
    for (final entry in targetToOptionsForAutoGroup.entries) {
      final targetId = entry.key;
      final optionIds = entry.value;

      // Only create or_group if multiple options target the same question
      if (optionIds.length > 1) {
        final groupKey = 'land_ownership_group';

        for (final optionId in optionIds) {
          optionIdToAutoOrGroup[optionId] = groupKey;
          orGroupToOptionsMap.putIfAbsent(groupKey, () => []).add(optionId);
        }
      }
    }

    // FIRST PASS: Build map of all targets and their associated options (ignore conditions)
    final isEnglish = widget.language.toLowerCase() == 'en';
    for (final question in group.questions) {
      final options = question.options.edges
          .map((edge) => edge?.node)
          .whereType<Fragment$QuestionFetch$options$edges$node>()
          .toList();

      for (final option in options) {
        // Use localized warning if available, otherwise fall back to default
        final warningData =
            (!isEnglish &&
                option.localizedOptionWarning != null &&
                option.localizedOptionWarning!.trim().isNotEmpty)
            ? option.localizedOptionWarning
            : option.optionWarning;
        final warningEntries = _extractWarningEntries(warningData);
        if (warningEntries.isEmpty) continue;

        for (final warning in warningEntries) {
          final trigger =
              (warning['__trigger'] as String?)?.toLowerCase() ?? 'selected';

          // Only track 'not_selected' warnings for OR grouping
          if (trigger == 'not_selected') {
            final rawTarget =
                warning['target_question_id'] ??
                warning['targetQuestionId'] ??
                warning['target_question_key'] ??
                warning['targetQuestionKey'];

            final resolvedTarget = _resolveWarningTargetQuestionId(
              rawTarget,
              question,
            );
            final targetId = resolvedTarget ?? question.id;

            // Only add to targetToOptionsMap if condition matches
            final matchesCondition = _doesWarningConditionMatch(
              warning,
              question,
            );

            if (matchesCondition) {
              targetToOptionsMap.putIfAbsent(targetId, () => []).add(option.id);

              // Track or_group for cross-option OR logic (from backend JSON)
              final orGroup = warning['or_group'] ?? warning['orGroup'];
              if (orGroup != null && orGroup.toString().trim().isNotEmpty) {
                final groupKey = orGroup.toString().trim();
                orGroupToOptionsMap
                    .putIfAbsent(groupKey, () => [])
                    .add(option.id);
                optionIdToAutoOrGroup[option.id] = groupKey;
              }
            }
          }
        }
      }
    }

    // SECOND PASS: Process warnings as before
    for (final question in group.questions) {
      final answer = _answers[question.id];
      final questionText = question.localizedText ?? question.text;

      final options = question.options.edges
          .map((edge) => edge?.node)
          .whereType<Fragment$QuestionFetch$options$edges$node>()
          .toList();

      for (final option in options) {
        // Use localized warning if available, otherwise fall back to default
        final warningData =
            (!isEnglish &&
                option.localizedOptionWarning != null &&
                option.localizedOptionWarning!.trim().isNotEmpty)
            ? option.localizedOptionWarning
            : option.optionWarning;
        final warningEntries = _extractWarningEntries(warningData);
        if (warningEntries.isEmpty) continue;

        final isSelected = _isOptionSelectedForAnswer(answer, option);
        // Use localized warning text if available for the current language
        final fallbackText =
            (!isEnglish &&
                option.localizedOptionWarningText != null &&
                option.localizedOptionWarningText!.trim().isNotEmpty)
            ? option.localizedOptionWarningText!.trim()
            : option.optionWarningText?.trim();
        final optText = option.localizedText ?? option.text;

        for (final warning in warningEntries) {
          // Check if the condition matches first (regardless of selection)
          final matchesCondition = _doesWarningConditionMatch(
            warning,
            question,
          );

          // Debug: Log which question/option is checking warnings
          final questionKey = _getQuestionKeyFromId(question.id);
          final optionText = option.localizedText ?? option.text;
          debugPrint(
            'WarningCheck: Q$questionKey | Option: $optionText | Matches: $matchesCondition | Trigger: ${warning['__trigger']}',
          );

          if (!matchesCondition) {
            continue;
          }

          // Resolve target to identify the "group" of warnings
          final rawTarget =
              warning['target_question_id'] ??
              warning['targetQuestionId'] ??
              warning['target_question_key'] ??
              warning['targetQuestionKey'];

          final resolvedTarget = _resolveWarningTargetQuestionId(
            rawTarget,
            question,
          );
          final targetId = resolvedTarget ?? question.id;
          final targetText = getTargetText(targetId);

          // Identify trigger type
          final trigger =
              (warning['__trigger'] as String?)?.toLowerCase() ?? 'selected';

          // Get or_group - first check auto-detected from option text, then from warning JSON
          final autoOrGroup = optionIdToAutoOrGroup[option.id];
          final jsonOrGroup = warning['or_group'] ?? warning['orGroup'];
          final orGroupKey = autoOrGroup ?? jsonOrGroup?.toString().trim();

          if (trigger == 'selected') {
            // Prohibitive warning: Block if selected
            if (isSelected) {
              final msg = _getWarningMessage(
                warning,
                fallbackText,
                widget.language,
              );
              debugPrint(
                '⚠️ ADDING WARNING: Q$questionKey | Option: $optionText | Msg: $msg',
              );
              hardFailures.add(msg);
            }
          } else if (trigger == 'not_selected') {
            // Mandatory warning: Block if NOT selected
            if (isSelected) {
              // If selected, we satisfy this target requirement
              satisfiedTargets.add(targetId);
              // Also mark this specific option as satisfied
              satisfiedTargets.add(option.id);
              // If this option belongs to an or_group, satisfy the entire group
              if (orGroupKey != null && orGroupKey.isNotEmpty) {
                satisfiedTargets.add('or_group:$orGroupKey');
                final groupOptions = orGroupToOptionsMap[orGroupKey] ?? [];
                for (final groupOptionId in groupOptions) {
                  satisfiedTargets.add(groupOptionId);
                }
              }
            } else {
              // If not selected, queue a potential block with option ID and or_group as key
              final msg = _getWarningMessage(
                warning,
                fallbackText,
                widget.language,
              );
              // Store with option ID and or_group to track dependencies
              if (orGroupKey != null && orGroupKey.isNotEmpty) {
                pendingBlockingMessages.add(
                  '${option.id}::or_group:$orGroupKey::$msg',
                );
              } else {
                pendingBlockingMessages.add('${option.id}::::$msg');
              }
            }
          }
        }
      }
    }

    // THIRD PASS: Check if any option with warnings targeting pending blocks is selected
    // This handles the case where condition didn't match but user selected an alternative option
    for (final targetId in targetToOptionsMap.keys) {
      if (satisfiedTargets.contains(targetId)) {
        continue; // Already satisfied
      }

      final optionsForTarget = targetToOptionsMap[targetId] ?? [];

      // Check if ANY of these options is selected across all questions
      bool anyOptionSelected = false;
      for (final question in group.questions) {
        final answer = _answers[question.id];
        final options = question.options.edges
            .map((edge) => edge?.node)
            .whereType<Fragment$QuestionFetch$options$edges$node>()
            .toList();

        for (final option in options) {
          if (optionsForTarget.contains(option.id) &&
              _isOptionSelectedForAnswer(answer, option)) {
            anyOptionSelected = true;
            satisfiedTargets.add(targetId);
            // Also check if this option belongs to any or_group and satisfy the entire group
            for (final groupKey in orGroupToOptionsMap.keys) {
              if (orGroupToOptionsMap[groupKey]?.contains(option.id) == true) {
                satisfiedTargets.add('or_group:$groupKey');
                final groupOptions = orGroupToOptionsMap[groupKey] ?? [];
                for (final groupOptionId in groupOptions) {
                  satisfiedTargets.add(groupOptionId);
                }
              }
            }
            break;
          }
        }
        if (anyOptionSelected) break;
      }
    }

    // FOURTH PASS: Check auto-detected or_groups for satisfaction
    // This handles the case where options have auto-detected or_group but may not have explicit warnings
    for (final groupKey in orGroupToOptionsMap.keys) {
      if (satisfiedTargets.contains('or_group:$groupKey')) {
        continue; // Already satisfied
      }

      final groupOptionIds = orGroupToOptionsMap[groupKey] ?? [];

      // Check if ANY option in this or_group is selected
      for (final question in group.questions) {
        final answer = _answers[question.id];
        final options = question.options.edges
            .map((edge) => edge?.node)
            .whereType<Fragment$QuestionFetch$options$edges$node>()
            .toList();

        for (final option in options) {
          if (groupOptionIds.contains(option.id) &&
              _isOptionSelectedForAnswer(answer, option)) {
            satisfiedTargets.add('or_group:$groupKey');
            // Mark all options in this group as satisfied
            for (final groupOptionId in groupOptionIds) {
              satisfiedTargets.add(groupOptionId);
            }
            break;
          }
        }
        if (satisfiedTargets.contains('or_group:$groupKey')) break;
      }
    }

    // 1. Hard failures (prohibited selections) take precedence
    if (hardFailures.isNotEmpty) {
      return hardFailures;
    }

    // 2. Check pending blocks that weren't satisfied by selected options
    // Each entry in pendingBlockingMessages is formatted as "optionId::or_group:groupKey::message" or "optionId::::message"
    final List<String> unsatisfiedWarnings = [];
    final Set<String> processedOrGroups =
        {}; // Track or_groups that have already shown a warning
    // Collect all messages for each or_group to combine them
    final Map<String, List<String>> orGroupMessages = {};

    // First, collect all messages per or_group
    for (final entry in pendingBlockingMessages) {
      final parts = entry.split('::');
      if (parts.length >= 3) {
        final orGroupPart = parts[1]; // Could be "or_group:groupKey" or empty
        final msg = parts
            .sublist(2)
            .join('::'); // Rejoin in case message contains ::

        if (orGroupPart.startsWith('or_group:')) {
          final orGroupKey = orGroupPart.substring('or_group:'.length);
          if (!satisfiedTargets.contains('or_group:$orGroupKey')) {
            orGroupMessages.putIfAbsent(orGroupKey, () => []).add(msg);
          }
        }
      }
    }

    for (final entry in pendingBlockingMessages) {
      final parts = entry.split('::');
      if (parts.length >= 3) {
        final optionId = parts[0];
        final orGroupPart = parts[1]; // Could be "or_group:groupKey" or empty
        final msg = parts
            .sublist(2)
            .join('::'); // Rejoin in case message contains ::

        // Check if this option or its or_group is satisfied
        bool isSatisfied = satisfiedTargets.contains(optionId);
        String? orGroupKey;

        if (orGroupPart.startsWith('or_group:')) {
          orGroupKey = orGroupPart.substring('or_group:'.length);
          if (satisfiedTargets.contains('or_group:$orGroupKey')) {
            isSatisfied = true;
          }
        }

        if (!isSatisfied) {
          // For or_group warnings, only show one combined warning per group
          if (orGroupKey != null && orGroupKey.isNotEmpty) {
            if (!processedOrGroups.contains(orGroupKey)) {
              processedOrGroups.add(orGroupKey);

              // Combine all unique messages from this or_group with "OR" separator
              final groupMsgs = orGroupMessages[orGroupKey] ?? [msg];
              final uniqueMsgs = groupMsgs.toSet().toList();

              if (uniqueMsgs.length > 1) {
                // Combine multiple messages with clear separation
                final langCode = widget.language.toLowerCase();
                final separator = langCode == 'hi'
                    ? ' या '
                    : langCode == 'te'
                        ? ' లేదా '
                        : ' OR ';
                final combinedMsg = uniqueMsgs.join(separator);
                unsatisfiedWarnings.add(combinedMsg);
              } else {
                // Single message, just use it
                unsatisfiedWarnings.add(uniqueMsgs.first);
              }
            } else {}
          } else {
            unsatisfiedWarnings.add(msg);
          }
        } else {}
      }
    }

    // Return all unique unsatisfied warning messages as a list for separate dialogs
    if (unsatisfiedWarnings.isNotEmpty) {
      // Remove duplicates and return as list
      return unsatisfiedWarnings.toSet().toList();
    }

    return null;
  }

  String _getWarningMessage(
    Map<String, dynamic> warning,
    String? fallbackText,
    String language,
  ) {
    final entryMessage = (warning['message'] as String?)?.trim();
    if (entryMessage != null && entryMessage.isNotEmpty) {
      return entryMessage;
    }

    if (fallbackText != null && fallbackText.isNotEmpty) {
      return fallbackText;
    }

    final langCode = language.toLowerCase();
    if (langCode == 'hi') {
      return 'कृपया अगला चरण जारी रखने से पहले अपने चयन की समीक्षा करें।';
    } else if (langCode == 'te') {
      return 'దయచేసి కొనసాగించే ముందు మీ ఎంపికను సమీక్షించండి.';
    }
    return 'Please review your selection before continuing.';
  }

  List<Map<String, dynamic>> _extractWarningEntries(dynamic rawWarning) {
    if (rawWarning == null) return const <Map<String, dynamic>>[];

    dynamic parsed = rawWarning;
    if (rawWarning is String) {
      final trimmed = rawWarning.trim();
      if (trimmed.isEmpty) return const <Map<String, dynamic>>[];
      try {
        parsed = jsonDecode(trimmed);
      } catch (e) {
        debugPrint('Survey: Failed to parse option warning: $e');
        return const <Map<String, dynamic>>[];
      }
    }

    final entries = <Map<String, dynamic>>[];

    void addEntry(dynamic data, String trigger) {
      if (data is Map<String, dynamic>) {
        entries.add({...data, '__trigger': trigger});
      } else if (data is Iterable) {
        for (final item in data) {
          if (item is Map<String, dynamic>) {
            entries.add({...item, '__trigger': trigger});
          }
        }
      }
    }

    if (parsed is Map<String, dynamic>) {
      final core =
          parsed.containsKey('option_warning') &&
              parsed['option_warning'] is Map<String, dynamic>
          ? Map<String, dynamic>.from(
              parsed['option_warning'] as Map<String, dynamic>,
            )
          : Map<String, dynamic>.from(parsed);

      bool hasExplicitTriggers = false;

      for (final entry in core.entries) {
        final key = entry.key.toString().toLowerCase();
        String? trigger;

        if (key == 'selected') {
          trigger = 'selected';
        } else if (key == 'not_selected' ||
            key == 'not selected' ||
            key == 'not-selected' ||
            key == 'unselected') {
          trigger = 'not_selected';
        }

        if (trigger != null) {
          hasExplicitTriggers = true;
          addEntry(entry.value, trigger);
        }
      }

      if (hasExplicitTriggers) {
        return entries;
      }

      addEntry(core, 'selected');
      return entries;
    }

    if (parsed is Iterable) {
      for (final item in parsed) {
        if (item is Map<String, dynamic>) {
          entries.add({...item, '__trigger': 'selected'});
        }
      }
    }

    return entries;
  }

  bool _shouldEvaluateWarningForSelection(
    Map<String, dynamic> warning,
    bool isSelected,
  ) {
    final trigger = (warning['__trigger'] as String?)?.toLowerCase();
    switch (trigger) {
      case 'selected':
        return isSelected;
      case 'not_selected':
        return !isSelected;
      default:
        return true;
    }
  }

  bool _doesWarningConditionMatch(
    Map<String, dynamic> warning,
    Fragment$QuestionFetch question,
  ) {
    final effectiveWarning = Map<String, dynamic>.from(warning)
      ..remove('__trigger');

    if (effectiveWarning.isEmpty ||
        (effectiveWarning.length == 1 &&
            effectiveWarning.containsKey('message'))) {
      return true;
    }

    final rawTarget =
        effectiveWarning['target_question_id'] ??
        effectiveWarning['targetQuestionId'] ??
        effectiveWarning['target_question_key'] ??
        effectiveWarning['targetQuestionKey'];
    final targetQuestionId = _resolveWarningTargetQuestionId(
      rawTarget,
      question,
    );

    final rawType =
        effectiveWarning['condition_type'] ?? effectiveWarning['conditionType'];
    String? conditionType;
    if (rawType is String) {
      conditionType = rawType.trim().toLowerCase();
    } else if (rawType != null) {
      conditionType = rawType.toString().trim().toLowerCase();
    }
    final conditionValue = _normalizeConditionValue(effectiveWarning['value']);

    // Special handling for cross-question land comparison.
    const String totalLandFieldKey = 'total_land_owned';
    const String totalLandUnitFieldKey = 'total_land_unit';
    const String landInNameFieldKey = 'land_in_name';
    const String landInNameUnitFieldKey = 'land_in_name_unit';

    if (_matchesQuestionFieldKey(question, landInNameFieldKey) ||
        _matchesQuestionFieldKey(question, landInNameUnitFieldKey)) {
      // Get land values
      final landInNameAnswer = _getAnswerByQuestionFieldKey(landInNameFieldKey);
      final totalLandAnswer = _getAnswerByQuestionFieldKey(totalLandFieldKey);

      // Get land unit selections (these are option IDs, need to resolve to text)
      final landInNameUnitId = _getAnswerByQuestionFieldKey(
        landInNameUnitFieldKey,
      );
      final totalLandUnitId = _getAnswerByQuestionFieldKey(
        totalLandUnitFieldKey,
      );

      // Resolve option IDs to option text
      final landInNameUnit = _getOptionTextFromId(landInNameUnitId);
      final totalLandUnit = _getOptionTextFromId(totalLandUnitId);

      debugPrint(
        'CrossQuestionValidation: land_in_name=$landInNameAnswer ($landInNameUnit), total_land_owned=$totalLandAnswer ($totalLandUnit)',
      );

      if (landInNameAnswer != null && totalLandAnswer != null) {
        final landInNameValue = num.tryParse(landInNameAnswer);
        final totalLandValue = num.tryParse(totalLandAnswer);

        if (landInNameValue != null && totalLandValue != null) {
          // Convert both to acres for comparison
          final landInNameInAcres = _convertToAcres(
            landInNameValue,
            landInNameUnit,
          );
          final totalLandInAcres = _convertToAcres(
            totalLandValue,
            totalLandUnit,
          );

          debugPrint(
            'CrossQuestionValidation (acres): land_in_name=$landInNameInAcres, total_land_owned=$totalLandInAcres',
          );

          // Only show warning if land in name >= total land owned (must be strictly less)
          if (landInNameInAcres < totalLandInAcres) {
            return false; // Valid - no warning needed
          }
          // If greater or equal, continue to show warning
          return true;
        }
      }
      // If either value is not set, don't show warning
      return false;
    }

    if ((conditionType == null || conditionType.isEmpty) &&
        targetQuestionId == null) {
      // No specific condition provided; treat as match when a warning exists.
      return true;
    }

    final targetAnswer = targetQuestionId != null
        ? _answers[targetQuestionId]
        : null;

    // Check if value should come from another question's answer
    final valueFromQuestion =
        effectiveWarning['value_from_question'] ??
        effectiveWarning['valueFromQuestion'] ??
        effectiveWarning['compare_to_question'] ??
        effectiveWarning['compareToQuestion'];

    String? effectiveConditionValue = conditionValue;
    if (valueFromQuestion != null) {
      // Get the answer from the referenced question
      final valueQuestionKey = valueFromQuestion.toString();
      effectiveConditionValue = _getAnswerByQuestionKey(valueQuestionKey);
    }

    // Debug log for condition matching
    debugPrint(
      'SurveyWarningCondition: Type: $conditionType | Target: $targetQuestionId | Answer: $targetAnswer | Value: $effectiveConditionValue | ValueFromQuestion: $valueFromQuestion',
    );

    switch (conditionType) {
      case null:
      case '':
        // If value_from_question is specified, we need a proper condition type
        // to compare, so don't show warning without it
        if (valueFromQuestion != null) {
          return false;
        }
        return true;
      case 'equals':
      case 'equal':
        return _equalsCondition(targetAnswer, effectiveConditionValue);
      case 'not_equals':
      case 'not equals':
      case 'not-equals':
        return !_equalsCondition(targetAnswer, effectiveConditionValue);
      case 'contains':
        return _containsCondition(targetAnswer, effectiveConditionValue);
      case 'not_contains':
      case 'not contains':
      case 'not-contains':
        return !_containsCondition(targetAnswer, effectiveConditionValue);
      case 'greater_than':
      case 'greater than':
      case 'greater-than':
      case 'greater':
        return _greaterThanCondition(targetAnswer, effectiveConditionValue);
      case 'less_than':
      case 'less than':
      case 'less-than':
      case 'less':
        return _lessThanCondition(targetAnswer, effectiveConditionValue);
      case 'is_empty':
      case 'is empty':
      case 'is-empty':
        return _isEmptyCondition(targetAnswer);
      case 'is_not_empty':
      case 'is not empty':
      case 'is-not-empty':
        return !_isEmptyCondition(targetAnswer);
      case 'in':
      case 'is_in':
      case 'is in':
      case 'is-in':
        return _inCondition(targetAnswer, effectiveWarning['value']);
      case 'not_in':
      case 'not in':
      case 'not-in':
        return !_inCondition(targetAnswer, effectiveWarning['value']);
      default:
        return false;
    }
  }

  String? _resolveWarningTargetQuestionId(
    dynamic rawTarget,
    Fragment$QuestionFetch? currentQuestion,
  ) {
    if (rawTarget == null) {
      return currentQuestion?.id;
    }

    final target = rawTarget.toString().trim();
    if (target.isEmpty) {
      return currentQuestion?.id;
    }

    final normalized = target.toLowerCase();
    if (normalized == 'self' ||
        normalized == 'current' ||
        normalized == 'this' ||
        normalized == 'same') {
      return currentQuestion?.id;
    }

    final candidateTargets = <String>{target, normalized};

    final decodedTarget = _tryDecodeGlobalId(target);
    if (decodedTarget != null) {
      candidateTargets.add(decodedTarget);
      candidateTargets.add(decodedTarget.toLowerCase());
      final decodedParts = decodedTarget.split(':');
      if (decodedParts.isNotEmpty) {
        final lastPart = decodedParts.last;
        candidateTargets.add(lastPart);
        candidateTargets.add(lastPart.toLowerCase());
      }
    }

    String? _matchAgainstVariants(String key) {
      final variants = <String>{key, key.toLowerCase()};

      final decodedKey = _tryDecodeGlobalId(key);
      if (decodedKey != null) {
        variants.add(decodedKey);
        variants.add(decodedKey.toLowerCase());
        final decodedParts = decodedKey.split(':');
        if (decodedParts.isNotEmpty) {
          final last = decodedParts.last;
          variants.add(last);
          variants.add(last.toLowerCase());
        }
      }

      if (variants.any(candidateTargets.contains)) {
        return key;
      }
      return null;
    }

    for (final answerKey in _answers.keys) {
      final match = _matchAgainstVariants(answerKey);
      if (match != null) {
        return match;
      }
    }

    final allQuestions = _getSortedQuestions();
    for (final q in allQuestions) {
      final match = _matchAgainstVariants(q.id);
      if (match != null) return q.id;

      final key = q.key;
      if (key != null && key.isNotEmpty) {
        final keyMatch = _matchAgainstVariants(key);
        if (keyMatch != null) {
          return q.id;
        }
      }
    }

    if (currentQuestion != null) {
      final currentDecoded = _tryDecodeGlobalId(currentQuestion.id);
      if (currentDecoded != null) {
        final parts = currentDecoded.split(':');
        if (parts.isNotEmpty && candidateTargets.contains(parts.last)) {
          return currentQuestion.id;
        }
      }
    }

    return currentQuestion?.id;
  }

  String? _normalizeConditionValue(dynamic rawValue) {
    if (rawValue == null) return null;
    if (rawValue is String) return rawValue;
    return rawValue.toString();
  }

  String? _tryDecodeGlobalId(String value) {
    final sanitized = value.trim();
    if (sanitized.isEmpty) return null;

    final base64Pattern = RegExp(r'^[A-Za-z0-9+/=_-]+$');
    if (!base64Pattern.hasMatch(sanitized)) {
      return null;
    }

    var normalized = sanitized.replaceAll('-', '+').replaceAll('_', '/');
    final remainder = normalized.length % 4;
    if (remainder != 0) {
      normalized = normalized.padRight(
        normalized.length + (4 - remainder),
        '=',
      );
    }

    try {
      final decoded = utf8.decode(base64.decode(normalized));
      return decoded.isEmpty ? null : decoded;
    } catch (_) {
      return null;
    }
  }

  String? _normalizeStringValue(dynamic value) {
    if (value == null) return null;
    final str = value.toString().trim();
    if (str.isEmpty) return null;
    return str.toLowerCase();
  }

  bool _stringEquals(dynamic candidate, String? normalizedReference) {
    final normalizedCandidate = _normalizeStringValue(candidate);
    if (normalizedCandidate == null || normalizedReference == null) {
      return false;
    }
    return normalizedCandidate == normalizedReference;
  }

  bool _stringContains(dynamic haystack, String? normalizedNeedle) {
    final normalizedHaystack = _normalizeStringValue(haystack);
    if (normalizedHaystack == null || normalizedNeedle == null) {
      return false;
    }
    return normalizedHaystack.contains(normalizedNeedle);
  }

  bool _isOptionSelectedForAnswer(
    dynamic answer,
    Fragment$QuestionFetch$options$edges$node option,
  ) {
    if (answer == null) return false;
    if (answer is String) {
      return answer == option.id;
    }
    if (answer is Iterable) {
      return answer.contains(option.id);
    }
    return false;
  }

  Future<void> _showOptionWarningDialog(String message) async {
    if (!mounted) return;

    final warningTitle = LanguageUtils.getWarningText(widget.language);

    // Only speak the warning message if mode supports voice (not manual mode)
    if (widget.mode.hasVoice) {
      _speakIfAvailable('$warningTitle. $message');
    }

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(warningTitle),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(LanguageUtils.getOKText(widget.language)),
          ),
        ],
      ),
    );
  }

  bool _evaluateSingleOptionCondition(
    Fragment$QuestionFetch$options$edges$node$conditions condition,
  ) {
    final targetQuestionId = condition.targetQuestion.id;
    final targetAnswer = _answers[targetQuestionId];

    if (targetAnswer == null) {
      // Only show when checking IS_EMPTY
      return condition.conditionType ==
          Enum$SurveyOptionConditionConditionTypeChoices.IS_EMPTY;
    }

    switch (condition.conditionType) {
      case Enum$SurveyOptionConditionConditionTypeChoices.EQUALS:
        return _equalsCondition(targetAnswer, condition.value);
      case Enum$SurveyOptionConditionConditionTypeChoices.NOT_EQUALS:
        return !_equalsCondition(targetAnswer, condition.value);
      case Enum$SurveyOptionConditionConditionTypeChoices.CONTAINS:
        return _containsCondition(targetAnswer, condition.value);
      case Enum$SurveyOptionConditionConditionTypeChoices.NOT_CONTAINS:
        return !_containsCondition(targetAnswer, condition.value);
      case Enum$SurveyOptionConditionConditionTypeChoices.GREATER_THAN:
        return _greaterThanCondition(targetAnswer, condition.value);
      case Enum$SurveyOptionConditionConditionTypeChoices.LESS_THAN:
        return _lessThanCondition(targetAnswer, condition.value);
      case Enum$SurveyOptionConditionConditionTypeChoices.IS_EMPTY:
        return _isEmptyCondition(targetAnswer);
      case Enum$SurveyOptionConditionConditionTypeChoices.IS_NOT_EMPTY:
        return !_isEmptyCondition(targetAnswer);
      default:
        return false;
    }
  }

  // Evaluate all conditions for a question
  bool _evaluateConditions(
    List<Fragment$QuestionFetch$conditions?> conditions,
  ) {
    if (conditions.isEmpty) return true;

    bool hasConditions = false;
    bool? aggregatedResult;

    for (final condition in conditions) {
      if (condition == null) continue;

      hasConditions = true;
      final conditionResult = _evaluateSingleCondition(condition);

      if (aggregatedResult == null) {
        aggregatedResult = conditionResult;
        continue;
      }

      final op =
          condition.logicOperator ??
          Enum$SurveyQuestionConditionLogicOperatorChoices.AND;

      if (op == Enum$SurveyQuestionConditionLogicOperatorChoices.OR) {
        aggregatedResult = aggregatedResult || conditionResult;
      } else {
        aggregatedResult = aggregatedResult && conditionResult;
      }
    }

    return hasConditions ? (aggregatedResult ?? true) : true;
  }

  // Evaluate a single condition
  bool _evaluateSingleCondition(Fragment$QuestionFetch$conditions condition) {
    final targetQuestionId = condition.targetQuestion?.id;
    if (targetQuestionId == null) return false;

    // Get the answer for the target question
    final targetAnswer = _answers[targetQuestionId];
    if (targetAnswer == null) {
      // If no answer, check if condition is "IS_EMPTY"
      return condition.conditionType ==
          Enum$SurveyQuestionConditionConditionTypeChoices.IS_EMPTY;
    }

    final conditionType = condition.conditionType;
    final conditionValue = condition.value;

    // Handle different condition types
    switch (conditionType) {
      case Enum$SurveyQuestionConditionConditionTypeChoices.EQUALS:
        return _equalsCondition(targetAnswer, conditionValue);
      case Enum$SurveyQuestionConditionConditionTypeChoices.NOT_EQUALS:
        return !_equalsCondition(targetAnswer, conditionValue);
      case Enum$SurveyQuestionConditionConditionTypeChoices.CONTAINS:
        return _containsCondition(targetAnswer, conditionValue);
      case Enum$SurveyQuestionConditionConditionTypeChoices.NOT_CONTAINS:
        return !_containsCondition(targetAnswer, conditionValue);
      case Enum$SurveyQuestionConditionConditionTypeChoices.GREATER_THAN:
        return _greaterThanCondition(targetAnswer, conditionValue);
      case Enum$SurveyQuestionConditionConditionTypeChoices.LESS_THAN:
        return _lessThanCondition(targetAnswer, conditionValue);
      case Enum$SurveyQuestionConditionConditionTypeChoices.IS_EMPTY:
        return _isEmptyCondition(targetAnswer);
      case Enum$SurveyQuestionConditionConditionTypeChoices.IS_NOT_EMPTY:
        return !_isEmptyCondition(targetAnswer);
      default:
        return false;
    }
  }

  bool _optionMatchesCondition(
    Fragment$QuestionFetch$options$edges$node? option,
    String normalizedCondition,
  ) {
    if (option == null) return false;
    if (_stringEquals(option.text, normalizedCondition)) return true;
    if (option.localizedText != null &&
        _stringEquals(option.localizedText!, normalizedCondition)) {
      return true;
    }
    return _stringEquals(option.id, normalizedCondition);
  }

  bool _equalsCondition(dynamic targetAnswer, String? conditionValue) {
    final normalizedCondition = _normalizeStringValue(conditionValue);
    if (normalizedCondition == null) return false;

    if (targetAnswer is String) {
      if (_survey != null) {
        for (final question in _getSortedQuestions()) {
          for (final optionEdge in question.options.edges) {
            final option = optionEdge?.node;
            if (option?.id == targetAnswer) {
              return _optionMatchesCondition(option, normalizedCondition);
            }
          }
        }
      }
      return _stringEquals(targetAnswer, normalizedCondition);
    }

    if (targetAnswer is List) {
      if (_survey != null) {
        for (final optionId in targetAnswer) {
          if (optionId is! String) continue;
          for (final question in _getSortedQuestions()) {
            for (final optionEdge in question.options.edges) {
              final option = optionEdge?.node;
              if (option?.id == optionId) {
                if (_optionMatchesCondition(option, normalizedCondition)) {
                  return true;
                }
              }
            }
          }
        }
      }
      for (final entry in targetAnswer) {
        if (_stringEquals(entry, normalizedCondition)) {
          return true;
        }
      }
      return false;
    }

    return _stringEquals(targetAnswer, normalizedCondition);
  }

  bool _optionContainsCondition(
    Fragment$QuestionFetch$options$edges$node? option,
    String normalizedCondition,
  ) {
    if (option == null) return false;
    if (_stringContains(option.text, normalizedCondition)) return true;
    if (option.localizedText != null &&
        _stringContains(option.localizedText!, normalizedCondition)) {
      return true;
    }
    return _stringContains(option.id, normalizedCondition);
  }

  bool _containsCondition(dynamic targetAnswer, String? conditionValue) {
    final normalizedCondition = _normalizeStringValue(conditionValue);
    if (normalizedCondition == null) return false;

    if (targetAnswer is String) {
      if (_survey != null) {
        for (final question in _getSortedQuestions()) {
          for (final optionEdge in question.options.edges) {
            final option = optionEdge?.node;
            if (option?.id == targetAnswer) {
              return _optionContainsCondition(option, normalizedCondition);
            }
          }
        }
      }
      return _stringContains(targetAnswer, normalizedCondition);
    }

    if (targetAnswer is Iterable) {
      for (final entry in targetAnswer) {
        if (_survey != null && entry is String) {
          bool foundMatch = false;
          for (final question in _getSortedQuestions()) {
            for (final optionEdge in question.options.edges) {
              final option = optionEdge?.node;
              if (option?.id == entry) {
                if (_optionContainsCondition(option, normalizedCondition)) {
                  return true;
                }
                foundMatch = true;
                break;
              }
            }
            if (foundMatch) break;
          }
        }
        if (_stringContains(entry, normalizedCondition)) {
          return true;
        }
      }
    }

    return false;
  }

  bool _greaterThanCondition(dynamic targetAnswer, String? conditionValue) {
    if (conditionValue == null) return false;

    // Parse the condition value
    final conditionNum = num.tryParse(conditionValue);
    if (conditionNum == null) return false;

    // Handle both num and String answer types
    num? answerNum;
    if (targetAnswer is num) {
      answerNum = targetAnswer;
    } else if (targetAnswer is String) {
      answerNum = num.tryParse(targetAnswer);
    }

    return answerNum != null && answerNum > conditionNum;
  }

  bool _lessThanCondition(dynamic targetAnswer, String? conditionValue) {
    if (conditionValue == null) return false;

    // Parse the condition value
    final conditionNum = num.tryParse(conditionValue);
    if (conditionNum == null) return false;

    // Handle both num and String answer types
    num? answerNum;
    if (targetAnswer is num) {
      answerNum = targetAnswer;
    } else if (targetAnswer is String) {
      answerNum = num.tryParse(targetAnswer);
    }

    return answerNum != null && answerNum < conditionNum;
  }

  bool _isEmptyCondition(dynamic targetAnswer) {
    if (targetAnswer is String) {
      // For option-based questions, an empty string means no selection
      return targetAnswer.isEmpty;
    } else if (targetAnswer is List) {
      // For checkbox questions, empty list means no selection
      return targetAnswer.isEmpty;
    }
    return targetAnswer == null;
  }

  bool _inCondition(dynamic targetAnswer, dynamic conditionValue) {
    // Parse the conditionValue to get list of possible values
    List<String> possibleValues = [];

    if (conditionValue is List) {
      for (final item in conditionValue) {
        final normalized = _normalizeStringValue(item);
        if (normalized != null) {
          possibleValues.add(normalized);
        }
      }
    } else if (conditionValue is String) {
      // Support single value as well
      final normalized = _normalizeStringValue(conditionValue);
      if (normalized != null) {
        possibleValues.add(normalized);
      }
    }

    if (possibleValues.isEmpty) return false;

    // Check if targetAnswer matches any of the possible values
    if (targetAnswer is String) {
      // Check against option text/localized text if it's an option ID
      if (_survey != null) {
        for (final question in _getSortedQuestions()) {
          for (final optionEdge in question.options.edges) {
            final option = optionEdge?.node;
            if (option?.id == targetAnswer) {
              final optionText =
                  option?.localizedText ?? option?.text ?? option?.id;
              for (final value in possibleValues) {
                if (_stringEquals(optionText, value)) {
                  return true;
                }
              }
            }
          }
        }
      }
      // Check against the targetAnswer directly
      for (final value in possibleValues) {
        if (_stringEquals(targetAnswer, value)) {
          return true;
        }
      }
      return false;
    }

    if (targetAnswer is List) {
      // For multiple selection questions
      if (_survey != null) {
        for (final optionId in targetAnswer) {
          if (optionId is! String) continue;
          for (final question in _getSortedQuestions()) {
            for (final optionEdge in question.options.edges) {
              final option = optionEdge?.node;
              if (option?.id == optionId) {
                final optionText =
                    option?.localizedText ?? option?.text ?? option?.id;
                for (final value in possibleValues) {
                  if (_stringEquals(optionText, value)) {
                    return true;
                  }
                }
              }
            }
          }
        }
      }
      // Check against list items directly
      for (final entry in targetAnswer) {
        for (final value in possibleValues) {
          if (_stringEquals(entry, value)) {
            return true;
          }
        }
      }
      return false;
    }

    // For other types, convert to string and check
    for (final value in possibleValues) {
      if (_stringEquals(targetAnswer, value)) {
        return true;
      }
    }

    return false;
  }

  // Helper method to check if an option is considered an "other" option
  bool _isOtherOption(Fragment$QuestionFetch$options$edges$node option) {
    // no need to check other language in english it will be other
    final optionText = option.text.toLowerCase();

    // Check for common "other" option texts in both English and Hindi
    final otherPatterns = [
      'other',
      'others',
      'specify',
      'please specify',
      'custom',
      'अन्य',
      'दूसरा',
      'अपना निर्दिष्ट करें',
      'कस्टम',
    ];

    return otherPatterns.any(
      (pattern) =>
          optionText.trim().toLowerCase() == pattern.trim().toLowerCase(),
    );
  }

  // Helper method to check if an option is considered a "none" option
  // "None" options are mutually exclusive - selecting "None" deselects all others,
  // and selecting any other option deselects "None"
  bool _isNoneOption(Fragment$QuestionFetch$options$edges$node option) {
    final optionText = option.text.toLowerCase().trim();

    // Check for common "none" option texts in both English and Hindi
    final nonePatterns = [
      'none',
      'none of the above',
      'none of these',
      'not applicable',
      'n/a',
      'कोई नहीं',
      'इनमें से कोई नहीं',
      'लागू नहीं',
    ];

    return nonePatterns.any(
      (pattern) => optionText == pattern.trim().toLowerCase(),
    );
  }

  // Helper method to get the display text for an option in the context of a question
  String _getOptionDisplayText(
    Fragment$QuestionFetch$options$edges$node option,
    Fragment$QuestionFetch question,
  ) {
    // Check if this is a dependent question (has filterOptionsQuestion)
    final filterRef = question.filterOptionsQuestion;
    if (filterRef != null) {
      // This is a dependent question - check if we should show custom text for "other" options
      if (_isOtherOption(option)) {
        // Get the source question
        Fragment$QuestionFetch? sourceQuestion;
        for (final q in _getSortedQuestions()) {
          if (q.id == filterRef.id) {
            sourceQuestion = q;
            break;
          }
        }

        if (sourceQuestion != null) {
          // Find the "other" option in the source question
          final sourceOtherOption = sourceQuestion.options.edges
              .where((edge) => edge?.node != null)
              .map((edge) => edge!.node!)
              .firstWhere(
                (sourceOpt) => _isOtherOption(sourceOpt),
                orElse: () => option,
              );

          // Get the custom text from the source question's "other" option
          final perOptionKey =
              '${sourceQuestion.id}_${sourceOtherOption.id}_other';
          final baseOtherKey = '${sourceQuestion.id}_other';
          final perOptionValue = _answers[perOptionKey];
          final baseOtherValue = _answers[baseOtherKey];

          String? customText;
          if (perOptionValue is String && perOptionValue.trim().isNotEmpty) {
            customText = perOptionValue.trim();
          } else if (baseOtherValue is String &&
              baseOtherValue.trim().isNotEmpty) {
            customText = baseOtherValue.trim();
          }

          // If we have custom text, return it instead of "Other"
          if (customText != null) {
            return customText;
          }
        }
      }
    }

    // For all other cases, return the localized text or original text
    final result = option.localizedText ?? option.text;
    return result;
  }

  // Helper method to determine if we should show custom text instead of input field for "other" options
  bool _shouldShowCustomTextInsteadOfInput(
    Fragment$QuestionFetch$options$edges$node option,
    Fragment$QuestionFetch question,
  ) {
    // Check if this is a dependent question (has filterOptionsQuestion)
    final filterRef = question.filterOptionsQuestion;
    if (filterRef != null) {
      // This is a dependent question - check if we have custom text for "other" options
      if (_isOtherOption(option)) {
        // Get the source question
        Fragment$QuestionFetch? sourceQuestion;
        for (final q in _getSortedQuestions()) {
          if (q.id == filterRef.id) {
            sourceQuestion = q;
            break;
          }
        }

        if (sourceQuestion != null) {
          // Find the "other" option in the source question
          final sourceOtherOption = sourceQuestion.options.edges
              .where((edge) => edge?.node != null)
              .map((edge) => edge!.node!)
              .firstWhere(
                (sourceOpt) => _isOtherOption(sourceOpt),
                orElse: () => option,
              );

          // Get the custom text from the source question's "other" option
          final perOptionKey =
              '${sourceQuestion.id}_${sourceOtherOption.id}_other';
          final baseOtherKey = '${sourceQuestion.id}_other';
          final perOptionValue = _answers[perOptionKey];
          final baseOtherValue = _answers[baseOtherKey];

          String? customText;
          if (perOptionValue is String && perOptionValue.trim().isNotEmpty) {
            customText = perOptionValue.trim();
          } else if (baseOtherValue is String &&
              baseOtherValue.trim().isNotEmpty) {
            customText = baseOtherValue.trim();
          }

          // If we have custom text, show it instead of the input field
          final result = customText != null;
          return result;
        }
      }
    }

    return false;
  }

  @override
  void initState() {
    super.initState();
    _initializeSurvey();
    // Initialize TTS for play buttons (available in all modes)
    _initializeTTS();
  }

  Future<void> _initializeTTS() async {
    await TTSService.instance.initialize();
    // Setup completion handler to reset speaking state
    TTSService.instance.setCompletionCallback(() {
      if (mounted) {
        // Only clear if the completed question matches what we expect
        // This prevents clearing a new question's state when switching quickly
        if (_currentlySpeakingQuestionId == _expectedCompletionQuestionId) {
          setState(() {
            _currentlySpeakingQuestionId = null;
            _expectedCompletionQuestionId = null;
          });
        }
      }
    });
    // Check TTS language availability
    _checkTTSLanguageAvailability();
  }

  Future<void> _checkTTSLanguageAvailability() async {
    final isAvailable = await _setTTSLanguage();
    if (mounted) {
      setState(() {
        _isTTSLanguageAvailable = isAvailable;
      });
    }
  }

  // Initialize survey - run tasks in parallel for faster loading
  Future<void> _initializeSurvey() async {
    // Run all initialization tasks in parallel for faster startup
    // Survey loading is the critical path - start it immediately
    final surveyFuture = _loadSurvey();

    // These can run in parallel with survey loading
    final prefsFuture = _initSharedPreferences();
    final placeFuture = _loadPlaceDataAsync();

    // Wait for all to complete (survey is most important)
    await Future.wait([surveyFuture, prefsFuture, placeFuture]);
  }

  // Initialize SharedPreferences
  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Load place.json data asynchronously without blocking survey load
  Future<void> _loadPlaceDataAsync() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/place.json',
      );
      final placeData = await _parsePlaceDataInBackground(jsonString);
      final clfData = await _parseClfDataInBackground(jsonString);

      if (mounted) {
        setState(() {
          _placeData = placeData;
          _clfData = clfData;
        });
      }
      debugPrint(
        'Loaded place data with ${placeData.length} states and ${clfData.length} CLF block groups',
      );
    } catch (e) {
      debugPrint('Error loading place.json: $e');
    }
  }

  // Parse place data - can be made async if needed for very large files
  Future<Map<String, Map<String, List<String>>>> _parsePlaceDataInBackground(
    String jsonString,
  ) async {
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    final Map<String, Map<String, List<String>>> placeData = {};

    jsonData.forEach((state, districts) {
      if (state.toString().startsWith('_')) return;

      if (districts is Map) {
        final Map<String, List<String>> districtMap = {};
        districts.forEach((district, blocks) {
          if (blocks is List) {
            districtMap[district] = List<String>.from(blocks);
          }
        });
        placeData[state] = districtMap;
      }
    });

    return placeData;
  }

  Future<Map<String, List<String>>> _parseClfDataInBackground(
    String jsonString,
  ) async {
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    final Map<String, List<String>> clfData = {};
    final rawClfData = jsonData['_clf'];

    if (rawClfData is Map) {
      rawClfData.forEach((block, clfs) {
        if (clfs is List) {
          clfData[block.toString()] =
              clfs.map((clf) => clf.toString()).toList();
        }
      });
    }

    return clfData;
  }

  // Get the SharedPreferences key for storing last answered question position
  String? _getLastAnsweredPositionKey(String surveyId, String? pageId) {
    if (pageId == null) {
      return null;
    }

    return '${_submissionId}survey_${surveyId}_page_${pageId}_last_answered_position';
  }

  // Save the last answered question position for a specific page
  Future<void> _saveLastAnsweredPosition(String pageId, int groupIndex) async {
    if (_prefs == null) return;

    final key = _getLastAnsweredPositionKey(widget.surveyId, pageId);

    if (key == null) {
      return;
    }

    await _prefs!.setInt(key, groupIndex);
    debugPrint(
      'Saved last answered position for page $pageId: $groupIndex (key: $key)',
    );
  }

  // Load the last answered question position for a specific page
  Future<int?> _loadLastAnsweredPosition(String pageId) async {
    if (_prefs == null) return null;

    final key = _getLastAnsweredPositionKey(widget.surveyId, pageId);
    if (key == null) {
      return null;
    }

    final position = _prefs!.getInt(key);
    debugPrint(
      'Loaded last answered position for page $pageId: $position (key: $key)',
    );
    return position;
  }

  // Clear saved positions for this survey (called when survey is submitted)
  Future<void> _clearSavedPositions() async {
    if (_prefs == null) return;

    final surveyKeyPrefix = 'survey_${widget.surveyId}_';
    final keys = _prefs!.getKeys().where(
      (key) => key.startsWith(surveyKeyPrefix),
    );

    for (final key in keys) {
      await _prefs!.remove(key);
    }
    debugPrint('Cleared all saved positions for survey ${widget.surveyId}');
  }

  // Validate if a saved position is still valid for current filtered questions
  int _findValidPositionForPage(int savedPosition, String pageId) {
    final questionGroups = _getQuestionGroups();

    // First check if saved position is within bounds
    if (savedPosition < 0 || savedPosition >= questionGroups.length) {
      debugPrint(
        'Saved position $savedPosition is out of bounds (total: ${questionGroups.length})',
      );
      return _findFirstQuestionIndexForPageById(pageId) ?? 0;
    }

    // Check if the question at saved position belongs to the correct page
    final groupAtPosition = questionGroups[savedPosition];
    final actualPageId = groupAtPosition.pageId;

    if (actualPageId == pageId) {
      // Check if this question group has any visible questions
      if (groupAtPosition.questions.any((q) => _shouldShowQuestion(q))) {
        debugPrint('Saved position $savedPosition is valid for page $pageId');
        return savedPosition;
      } else {
        debugPrint(
          'Question at saved position $savedPosition has no visible questions, finding fallback',
        );
      }
    } else {
      debugPrint(
        'Saved position $savedPosition belongs to page $actualPageId, expected page $pageId',
      );
    }

    // Fallback: find the first valid question for this page
    final firstValidIndex = _findFirstQuestionIndexForPageById(pageId);
    if (firstValidIndex != null) {
      debugPrint('Using fallback position $firstValidIndex for page $pageId');
      return firstValidIndex;
    }

    // Ultimate fallback: return 0
    debugPrint('No valid position found for page $pageId, using 0');
    return 0;
  }

  // Enhanced version of _findFirstQuestionIndexForPage that works with page ID
  int? _findFirstQuestionIndexForPageById(String pageId) {
    final questionGroups = _getQuestionGroups();

    debugPrint('_findFirstQuestionIndexForPageById: Looking for page $pageId');
    debugPrint(
      '_findFirstQuestionIndexForPageById: Question groups count: ${questionGroups.length}',
    );

    for (var index = 0; index < questionGroups.length; index++) {
      final group = questionGroups[index];
      final groupPageId = group.pageId;

      if (groupPageId == pageId) {
        // Check if this group has any visible questions
        final hasVisibleQuestions = group.questions.any(
          (q) => _shouldShowQuestion(q),
        );
        debugPrint(
          '_findFirstQuestionIndexForPageById: Group $index has visible questions: $hasVisibleQuestions',
        );

        if (hasVisibleQuestions) {
          debugPrint(
            '_findFirstQuestionIndexForPageById: Returning group index: $index',
          );
          return index;
        }
      }
    }

    debugPrint(
      '_findFirstQuestionIndexForPageById: No visible questions found for page $pageId',
    );
    return null;
  }

  // Find the first unanswered question in a specific page (smart fallback)
  int? _findFirstUnansweredQuestionForPage(String pageId) {
    final questionGroups = _getQuestionGroups();

    debugPrint(
      '_findFirstUnansweredQuestionForPage: Looking for unanswered questions in page $pageId',
    );

    for (var index = 0; index < questionGroups.length; index++) {
      final group = questionGroups[index];
      final groupPageId = group.pageId;

      if (groupPageId == pageId) {
        // Check if this group has any visible unanswered questions
        final hasUnansweredQuestions = group.questions.any(
          (q) => _shouldShowQuestion(q) && !_isQuestionAnswered(q),
        );
        debugPrint(
          '_findFirstUnansweredQuestionForPage: Group $index has unanswered questions: $hasUnansweredQuestions',
        );

        if (hasUnansweredQuestions) {
          debugPrint(
            '_findFirstUnansweredQuestionForPage: Found unanswered question at index $index',
          );
          return index;
        }
      }
    }

    debugPrint(
      '_findFirstUnansweredQuestionForPage: No unanswered questions found in page $pageId',
    );
    return _findFirstQuestionIndexForPageById(
      pageId,
    ); // Fallback to first question
  }

  // Check if a question is answered
  bool _isQuestionAnswered(Fragment$QuestionFetch question) {
    final answer = _answers[question.id];
    if (answer == null) return false;

    // Handle different question types
    switch (question.questionType) {
      case Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX:
        if (answer is List<String>) {
          return answer.isNotEmpty;
        }
        return false;
      case Enum$SurveyQuestionQuestionTypeChoices.RADIO:
      case Enum$SurveyQuestionQuestionTypeChoices.DROPDOWN:
        return answer is String && answer.isNotEmpty;
      case Enum$SurveyQuestionQuestionTypeChoices.TEXT:
      case Enum$SurveyQuestionQuestionTypeChoices.TEXTAREA:
      case Enum$SurveyQuestionQuestionTypeChoices.NUMBER:
      case Enum$SurveyQuestionQuestionTypeChoices.DATE:
        return answer is String && answer.trim().isNotEmpty;
      case Enum$SurveyQuestionQuestionTypeChoices.CONSENT:
        // Consent questions are considered answered if they have a true/false value
        return answer is bool || (answer is String && answer.isNotEmpty);
      default:
        return answer != null;
    }
  }

  // Check if a question should be shown based on conditions and evaluator
  bool _shouldShowQuestion(Fragment$QuestionFetch question) {
    // If question has no conditions, always show it
    bool shouldShow = true;
    if (!(question.conditions == null || question.conditions!.isEmpty)) {
      // Evaluate all conditions for this question
      shouldShow = _evaluateConditions(question.conditions!);
    }

    if (!shouldShow) return false;

    // Consent-specific evaluatorCondition handling
    if (question.questionType ==
        Enum$SurveyQuestionQuestionTypeChoices.CONSENT) {
      final evalExpr = question.evaluatorCondition?.trim();

      if (evalExpr != null && evalExpr.isNotEmpty) {
        _logVariableValuesForExpression(evalExpr);
        final evalResult = _evaluateBooleanExpression(evalExpr);
        debugPrint('Evaluates result: $evalResult');

        // If evaluator says true, skip consent entirely
        if (evalResult == true) {
          return false;
        }
      }
    }

    return true;
  }

  @override
  void dispose() {
    _pageController.dispose();
    _saveDebounceTimer?.cancel();
    // Dispose text controllers
    for (final controller in _textControllers.values) {
      controller.dispose();
    }
    // Dispose other option controllers
    for (final controller in _otherOptionControllers.values) {
      controller.dispose();
    }
    // Dispose focus nodes
    for (final focusNode in _focusNodes.values) {
      focusNode.dispose();
    }
    if (widget.mode.hasVoice) {
      TTSService.instance.stop();
    }
    super.dispose();
  }

  void _nextQuestion() async {
    // Dismiss keyboard on iOS before navigating
    FocusScope.of(context).unfocus();

    final questionGroups = _getQuestionGroups();
    if (questionGroups.isEmpty) return;

    if (_currentGroupIndex >= questionGroups.length) return;

    final currentGroup = questionGroups[_currentGroupIndex];

    for (final question in currentGroup.questions) {
      if (!_isQuestionSatisfied(question)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(LanguageUtils.getFieldRequiredText(widget.language)),
            backgroundColor: Colors.red,
          ),
        );
        final otherFocusKey = _missingOtherFocusKey(question);
        if (otherFocusKey != null) {
          final otherFocusNode = _focusNodes[otherFocusKey];
          otherFocusNode?.requestFocus();
        } else {
          final focusNode = _focusNodes[question.id];
          if (focusNode != null && !focusNode.hasFocus) {
            focusNode.requestFocus();
          }
        }
        return;
      }

      final currentAnswer = _answers[question.id];
      if (_isNumericQuestionType(question.questionType) &&
          currentAnswer is String &&
          currentAnswer.isNotEmpty) {
        final number = num.tryParse(currentAnswer);
        if (number != null) {
          if (question.minValue != null && question.minValue!.isNotEmpty) {
            final minValue = num.tryParse(question.minValue!);
            if (minValue != null && number < minValue) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isHindi
                        ? 'मान ${minValue} से कम नहीं हो सकता'
                        : 'Value must be at least ${minValue}',
                  ),
                  backgroundColor: Colors.red,
                ),
              );
              final focusNode = _focusNodes[question.id];
              focusNode?.requestFocus();
              return;
            }
          }

          if (question.maxValue != null && question.maxValue!.isNotEmpty) {
            final maxValue = num.tryParse(question.maxValue!);
            if (maxValue != null && number > maxValue) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isHindi
                        ? 'मान ${maxValue} से अधिक नहीं हो सकता'
                        : 'Value must be at most ${maxValue}',
                  ),
                  backgroundColor: Colors.red,
                ),
              );
              final focusNode = _focusNodes[question.id];
              focusNode?.requestFocus();
              return;
            }
          }
        }
      }
    }

    // Frontend validation: check if land in your name exceeds total land owned.
    // This uses unit conversion when land unit keys are present.
    final landValidationError = _validateLandComparison(currentGroup);
    if (landValidationError != null) {
      await _showOptionWarningDialog(landValidationError);
      return;
    }

    // Frontend validation: Check if Q1259 is "Yes" but Q742/Q743 have 0 children
    final childrenValidationError = _validateChildrenHouseholdConsistency(
      currentGroup,
    );
    if (childrenValidationError != null) {
      await _showOptionWarningDialog(childrenValidationError);
      return;
    }

    final warningMessages = _getBlockingWarningMessages(currentGroup);
    if (warningMessages != null && warningMessages.isNotEmpty) {
      // Show each warning as a separate stacked dialog
      for (final warningMessage in warningMessages) {
        if (warningMessage.trim().isNotEmpty) {
          await _showOptionWarningDialog(warningMessage);
        }
      }
      return;
    }

    await _saveCurrentGroupAnswers(currentGroup);

    // Save current position to SharedPreferences before moving to next question
    final currentPageId = currentGroup.pageId;
    if (currentPageId != null) {
      await _saveLastAnsweredPosition(currentPageId, _currentGroupIndex);
    } else {
      debugPrint(
        'Warning: Cannot save position - currentPageId is null for group $_currentGroupIndex',
      );
    }

    if (_shouldSubmitOnExitAnswer(currentGroup)) {
      _submitSurvey();
      return;
    }

    final allQuestions = _getSortedQuestions();
    final lastQuestion = currentGroup.lastQuestion;
    final lastQuestionIndex = lastQuestion != null
        ? allQuestions.indexWhere((q) => q.id == lastQuestion.id)
        : -1;

    final updatedGroups = _getQuestionGroups();
    int nextGroupIndex = -1;

    if (lastQuestionIndex != -1) {
      for (var index = 0; index < updatedGroups.length; index++) {
        final firstQuestion = updatedGroups[index].firstQuestion;
        if (firstQuestion == null) continue;

        final firstQuestionIndex = allQuestions.indexWhere(
          (q) => q.id == firstQuestion.id,
        );
        if (firstQuestionIndex > lastQuestionIndex) {
          nextGroupIndex = index;
          break;
        }
      }
    }

    if (nextGroupIndex != -1) {
      setState(() {
        _currentGroupIndex = nextGroupIndex;
      });
      _pageController.jumpToPage(nextGroupIndex);
      // TTS will be handled by PageView's onPageChanged callback
    } else {
      _submitSurvey();
    }
  }

  bool _shouldSubmitOnExitAnswer(QuestionGroup group) {
    for (final question in group.questions) {
      final key = question.key?.trim().toLowerCase();
      if (key != 'exit_question') continue;

      final answer = _answers[question.id];

      if (answer is String && answer.isNotEmpty) {
        if (_isExitNoSelection(question, answer) ||
            answer.trim().toLowerCase() == 'no') {
          return true;
        }
      } else if (answer is List) {
        for (final entry in answer) {
          if (entry is String && entry.isNotEmpty) {
            if (_isExitNoSelection(question, entry) ||
                entry.trim().toLowerCase() == 'no') {
              return true;
            }
          }
        }
      }
    }
    return false;
  }

  bool _isExitNoSelection(Fragment$QuestionFetch question, String optionId) {
    final option = _findOptionById(question, optionId);
    if (option == null) return false;

    final localized = option.localizedText?.trim().toLowerCase();
    final fallback = option.text.trim().toLowerCase();

    if (localized == 'no' || fallback == 'no') {
      return true;
    }

    return false;
  }

  void _previousQuestion() async {
    // Dismiss keyboard on iOS before navigating
    FocusScope.of(context).unfocus();

    final questionGroups = _getQuestionGroups();
    if (questionGroups.isEmpty) return;

    int targetIndex = _currentGroupIndex;
    if (targetIndex >= questionGroups.length) {
      targetIndex = questionGroups.length - 1;
    }

    if (targetIndex <= 0) return;

    final previousIndex = targetIndex - 1;

    setState(() {
      _currentGroupIndex = previousIndex;
    });
    _pageController.jumpToPage(previousIndex);

    // Save current position to SharedPreferences when navigating to previous question
    if (previousIndex < questionGroups.length) {
      final previousGroup = questionGroups[previousIndex];
      final currentPageId = previousGroup.pageId;
      if (currentPageId != null) {
        await _saveLastAnsweredPosition(currentPageId, previousIndex);
      } else {
        debugPrint(
          'Warning: Cannot save position - currentPageId is null for previous group $previousIndex',
        );
      }
    }
  }

  Future<bool> _setTTSLanguage() async {
    // Get TTS language code for all supported Indian languages
    final ttsLanguageCode = LanguageUtils.getTTSLanguageCode(widget.language);

    // Check if language is available on device
    final isAvailable = await TTSService.instance.isLanguageAvailable(
      ttsLanguageCode,
    );

    if (isAvailable) {
      await TTSService.instance.setLanguage(ttsLanguageCode);
    }

    return isAvailable;
  }

  /// Helper method to speak text only if TTS language is available
  Future<void> _speakIfAvailable(String text) async {
    if (!_isTTSLanguageAvailable) return;
    await TTSService.instance.speak(text);
  }

  /// Speak a single question's text (and hint if available) - for play button
  Future<void> _speakSingleQuestion(Fragment$QuestionFetch question) async {
    if (_isInModalContext) return;

    // If this question is already speaking, stop it
    if (_currentlySpeakingQuestionId == question.id) {
      // Clear expected ID so completion callback won't interfere
      setState(() {
        _currentlySpeakingQuestionId = null;
        _expectedCompletionQuestionId = null;
      });
      await TTSService.instance.stop();
      return;
    }

    // Set the new question ID BEFORE stopping the old one
    // This prevents the stop callback from clearing our new ID
    setState(() {
      _currentlySpeakingQuestionId = question.id;
    });

    // If another question was speaking, stop it (completion callback will be ignored
    // because _expectedCompletionQuestionId won't match)
    if (TTSService.instance.isSpeaking) {
      await TTSService.instance.stop();
    }

    final isLanguageAvailable = await _setTTSLanguage();
    if (!isLanguageAvailable) {
      setState(() {
        _currentlySpeakingQuestionId = null;
        _expectedCompletionQuestionId = null;
      });
      return;
    }

    final effectiveQuestionText = question.localizedText ?? question.text;
    final questionText = _evaluateTemplate(effectiveQuestionText, question);

    // Include hint in the speech if available
    final hintText = _effectiveQuestionHint(question);
    String textToSpeak = questionText;
    if (hintText != null && hintText.isNotEmpty) {
      textToSpeak = '$questionText. $hintText';
    }

    // Set expected completion ID right before speaking
    // This is the question we expect to complete
    _expectedCompletionQuestionId = question.id;

    await TTSService.instance.speak(textToSpeak);
  }

  /// Stop TTS and clear speaking state
  Future<void> _stopTTS() async {
    if (TTSService.instance.isSpeaking) {
      await TTSService.instance.stop();
    }
    if (mounted) {
      setState(() {
        _currentlySpeakingQuestionId = null;
        _expectedCompletionQuestionId = null;
      });
    }
  }

  /// Build a TTS play button for a single question
  Widget _buildQuestionTTSButton(
    Fragment$QuestionFetch question,
    ColorScheme colorScheme,
  ) {
    // Only show play button for audio-based question modes
    final isAudioQuestionMode =
        widget.mode == SurveyMode.audioQuestions ||
        widget.mode.speaksAnswers;
    if (!isAudioQuestionMode) {
      return const SizedBox.shrink();
    }

    final isThisQuestionSpeaking = _currentlySpeakingQuestionId == question.id;

    return Tooltip(
      message: widget.language.toLowerCase() == 'hi'
          ? (isThisQuestionSpeaking ? 'रोकें' : 'प्रश्न सुनें')
          : (isThisQuestionSpeaking ? 'Stop' : 'Listen to question'),
      child: Material(
        color: isThisQuestionSpeaking
            ? colorScheme.primaryContainer
            : colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () => _speakSingleQuestion(question),
          borderRadius: BorderRadius.circular(8),
          splashColor: colorScheme.primary.withValues(alpha: 0.2),
          highlightColor: colorScheme.primary.withValues(alpha: 0.1),
          child: Container(
            child: Icon(
              isThisQuestionSpeaking
                  ? Icons.stop_rounded
                  : Icons.play_circle_outlined,
              color: isThisQuestionSpeaking
                  ? colorScheme.primary
                  : colorScheme.onSurface.withValues(alpha: 0.7),
              size: 24,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickAndUploadSignature() async {
    if (!mounted) return;

    setState(() {
      _isUploadingSignature = true;
      _signatureUploadError = null;
      _isInModalContext = true;
    });

    try {
      // Show options for signature (drawing or upload)
      final source = await showModalBottomSheet<ImageSource>(
        context: context,
        builder: (context) => Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.draw),
                title: Text(
                  widget.language.toLowerCase() == 'hi'
                      ? 'हस्ताक्षर बनाएं'
                      : 'Draw Signature',
                ),
                onTap: () {
                  Navigator.pop(context);
                  _drawSignature();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(
                  widget.language.toLowerCase() == 'hi'
                      ? 'गैलरी से चुनें'
                      : 'Choose from Gallery',
                ),
                onTap: () {
                  Navigator.pop(context, ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      );

      if (!mounted) return;

      if (source == null) {
        // User dismissed picker options (including back/cancel)
        setState(() {
          _isUploadingSignature = false;
        });
        return;
      }

      // Pick image using image_picker
      final XFile? pickedFile = await ImagePicker().pickImage(
        source: source,
        imageQuality: 90,
        maxWidth: 800,
        maxHeight: 600,
      );

      if (!mounted) return;

      if (pickedFile == null) {
        // User backed out of camera/gallery without selecting/capturing
        setState(() {
          _isUploadingSignature = false;
        });
        return;
      }

      if (_submissionId == null) {
        throw Exception('Submission is not ready yet. Please try again.');
      }

      final File imageFile = File(pickedFile.path);

      // Upload the selected image with offline support
      final result = await OfflineSurveyService.instance.uploadFileWithOfflineSupport(
        submissionId: _submissionId!,
        file: imageFile,
        fileType: 'signature',
      );

      if (!mounted) return;

      setState(() {
        _signatureUrl = result['signature_url'];
        _isUploadingSignature = false;
      });
    } on PlatformException catch (e) {
      if (!mounted) return;
      setState(() {
        _signatureUploadError = e.message ?? e.toString();
        _isUploadingSignature = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _signatureUploadError = e.toString();
        _isUploadingSignature = false;
      });
    } finally {
      if (mounted) {
        setState(() {
          _isInModalContext = false;
        });
      }
    }
  }

  Future<void> _pickAndUploadPhoto() async {
    if (!mounted) return;

    setState(() {
      _isUploadingPhoto = true;
      _photoUploadError = null;
      _isInModalContext = true;
    });

    try {
      // Show options for photo (camera or gallery)
      final source = await showModalBottomSheet<ImageSource>(
        context: context,
        builder: (context) => Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(
                  widget.language.toLowerCase() == 'hi'
                      ? 'कैमरा उपयोग करें'
                      : 'Use Camera',
                ),
                onTap: () {
                  Navigator.pop(context, ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(
                  widget.language.toLowerCase() == 'hi'
                      ? 'गैलरी से चुनें'
                      : 'Choose from Gallery',
                ),
                onTap: () {
                  Navigator.pop(context, ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      );

      if (!mounted) return;

      if (source == null) {
        // User dismissed picker options (including back/cancel)
        setState(() {
          _isUploadingPhoto = false;
        });
        return;
      }

      // Pick image using image_picker
      final XFile? pickedFile = await ImagePicker().pickImage(
        source: source,
        imageQuality: 90,
        maxWidth: 1200,
        maxHeight: 1200,
      );

      if (!mounted) return;

      if (pickedFile == null) {
        // User backed out of camera/gallery without selecting/capturing
        setState(() {
          _isUploadingPhoto = false;
        });
        return;
      }

      if (_submissionId == null) {
        throw Exception('Submission is not ready yet. Please try again.');
      }

      final File imageFile = File(pickedFile.path);

      // Upload the selected image with offline support
      final result = await OfflineSurveyService.instance.uploadFileWithOfflineSupport(
        submissionId: _submissionId!,
        file: imageFile,
        fileType: 'photo',
      );

      if (!mounted) return;

      setState(() {
        _photoUrl = result['photo_url'];
        _isUploadingPhoto = false;
      });
    } on PlatformException catch (e) {
      if (!mounted) return;
      setState(() {
        _photoUploadError = e.message ?? e.toString();
        _isUploadingPhoto = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _photoUploadError = e.toString();
        _isUploadingPhoto = false;
      });
    } finally {
      if (mounted) {
        setState(() {
          _isInModalContext = false;
        });
      }
    }
  }

  Future<void> _drawSignature() async {
    if (!mounted) return;

    // Create a signature controller
    final signatureController = SignatureController(
      penStrokeWidth: 4,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
    );

    setState(() {
      _isInModalContext = true;
    });

    try {
      // Show signature drawing dialog
      final signatureData = await showDialog<Uint8List?>(
        context: context,
        builder: (context) => StatefulBuilder(
          builder: (context, setState) => Dialog(
            insetPadding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LanguageUtils.getDrawSignature(widget.language),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Signature(
                      controller: signatureController,
                      height: 300,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          signatureController.clear();
                        },
                        child: Text(LanguageUtils.getClearText(widget.language)),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (signatureController.isNotEmpty) {
                            final signature = await signatureController
                                .toPngBytes();
                            Navigator.pop(context, signature);
                          } else {
                            // Show error if no signature drawn
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  LanguageUtils.getPleaseDrawSignature(
                                    widget.language,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(LanguageUtils.getSaveText(widget.language)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(LanguageUtils.getCancelText(widget.language)),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Clean up the controller
      signatureController.dispose();

      if (!mounted) return;

      if (signatureData == null || signatureData.isEmpty) {
        // User cancelled the signature dialog
        return;
      }

      // Save signature to temporary file and upload
      final tempDir = await Directory.systemTemp.createTemp();
      final signatureFile = File('${tempDir.path}/signature.png');
      await signatureFile.writeAsBytes(signatureData);

      if (!mounted) return;

      if (_submissionId == null) {
        throw Exception('Submission is not ready yet. Please try again.');
      }

      setState(() {
        _isUploadingSignature = true;
        _signatureUploadError = null;
      });

      // Upload the signature with offline support
      final result = await OfflineSurveyService.instance
          .uploadFileWithOfflineSupport(
            submissionId: _submissionId!,
            file: signatureFile,
            fileType: 'signature',
          );

      if (!mounted) return;

      setState(() {
        _signatureUrl = result['signature_url'];
        _isUploadingSignature = false;
      });
    } on PlatformException catch (e) {
      signatureController.dispose();
      if (!mounted) return;
      setState(() {
        _signatureUploadError = e.message ?? e.toString();
        _isUploadingSignature = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _signatureUploadError = e.toString();
        _isUploadingSignature = false;
      });
    } finally {
      if (mounted) {
        setState(() {
          _isInModalContext = false;
        });
      }
    }
  }

  Widget _buildUploadSection() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Signature Section
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.edit, color: colorScheme.primary, size: 24),
                    const SizedBox(width: 12),
                    Text(
                      LanguageUtils.getSignatureText(widget.language),
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                if (_signatureUrl != null)
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: colorScheme.outline),
                          borderRadius: BorderRadius.circular(12),
                          color: colorScheme.surfaceVariant,
                        ),
                        child: Icon(
                          Icons.check_circle,
                          color: colorScheme.primary,
                          size: 48,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        isHindi
                            ? 'हस्ताक्षर सफलतापूर्वक अपलोड किया गया'
                            : 'Signature uploaded successfully',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                else if (_isUploadingSignature)
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: colorScheme.outline),
                          borderRadius: BorderRadius.circular(12),
                          color: colorScheme.surfaceVariant,
                        ),
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        LanguageUtils.getUploadingText(widget.language),
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  )
                else if (_signatureUploadError != null)
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: colorScheme.error),
                          borderRadius: BorderRadius.circular(12),
                          color: colorScheme.errorContainer,
                        ),
                        child: Icon(
                          Icons.error_outline,
                          color: colorScheme.error,
                          size: 48,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _signatureUploadError!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.error,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: _pickAndUploadSignature,
                        icon: const Icon(Icons.refresh),
                        label: Text(
                          LanguageUtils.getTryAgainText(widget.language),
                        ),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      // Signature drawing area
                      GestureDetector(
                        onTap: _drawSignature,
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            border: Border.all(color: colorScheme.outline),
                            borderRadius: BorderRadius.circular(12),
                            color: colorScheme.surfaceVariant,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.draw,
                                  color: colorScheme.onSurfaceVariant,
                                  size: 36,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  LanguageUtils.getTapToDrawSignature(
                                    widget.language,
                                  ),
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _pickAndUploadSignature,
                              icon: const Icon(Icons.upload_file),
                              label: Text(
                                LanguageUtils.getUploadSignature(
                                  widget.language,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.primary,
                                foregroundColor: colorScheme.onPrimary,
                                minimumSize: const Size(double.infinity, 50),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),

          // Photo Section
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.photo_camera,
                      color: colorScheme.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      LanguageUtils.getPhotoText(widget.language),
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                if (_photoUrl != null)
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: colorScheme.outline),
                          borderRadius: BorderRadius.circular(12),
                          color: colorScheme.surfaceVariant,
                        ),
                        child: Icon(
                          Icons.check_circle,
                          color: colorScheme.primary,
                          size: 48,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        isHindi
                            ? 'फोटो सफलतापूर्वक अपलोड किया गया'
                            : 'Photo uploaded successfully',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                else if (_skippedPhoto)
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: colorScheme.outline),
                          borderRadius: BorderRadius.circular(12),
                          color: colorScheme.surfaceVariant,
                        ),
                        child: Icon(
                          Icons.do_not_disturb_alt,
                          color: colorScheme.onSurfaceVariant,
                          size: 48,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        LanguageUtils.getPhotoSkipped(widget.language),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                else if (_isUploadingPhoto)
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: colorScheme.outline),
                          borderRadius: BorderRadius.circular(12),
                          color: colorScheme.surfaceVariant,
                        ),
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        LanguageUtils.getUploadingText(widget.language),
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  )
                else if (_photoUploadError != null)
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: colorScheme.error),
                          borderRadius: BorderRadius.circular(12),
                          color: colorScheme.errorContainer,
                        ),
                        child: Icon(
                          Icons.error_outline,
                          color: colorScheme.error,
                          size: 48,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _photoUploadError!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.error,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: _pickAndUploadPhoto,
                        icon: const Icon(Icons.refresh),
                        label: Text(
                          LanguageUtils.getTryAgainText(widget.language),
                        ),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      // Photo preview area
                      GestureDetector(
                        onTap: _pickAndUploadPhoto,
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: colorScheme.outline),
                            borderRadius: BorderRadius.circular(12),
                            color: colorScheme.surfaceVariant,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_a_photo,
                                  color: colorScheme.onSurfaceVariant,
                                  size: 36,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  LanguageUtils.getTapToAddPhoto(
                                    widget.language,
                                  ),
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _pickAndUploadPhoto,
                              icon: const Icon(Icons.camera_alt),
                              label: Text(
                                LanguageUtils.getUploadPhoto(widget.language),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.primary,
                                foregroundColor: colorScheme.onPrimary,
                                minimumSize: const Size(double.infinity, 50),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {
                                setState(() {
                                  _skippedPhoto = true;
                                });
                              },
                              icon: const Icon(Icons.skip_next),
                              label: Text(
                                LanguageUtils.getSkipText(widget.language),
                              ),
                              style: OutlinedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _isCurrentGroupValid() {
    final questionGroups = _getQuestionGroups();
    if (questionGroups.isEmpty) return false;

    if (_currentGroupIndex >= questionGroups.length) return false;

    final currentGroup = questionGroups[_currentGroupIndex];

    for (final question in currentGroup.questions) {
      if (!_isQuestionSatisfied(question)) {
        return false;
      }
    }

    return true;
  }

  // Helper method to check if an "other" option is selected but text is empty
  bool _hasEmptyOtherOption(Fragment$QuestionFetch question) {
    final answer = _answers[question.id];

    // Check for radio button "other" option
    if (answer is String) {
      final options = question.options.edges
          .where((edge) => edge?.node != null)
          .map((edge) => edge!.node!)
          .toList();

      for (final option in options) {
        if (_isOtherOption(option) && answer == option.id) {
          // Skip validation if we should show custom text instead of input field
          if (_shouldShowCustomTextInsteadOfInput(option, question)) {
            debugPrint(
              '_hasEmptyOtherOption: Skipping validation for question ${question.id} - showing custom text instead of input',
            );
            return false;
          }

          final perOptionKey = '${question.id}_${option.id}_other';
          final otherText =
              (_answers[perOptionKey] as String?) ??
              (_answers['${question.id}_other'] as String?);
          if (otherText == null || otherText.trim().isEmpty) {
            return true;
          }
        }
      }
    }

    // Check for checkbox "other" options
    if (answer is List<String>) {
      final options = question.options.edges
          .where((edge) => edge?.node != null)
          .map((edge) => edge!.node!)
          .toList();

      for (final option in options) {
        if (_isOtherOption(option) && answer.contains(option.id)) {
          // Skip validation if we should show custom text instead of input field
          if (_shouldShowCustomTextInsteadOfInput(option, question)) {
            debugPrint(
              '_hasEmptyOtherOption: Skipping validation for question ${question.id} - showing custom text instead of input',
            );
            return false;
          }

          final otherText =
              _answers['${question.id}_${option.id}_other'] as String?;
          if (otherText == null || otherText.trim().isEmpty) {
            return true;
          }
        }
      }
    }

    // Check for dropdown "other" option
    if (answer is String) {
      final options = question.options.edges
          .where((edge) => edge?.node != null)
          .map((edge) => edge!.node!)
          .toList();

      for (final option in options) {
        if (_isOtherOption(option) && answer == option.id) {
          // Skip validation if we should show custom text instead of input field
          if (_shouldShowCustomTextInsteadOfInput(option, question)) {
            debugPrint(
              '_hasEmptyOtherOption: Skipping validation for question ${question.id} - showing custom text instead of input',
            );
            return false;
          }

          final otherText =
              _answers['${question.id}_${option.id}_other'] as String?;
          if (otherText == null || otherText.trim().isEmpty) {
            return true;
          }
        }
      }
    }

    return false;
  }

  bool _hasAnswer(Fragment$QuestionFetch question) {
    final answer = _answers[question.id];

    // Consent questions rely on evaluator condition; treat as answered when allowed.
    if (question.questionType ==
        Enum$SurveyQuestionQuestionTypeChoices.CONSENT) {
      final evalExpr = question.evaluatorCondition?.trim();
      debugPrint('=== CONSENT QUESTION _hasAnswer EVALUATION ===');
      debugPrint('Question ID: ${question.id}');
      debugPrint(
        'Question Text: ${question.text?.replaceAll('\n', ' ') ?? 'No text'}',
      );
      debugPrint('Evaluator Condition: ${evalExpr ?? 'None'}');

      if (evalExpr == null || evalExpr.isEmpty) {
        debugPrint(
          '✅ CONSENT QUESTION CONSIDERED ANSWERED - No evaluator condition',
        );
        debugPrint('=== END CONSENT QUESTION _hasAnswer EVALUATION ===');
        return true;
      }
      debugPrint('Variable values used in evaluation:');
      _logVariableValuesForExpression(evalExpr);
      final evalResult = _evaluateBooleanExpression(evalExpr);
      debugPrint('Evaluates result: $evalResult');
      debugPrint(
        'CONSENT QUESTION _hasAnswer RESULT: ${evalResult ? 'ANSWERED' : 'NOT ANSWERED'}',
      );
      debugPrint('=== END CONSENT QUESTION _hasAnswer EVALUATION ===');
      return evalResult;
    }

    if (answer == null) return false;

    if (answer is String) {
      if (answer.trim().isEmpty) return false;
      if (_hasEmptyOtherOption(question)) return false;
      return true;
    }

    if (answer is List) {
      if (answer.isEmpty) return false;
      if (_hasEmptyOtherOption(question)) return false;
      return true;
    }

    return true;
  }

  bool _isQuestionSatisfied(Fragment$QuestionFetch question) {
    if (question.questionType ==
        Enum$SurveyQuestionQuestionTypeChoices.CONSENT) {
      final evalExpr = question.evaluatorCondition?.trim();
      debugPrint('=== CONSENT QUESTION _isQuestionSatisfied EVALUATION ===');
      debugPrint('Question ID: ${question.id}');
      debugPrint(
        'Question Text: ${question.text?.replaceAll('\n', ' ') ?? 'No text'}',
      );
      debugPrint('Evaluator Condition: ${evalExpr ?? 'None'}');

      if (evalExpr == null || evalExpr.isEmpty) {
        debugPrint('✅ CONSENT QUESTION SATISFIED - No evaluator condition');
        debugPrint(
          '=== END CONSENT QUESTION _isQuestionSatisfied EVALUATION ===',
        );
        return true;
      }
      debugPrint('Variable values used in evaluation:');
      _logVariableValuesForExpression(evalExpr);
      final evalResult = _evaluateBooleanExpression(evalExpr);
      debugPrint('Evaluates result: $evalResult');
      debugPrint(
        'CONSENT QUESTION _isQuestionSatisfied RESULT: ${evalResult ? 'SATISFIED' : 'NOT SATISFIED'}',
      );
      debugPrint(
        '=== END CONSENT QUESTION _isQuestionSatisfied EVALUATION ===',
      );
      return evalResult;
    }

    if (!question.isRequired) {
      return true;
    }

    return _hasAnswer(question);
  }

  String? _otherTextForQuestion(Fragment$QuestionFetch question) {
    final collected = <String>[];

    String? _clean(String? raw) {
      if (raw == null) return null;
      final trimmed = raw.trim();
      return trimmed.isEmpty ? null : trimmed;
    }

    final baseKey = '${question.id}_other';
    final baseValue = _clean(_answers[baseKey] as String?);
    if (baseValue != null) {
      collected.add(baseValue);
    }

    for (final optionEdge in question.options.edges) {
      final option = optionEdge?.node;
      if (option == null) continue;
      if (!_isOtherOption(option)) continue;
      final perOptionKey = '${question.id}_${option.id}_other';
      final value = _clean(_answers[perOptionKey] as String?);
      if (value != null) {
        collected.add(value);
      }
    }

    if (collected.isEmpty) return null;

    if (question.questionType ==
        Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX) {
      return collected.toSet().join(', ');
    }

    return collected.first;
  }

  String? _missingOtherFocusKey(Fragment$QuestionFetch question) {
    final answer = _answers[question.id];
    final options = question.options.edges
        .where((edge) => edge?.node != null)
        .map((edge) => edge!.node!)
        .toList();

    if (answer is String) {
      Fragment$QuestionFetch$options$edges$node? matchedOption;
      for (final option in options) {
        if (option.id == answer) {
          matchedOption = option;
          break;
        }
      }

      if (matchedOption != null && _isOtherOption(matchedOption)) {
        final perOptionKey = '${question.id}_${matchedOption.id}_other';
        final radioKey = '${question.id}_other';
        final otherText =
            (_answers[perOptionKey] as String?) ??
            (_answers[radioKey] as String?);
        if (otherText == null || otherText.trim().isEmpty) {
          return perOptionKey;
        }
      }
    }

    if (answer is List<String>) {
      for (final option in options) {
        if (_isOtherOption(option) && answer.contains(option.id)) {
          final perOptionKey = '${question.id}_${option.id}_other';
          final otherText = (_answers[perOptionKey] as String?);
          if (otherText == null || otherText.trim().isEmpty) {
            return perOptionKey;
          }
        }
      }
    }

    return null;
  }

  Future<void> _loadSurvey() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Use OfflineSurveyService
      final survey = await OfflineSurveyService.instance.getSurvey(
        widget.surveyId,
        language: widget.language,
      );

      if (mounted) {
        setState(() {
          _survey = survey;
          _isLoading = false;
          // Invalidate all caches since survey data changed
          _invalidateAllCaches();
        });

        // Check if we have a responseId to load existing submission
        if (widget.responseId != null) {
          setState(() {
            _submissionId = widget.responseId;
          });
          debugPrint(
            'Survey Form: Loading existing submission with ID: ${widget.responseId}',
          );

          // Load existing answers for this submission
          await _loadExistingAnswers();
        } else {
          // Create new submission only if not loading existing response
          await _createNewSubmission();
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _createNewSubmission() async {
    try {
      // Only create new submission if we don't have a responseId
      if (widget.responseId == null) {
        final isOnline = ConnectivityService.instance.isOnline;

        if (isOnline) {
          // When online, create a draft submission on the backend
          // This allows answers to be saved to the server as the user progresses
          try {
            final submission = await SurveyService.instance.createSubmission(
              surveyId: widget.surveyId,
              status: 'draft',
            );

            if (submission != null) {
              setState(() {
                _submissionId = submission.id;
              });
              debugPrint(
                'Survey: Created backend draft submission with ID: ${submission.id}',
              );
              return;
            }
          } catch (e) {
            debugPrint(
              'Survey: Failed to create backend submission, falling back to local: $e',
            );
          }
        }

        // Offline or backend creation failed - use local ID
        // Answers will be stored locally and sent to backend on final submit
        final localId = 'local_${const Uuid().v4()}';
        setState(() {
          _submissionId = localId;
        });
        debugPrint('Survey: Using local ID: $localId');
      }
    } catch (e) {
      debugPrint('Error creating submission: $e');
    }
  }

  Future<void> _loadExistingAnswers() async {
    try {
      if (widget.responseId == null || _survey == null) return;

      // Show loading while finding the first unanswered question
      if (mounted) {
        setState(() {
          _isSubmitting = true;
        });
      }

      // Check if it's a local submission (draft or pending sync)
      if (widget.responseId!.startsWith('local_')) {
        final offlineSubmission = await OfflineStorageService.instance
            .getOfflineSubmission(widget.responseId!);

        if (offlineSubmission != null) {
          // Check if this is a draft (raw answers format) or a pending submission (Input$AnswerInput format)
          if (offlineSubmission.isDraft) {
            // Draft: Load raw answers map directly
            final answersMap = offlineSubmission.answers;

            for (final entry in answersMap.entries) {
              final key = entry.key;
              final value = entry.value;

              if (value != null) {
                // Handle List<dynamic> -> List<String> conversion for checkbox answers
                if (value is List) {
                  _answers[key] = value.map((e) => e.toString()).toList();
                } else {
                  _answers[key] = value;
                }
              }
            }

            debugPrint(
              'Loaded draft with ${answersMap.length} answers directly from raw format',
            );

            // Restore the group index to where user left off
            final lastGroupIndex = offlineSubmission.lastGroupIndex;
            if (lastGroupIndex != null && lastGroupIndex >= 0) {
              final questionGroups = _getQuestionGroups();
              if (lastGroupIndex < questionGroups.length) {
                _currentGroupIndex = lastGroupIndex;
                debugPrint('Restored draft position to group $lastGroupIndex');
                // Update page controller to show the correct page
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted && _pageController.hasClients) {
                    _pageController.jumpToPage(lastGroupIndex);
                    // Hide page list to show questions directly
                    setState(() {
                      _showPageList = false;
                    });
                  }
                });
              }
            }
            if (mounted) {
              setState(() {
                _isSubmitting = false;
              });
            }
            return;
          } else {
            // Pending sync submission: Load using Input$AnswerInput format
            final answersList =
                jsonDecode(offlineSubmission.answersJson) as List;

            for (final item in answersList) {
              final answer = Input$AnswerInput.fromJson(item);
              final questionId = answer.questionId;

              // Restore text answer
              if (answer.textAnswer != null) {
                _answers[questionId] = answer.textAnswer;
              }

              // Restore selected options
              if (answer.selectedOptionIds != null &&
                  answer.selectedOptionIds!.isNotEmpty) {
                // Check question type to determine if it's single or multiple selection
                final matchingQuestions = _getSortedQuestions().where(
                  (q) => q.id == questionId,
                );
                final question = matchingQuestions.isNotEmpty
                    ? matchingQuestions.first
                    : null;

                if (question != null) {
                  if (question.questionType ==
                      Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX) {
                    _answers[questionId] = answer.selectedOptionIds;
                  } else {
                    _answers[questionId] = answer.selectedOptionIds!.first;
                  }
                }
              }

              // Restore other text
              if (answer.otherText != null) {
                // We need to find the "other" option ID to reconstruct the key
                final matchingQuestions = _getSortedQuestions().where(
                  (q) => q.id == questionId,
                );
                final question = matchingQuestions.isNotEmpty
                    ? matchingQuestions.first
                    : null;

                if (question != null) {
                  final options = question.options.edges
                      .where((edge) => edge?.node != null)
                      .map((edge) => edge!.node!)
                      .toList();

                  for (final option in options) {
                    if (_isOtherOption(option)) {
                      // If it's a radio/dropdown, key is usually just ${questionId}_other
                      // If it's a checkbox, key is ${questionId}_${optionId}_other
                      if (question.questionType ==
                          Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX) {
                        final key = '${questionId}_${option.id}_other';
                        _answers[key] = answer.otherText;
                      } else {
                        final key = '${questionId}_other';
                        _answers[key] = answer.otherText;
                      }
                    }
                  }
                }
              }
            }

            debugPrint(
              'Loaded offline submission with ${answersList.length} answers',
            );
            if (mounted) {
              setState(() {
                _isSubmitting = false;
              });
            }
            return;
          }
        }
      }

      // Server submission: try to fetch from server, fall back to local draft
      Fragment$SubmissionFields? existingSubmission;
      try {
        existingSubmission = await SubmissionService.instance.getSubmissionById(
          widget.responseId!,
        );
      } catch (serverError) {
        debugPrint(
          'Survey: Server fetch failed for ${widget.responseId}: $serverError',
        );
      }

      // If server fetch failed (e.g. offline), try loading from local draft
      // that was linked to this server ID during sync
      if (existingSubmission == null) {
        debugPrint(
          'Survey: Attempting local draft fallback for server ID: ${widget.responseId}',
        );
        final localDraft =
            await OfflineStorageService.instance.getOfflineSubmissionByServerId(
              widget.responseId!,
            ) ??
            await OfflineStorageService.instance.getOfflineSubmission(
              widget.responseId!,
            );

        if (localDraft != null && localDraft.isDraft) {
          _isServerDraft = true;
          debugPrint(
            'Survey: Found local draft linked to server ID ${widget.responseId}',
          );
          // Load answers from local draft (same as the local draft path above)
          final answersMap = localDraft.answers;
          for (final entry in answersMap.entries) {
            final key = entry.key;
            final value = entry.value;
            if (value != null) {
              if (value is List) {
                _answers[key] = value.map((e) => e.toString()).toList();
              } else {
                _answers[key] = value;
              }
            }
          }
          debugPrint(
            'Loaded ${answersMap.length} answers from local draft fallback',
          );

          // Restore group index
          final lastGroupIndex = localDraft.lastGroupIndex;
          if (lastGroupIndex != null && lastGroupIndex >= 0) {
            final questionGroups = _getQuestionGroups();
            if (lastGroupIndex < questionGroups.length) {
              _currentGroupIndex = lastGroupIndex;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted && _pageController.hasClients) {
                  _pageController.jumpToPage(lastGroupIndex);
                  setState(() {
                    _showPageList = false;
                  });
                }
              });
            }
          }

          // Invalidate caches and reset loading state
          _invalidateDependentCaches();
          if (mounted) {
            setState(() {
              _isSubmitting = false;
              _showPageList = true;
            });
          }
          return;
        }

        // No local fallback found either
        throw Exception(
          'Submission not found on server and no local draft available',
        );
      }

      // Load answers from server submission into the state
      _isServerDraft =
          existingSubmission.status == Enum$SurveySubmissionStatusChoices.DRAFT;
      debugPrint(
        'Survey: Server submission has ${existingSubmission.answers.edges.length} answer edges (isDraft: $_isServerDraft)',
      );
      for (final answerEdge in existingSubmission.answers.edges) {
        final answer = answerEdge?.node;
        if (answer == null) {
          debugPrint('Survey: Skipping null answer edge');
          continue;
        }

        final questionId = answer.question.id;
        debugPrint(
          'Survey: Processing answer for question $questionId - '
          'textAnswer: "${answer.textAnswer}", '
          'otherText: "${answer.otherText}", '
          'selectedOptions: ${answer.selectedOptions.edges.length}',
        );

        // Handle text answers and other text
        if (answer.textAnswer != null && answer.textAnswer!.isNotEmpty) {
          var textValue = answer.textAnswer!;

          // Handle backward compatibility: strip loc_ prefixes if they exist
          if (textValue.startsWith('loc_state_')) {
            textValue = textValue.substring('loc_state_'.length);
          } else if (textValue.startsWith('loc_district_')) {
            textValue = textValue.substring('loc_district_'.length);
          } else if (textValue.startsWith('loc_block_')) {
            textValue = textValue.substring('loc_block_'.length);
          }

          _answers[questionId] = textValue;
        }

        // Handle other text specifically
        if (answer.otherText != null && answer.otherText!.isNotEmpty) {
          // Check if this question has options to determine if it's a radio/checkbox question
          final matchingQuestions = _getSortedQuestions().where(
            (q) => q.id == questionId,
          );
          final question = matchingQuestions.isNotEmpty
              ? matchingQuestions.first
              : null;

          if (question != null &&
              (question.questionType ==
                      Enum$SurveyQuestionQuestionTypeChoices.RADIO ||
                  question.questionType ==
                      Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX ||
                  question.questionType ==
                      Enum$SurveyQuestionQuestionTypeChoices.DROPDOWN)) {
            // Look for "other" options in this question
            final options = question.options.edges
                .where((edge) => edge?.node != null)
                .map((edge) => edge!.node!)
                .toList();

            for (final option in options) {
              if (_isOtherOption(option)) {
                // Store the other text in the appropriate key
                if (question.questionType ==
                    Enum$SurveyQuestionQuestionTypeChoices.RADIO) {
                  final radioKey = '${questionId}_other';
                  _answers[radioKey] = answer.otherText;
                  // Ensure the radio option is selected
                  _answers[questionId] = option.id;
                  debugPrint('Selected radio option: ${option.id}');
                } else if (question.questionType ==
                    Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX) {
                  final checkboxKey = '${questionId}_${option.id}_other';
                  _answers[checkboxKey] = answer.otherText;
                  debugPrint(
                    'Stored checkbox other text with key: $checkboxKey = ${answer.otherText}',
                  );
                  // Ensure the checkbox option is selected
                  final currentSelected =
                      _answers[questionId] as List<String>? ?? [];
                  if (!currentSelected.contains(option.id)) {
                    _answers[questionId] = [...currentSelected, option.id];
                    debugPrint(
                      'Added checkbox option to selection: ${option.id}',
                    );
                  } else {
                    debugPrint(
                      'Checkbox option already selected: ${option.id}',
                    );
                  }
                }
              }
            }
          }
        }

        if (answer.selectedOptions.edges.isNotEmpty) {
          final selectedOptionIds = answer.selectedOptions.edges
              .where((edge) => edge?.node != null)
              .map((edge) {
                var optionId = edge!.node!.id;

                // Handle backward compatibility: strip loc_ prefixes if they exist
                if (optionId.startsWith('loc_state_')) {
                  optionId = optionId.substring('loc_state_'.length);
                } else if (optionId.startsWith('loc_district_')) {
                  optionId = optionId.substring('loc_district_'.length);
                } else if (optionId.startsWith('loc_block_')) {
                  optionId = optionId.substring('loc_block_'.length);
                }

                return optionId;
              })
              .toList();

          if (selectedOptionIds.isNotEmpty) {
            final matchingQuestions = _getSortedQuestions().where(
              (q) => q.id == questionId,
            );
            final question = matchingQuestions.isNotEmpty
                ? matchingQuestions.first
                : null;

            if (question != null) {
              if (question.questionType ==
                  Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX) {
                final currentSelected =
                    _answers[questionId] as List<String>? ?? [];
                _answers[questionId] = [
                  ...currentSelected,
                  ...selectedOptionIds.where(
                    (id) => !currentSelected.contains(id),
                  ),
                ];
              } else {
                _answers[questionId] = selectedOptionIds.first;
              }
            }
          }
        }

        // Update text controllers if they exist
        if (_textControllers.containsKey(questionId)) {
          _textControllers[questionId]!.text = answer.textAnswer ?? '';
        }

        // Update other option controllers if they exist
        final matchingQuestions = _getSortedQuestions().where(
          (q) => q.id == questionId,
        );
        final question = matchingQuestions.isNotEmpty
            ? matchingQuestions.first
            : null;

        if (question != null &&
            (question.questionType ==
                    Enum$SurveyQuestionQuestionTypeChoices.RADIO ||
                question.questionType ==
                    Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX ||
                question.questionType ==
                    Enum$SurveyQuestionQuestionTypeChoices.DROPDOWN) &&
            answer.otherText != null &&
            answer.otherText!.isNotEmpty) {
          debugPrint(
            'Found otherText for question $questionId: ${answer.otherText}',
          );

          // Look for "other" options in this question
          final options = question.options.edges
              .where((edge) => edge?.node != null)
              .map((edge) => edge!.node!)
              .toList();

          for (final option in options) {
            if (_isOtherOption(option)) {
              final controllerKey = '${questionId}_${option.id}';
              if (_otherOptionControllers.containsKey(controllerKey)) {
                _otherOptionControllers[controllerKey]!.text =
                    answer.otherText!;
              }
              final perOptionKey = '${questionId}_${option.id}_other';
              _answers[perOptionKey] = answer.otherText!;
              _answers['${questionId}_other'] = answer.otherText!;
            }
          }
        }
      }

      debugPrint(
        'Survey: Successfully loaded ${_answers.length} existing answers',
      );

      // If server returned the submission but we parsed 0 answers,
      // fall back to local draft as the server data may be incomplete
      // or affected by GraphQL cache normalization issues.
      if (_answers.isEmpty && widget.responseId != null) {
        debugPrint(
          'Survey: Server returned 0 answers, trying local draft fallback',
        );
        final localDraft =
            await OfflineStorageService.instance.getOfflineSubmissionByServerId(
              widget.responseId!,
            ) ??
            await OfflineStorageService.instance.getOfflineSubmission(
              widget.responseId!,
            );
        if (localDraft != null && localDraft.isDraft) {
          _isServerDraft = true;
          final answersMap = localDraft.answers;
          for (final entry in answersMap.entries) {
            final key = entry.key;
            final value = entry.value;
            if (value != null) {
              if (value is List) {
                _answers[key] = value.map((e) => e.toString()).toList();
              } else {
                _answers[key] = value;
              }
            }
          }
          debugPrint(
            'Survey: Recovered ${answersMap.length} answers from local draft fallback',
          );
        }
      }

      // Invalidate caches after loading answers since conditions may have changed
      _invalidateDependentCaches();

      // For existing submissions, show page list and use SharedPreferences to resume per page
      if (mounted) {
        setState(() {
          _isSubmitting = false;
          if (widget.responseId != null) {
            // For existing submissions, show page list so user can choose which page to resume
            // The actual resume position will be determined when user clicks on a page
            _showPageList = true;
          }
        });
      }
    } catch (e) {
      debugPrint('Error loading existing answers: $e');
      // Ensure _isSubmitting is reset so the UI is not permanently blocked
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  /// Save all current answers to local SQLite database as a draft
  /// This allows the user to resume the survey later even if the app closes
  Future<void> _saveDraftToLocalStorage() async {
    if (_submissionId == null || _survey == null) return;
    if (widget.responseId != null &&
        !widget.responseId!.startsWith('local_') &&
        !_isServerDraft &&
        ConnectivityService.instance.isOnline) {
      debugPrint(
        'Survey: Skipping local draft save for online edit submission ${widget.responseId}',
      );
      return;
    }
    if (_answers.isEmpty) {
      debugPrint('Survey: No answers to save as draft');
      return;
    }

    try {
      // Build a map of questionId → questionType so the sync manager can
      // deterministically classify answers as text vs option IDs without heuristics.
      final Map<String, String> questionTypes = {};
      for (final question in _getSortedQuestions()) {
        questionTypes[question.id] = question.questionType.name;
      }

      await OfflineSurveyService.instance.saveDraftAnswers(
        submissionId: _submissionId!,
        surveyId: widget.surveyId,
        answers: Map<String, dynamic>.from(_answers),
        language: widget.language,
        lastGroupIndex: _currentGroupIndex,
        questionTypes: questionTypes,
        serverSubmissionId:
            _submissionId != null && !_submissionId!.startsWith('local_')
                ? _submissionId
                : null,
      );
      debugPrint(
        'Survey: Saved draft with ${_answers.length} answers to local storage (group: $_currentGroupIndex)',
      );
    } catch (e) {
      debugPrint('Survey: Error saving draft to local storage: $e');
    }
  }

  /// Save all answers to the backend when user exits the survey
  /// This ensures all filled answers are persisted on the server as a draft
  Future<void> _saveAllAnswersToBackend() async {
    if (_submissionId == null || _survey == null) return;
    if (_answers.isEmpty) {
      debugPrint('Survey: No answers to save to backend');
      return;
    }

    // Skip if it's a local submission (not yet created on backend)
    if (_submissionId!.startsWith('local_')) {
      debugPrint(
        'Survey: Local submission - answers will be sent on final submit',
      );
      return;
    }

    final isOnline = ConnectivityService.instance.isOnline;
    if (!isOnline) {
      debugPrint('Survey: Offline - answers queued for later sync');
      return;
    }

    debugPrint(
      'Survey: Saving ${_answers.length} answers to backend for submission $_submissionId',
    );

    setState(() {
      _isSaving = true;
      _isSubmitting = true;
    });

    try {
      // Get all questions to determine their types
      final questions = _getFilteredQuestions();
      final questionMap = {for (var q in questions) q.id: q};

      for (final entry in _answers.entries) {
        final questionId = entry.key;
        final answer = entry.value;

        // Skip internal keys (like _other keys)
        if (questionId.contains('_other') || questionId.contains('_')) {
          continue;
        }

        final question = questionMap[questionId];
        if (question == null || answer == null) continue;

        String? textAnswer;
        String? otherText;
        List<String>? selectedOptionIds;

        final isOptionBasedQuestion =
            question.questionType ==
                Enum$SurveyQuestionQuestionTypeChoices.RADIO ||
            question.questionType ==
                Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX ||
            question.questionType ==
                Enum$SurveyQuestionQuestionTypeChoices.DROPDOWN;

        if (isOptionBasedQuestion) {
          if (answer is String) {
            selectedOptionIds = [answer];

            // Check for other text
            final options = question.options.edges
                .where((edge) => edge?.node != null)
                .map((edge) => edge!.node!)
                .toList();
            for (final option in options) {
              if (_isOtherOption(option) && option.id == answer) {
                final radioKey = '${questionId}_other';
                final perOptionKey = '${questionId}_${option.id}_other';
                otherText =
                    (_answers[perOptionKey] as String? ??
                            _answers[radioKey] as String?)
                        ?.trim();
                break;
              }
            }
          } else if (answer is List<String>) {
            selectedOptionIds = List<String>.from(answer);

            // Check for other text in checkbox
            final options = question.options.edges
                .where((edge) => edge?.node != null)
                .map((edge) => edge!.node!)
                .toList();
            for (final option in options) {
              if (_isOtherOption(option) &&
                  selectedOptionIds.contains(option.id)) {
                final otherTextKey = '${questionId}_${option.id}_other';
                if (_answers.containsKey(otherTextKey)) {
                  otherText ??= (_answers[otherTextKey] as String?)?.trim();
                  if (otherText != null && otherText.isNotEmpty) {
                    break;
                  }
                }
              }
            }
          }
        } else {
          if (answer is String) {
            textAnswer = answer;
          }
        }

        try {
          await OfflineSurveyService.instance.saveAnswerWithOfflineSupport(
            submissionId: _submissionId!,
            questionId: questionId,
            textAnswer: textAnswer,
            selectedOptionIds: selectedOptionIds,
            otherText: otherText,
          );
        } catch (e) {
          debugPrint('Survey: Error saving answer for $questionId: $e');
        }
      }

      debugPrint('Survey: Successfully saved all answers to backend');
    } catch (e) {
      debugPrint('Survey: Error saving answers to backend: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
          _isSubmitting = false;
        });
      }
    }
  }

  Future<void> _saveCurrentGroupAnswers(QuestionGroup group) async {
    if (_submissionId == null) return;

    if (group.questions.isEmpty) return;

    setState(() {
      _isSaving = true;
      _isSubmitting = true;
    });

    try {
      for (final currentQuestion in group.questions) {
        final answer = _answers[currentQuestion.id];
        if (answer == null) continue; // Skip unanswered items

        String? textAnswer;
        String? otherText;
        List<String>? selectedOptionIds;

        final isOptionBasedQuestion =
            currentQuestion.questionType ==
                Enum$SurveyQuestionQuestionTypeChoices.RADIO ||
            currentQuestion.questionType ==
                Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX ||
            currentQuestion.questionType ==
                Enum$SurveyQuestionQuestionTypeChoices.DROPDOWN;

        if (isOptionBasedQuestion) {
          if (answer is String) {
            selectedOptionIds = [answer];

            final options = currentQuestion.options.edges
                .where((edge) => edge?.node != null)
                .map((edge) => edge!.node!)
                .toList();
            for (final option in options) {
              if (_isOtherOption(option) && option.id == answer) {
                final radioKey = '${currentQuestion.id}_other';
                final perOptionKey = '${currentQuestion.id}_${option.id}_other';
                otherText =
                    (_answers[perOptionKey] as String? ??
                            _answers[radioKey] as String?)
                        ?.trim();
                break;
              }
            }
          } else if (answer is List<String>) {
            selectedOptionIds = List<String>.from(answer);

            final options = currentQuestion.options.edges
                .where((edge) => edge?.node != null)
                .map((edge) => edge!.node!)
                .toList();

            for (final option in options) {
              if (_isOtherOption(option) &&
                  selectedOptionIds.contains(option.id)) {
                final otherTextKey = '${currentQuestion.id}_${option.id}_other';
                if (_answers.containsKey(otherTextKey)) {
                  otherText ??= (_answers[otherTextKey] as String?)?.trim();
                  if (otherText != null && otherText.isNotEmpty) {
                    break;
                  }
                }
              }
            }
          }
        } else {
          if (answer is String) {
            textAnswer = answer;
          }
        }

        await OfflineSurveyService.instance.saveAnswerWithOfflineSupport(
          submissionId: _submissionId!,
          questionId: currentQuestion.id,
          textAnswer: textAnswer,
          selectedOptionIds: selectedOptionIds,
          otherText: otherText,
        );

        await _saveSubQuestionAnswers(currentQuestion.id);
      }
    } catch (e) {
      debugPrint(
        'Error saving answers for group ${group.groupKey ?? group.firstQuestion?.id}: $e',
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
          _isSubmitting = false;
        });
      }
    }
  }

  Future<void> _saveSubQuestionAnswers(String parentQuestionId) async {
    if (_submissionId == null) return;

    // Save answers for all sub-questions
    for (final entry in _subQuestionAnswers.entries) {
      final optionId = entry.key;
      final subAnswers = entry.value as Map<String, dynamic>?;

      if (subAnswers == null) continue;

      await _saveSubQuestionAnswersForOption(optionId, subAnswers);
    }
  }

  Future<void> _saveSubQuestionAnswersForOption(
    String optionId,
    Map<String, dynamic> subAnswers,
  ) async {
    if (_submissionId == null || _survey == null) return;

    // Build a map of sub-question ID to sub-question object for type checking
    final Map<String, Fragment$QuestionFetch$options$edges$node$subQuestions>
    subQuestionMap = {};
    final questions = _getFilteredQuestions();
    for (final question in questions) {
      for (final optionEdge in question.options.edges) {
        final option = optionEdge?.node;
        if (option?.id == optionId) {
          final subQuestions = option?.subQuestions;
          if (subQuestions != null) {
            for (final subQuestion in subQuestions) {
              if (subQuestion != null) {
                subQuestionMap[subQuestion.id] = subQuestion;
              }
            }
          }
          break;
        }
      }
    }

    for (final subEntry in subAnswers.entries) {
      final subQuestionId = subEntry.key;
      final subAnswer = subEntry.value;
      final subQuestion = subQuestionMap[subQuestionId];

      if (subAnswer == null || subQuestion == null) continue;

      try {
        String? textAnswer;
        List<String>? selectedOptionIds;
        String? otherText;

        // Determine which field to use based on sub-question type
        final isOptionBasedQuestion =
            subQuestion.questionType ==
                Enum$SurveyQuestionQuestionTypeChoices.RADIO ||
            subQuestion.questionType ==
                Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX ||
            subQuestion.questionType ==
                Enum$SurveyQuestionQuestionTypeChoices.DROPDOWN;

        if (isOptionBasedQuestion) {
          // Radio, Checkbox, Dropdown should use selectedOptionIds
          if (subAnswer is String && subAnswer.isNotEmpty) {
            selectedOptionIds = [
              subAnswer,
            ]; // Single selection (radio/dropdown)
          } else if (subAnswer is List<String> && subAnswer.isNotEmpty) {
            selectedOptionIds = subAnswer; // Multiple selection (checkbox)
          }
        } else {
          // Text-based questions use textAnswer
          if (subAnswer is String && subAnswer.isNotEmpty) {
            textAnswer = subAnswer;
          }
        }

        if (textAnswer != null || selectedOptionIds != null) {
          await OfflineSurveyService.instance.saveAnswerWithOfflineSupport(
            submissionId: _submissionId!,
            questionId: subQuestionId,
            textAnswer: textAnswer,
            selectedOptionIds: selectedOptionIds,
          );
        }
      } catch (e) {
        debugPrint(
          'Survey: Error saving sub-question answer for question $subQuestionId: $e',
        );
      }
    }
  }

  Future<void> _saveSubQuestionAnswersForAllOptions() async {
    if (_submissionId == null || _survey == null) return;

    // Save answers for all sub-questions across all options
    for (final entry in _subQuestionAnswers.entries) {
      final optionId = entry.key;
      final subAnswers = entry.value as Map<String, dynamic>?;

      if (subAnswers == null) continue;

      await _saveSubQuestionAnswersForOption(optionId, subAnswers);
    }
  }

  Future<void> _showSubQuestionsBottomSheet(
    Fragment$QuestionFetch$options$edges$node option,
  ) async {
    final subQuestions =
        (option.subQuestions
                  ?.where((q) => q != null)
                  .cast<
                    Fragment$QuestionFetch$options$edges$node$subQuestions
                  >()
                  .toList() ??
              [])
          ..sort((a, b) => a.order.compareTo(b.order));

    if (subQuestions.isEmpty) return;

    // Get existing sub-question answers for this option
    final existingAnswers =
        _subQuestionAnswers[option.id] as Map<String, dynamic>? ?? {};

    // Get localized text for the selected option
    final isHindi = widget.language.toLowerCase().contains('hi');
    final selectedOptionText =
        (isHindi &&
            option.localizedText != null &&
            option.localizedText!.trim().isNotEmpty)
        ? option.localizedText!
        : option.text;

    setState(() {
      _isInModalContext = true;
    });

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SubQuestionsBottomSheet(
        subQuestions: subQuestions,
        language: widget.language,
        mode: widget.mode,
        initialAnswers: existingAnswers,
        selectedOptionText: selectedOptionText,
        onSubmit: (subAnswers) async {
          setState(() {
            _subQuestionAnswers[option.id] = subAnswers;
          });

          // Immediately save sub-question answers to backend
          await _saveSubQuestionAnswersForOption(option.id, subAnswers);
        },
      ),
    );

    // Reset modal context after sub-questions dialog
    setState(() {
      _isInModalContext = false;
    });
  }

  Future<void> _submitSurvey() async {
    if (!_formKey.currentState!.validate()) {
      // Show snackbar for validation errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isHindi
                ? 'कृपया सभी आवश्यक फ़ील्ड भरें'
                : widget.language.toLowerCase() == 'te'
                    ? 'దయచేసి అన్ని అవసరమైన ఫీల్డ్‌లను నింపండి'
                    : 'Please fill all required fields',
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LanguageUtils.getSubmitSurveyText(widget.language)),
        content: Text(
          isHindi
              ? 'क्या आप वाकई इस सर्वेक्षण को जमा करना चाहते हैं?'
              : widget.language.toLowerCase() == 'te'
                  ? 'మీరు ఈ సర్వేను సమర్పించాలనుకుంటున్నారా?'
                  : 'Are you sure you want to submit this survey?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(LanguageUtils.getCancelText(widget.language)),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(LanguageUtils.getSubmitText(widget.language)),
          ),
        ],
      ),
    );

    if (confirmed != true) {
      return; // User cancelled the submission
    }

    setState(() {
      _isSaving = true;
      _isSubmitting = true;
    });

    // Ensure a visible loading indicator while submitting (incl. location fetch)
    _showSubmittingDialog();

    try {
      // Clear saved positions when survey is submitted
      await _clearSavedPositions();
      // For existing backend responses that are already COMPLETED,
      // save all answers individually since they may have been modified.
      // But for server DRAFTS being submitted for the first time,
      // use the full submitSurvey flow to create a completed submission.
      // Local draft IDs (local_*) should go through final submit flow below.
      if (widget.responseId != null &&
          !widget.responseId!.startsWith('local_') &&
          !_isServerDraft &&
          ConnectivityService.instance.isOnline) {
        final questionGroups = _getQuestionGroups();
        if (_currentGroupIndex < questionGroups.length) {
          await _saveCurrentGroupAnswers(questionGroups[_currentGroupIndex]);
        }

        // Then save all other answers
        final allQuestions = _getFilteredQuestions();
        for (final question in allQuestions) {
          final answer = _answers[question.id];
          if (answer == null) continue;

          // Debug logging for location questions (existing submission)
          final questionKey = question.key?.trim().toLowerCase();
          if (questionKey == 'state' ||
              questionKey == 'district' ||
              questionKey == 'block') {
            debugPrint(
              '🔍 SAVING EXISTING LOCATION QUESTION: key=$questionKey, questionId=${question.id}, answer=$answer, answerType=${answer.runtimeType}',
            );
          }

          String? textAnswer;
          String? otherText;
          List<String>? selectedOptionIds;

          final isOptionBasedQuestion =
              question.questionType ==
                  Enum$SurveyQuestionQuestionTypeChoices.RADIO ||
              question.questionType ==
                  Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX ||
              question.questionType ==
                  Enum$SurveyQuestionQuestionTypeChoices.DROPDOWN;

          if (isOptionBasedQuestion) {
            if (answer is String) {
              selectedOptionIds = [answer];

              // If selected option is an "other" option, include its text
              final options = question.options.edges
                  .where((edge) => edge?.node != null)
                  .map((edge) => edge!.node!)
                  .toList();
              for (final option in options) {
                if (_isOtherOption(option) && option.id == answer) {
                  // Radio uses key `${question.id}_other`, dropdown/checkbox can use `${question.id}_${option.id}_other`
                  final radioKey = '${question.id}_other';
                  final perOptionKey = '${question.id}_${option.id}_other';
                  otherText =
                      (_answers[perOptionKey] as String? ??
                              _answers[radioKey] as String?)
                          ?.trim();
                  break;
                }
              }
            } else if (answer is List<String>) {
              selectedOptionIds = answer;

              // For checkbox with an "other" option, include the first matching other text
              final options = question.options.edges
                  .where((edge) => edge?.node != null)
                  .map((edge) => edge!.node!)
                  .toList();
              for (final option in options) {
                if (_isOtherOption(option) &&
                    selectedOptionIds.contains(option.id)) {
                  final otherTextKey = '${question.id}_${option.id}_other';
                  otherText = (_answers[otherTextKey] as String?)?.trim();
                  if (otherText != null && otherText!.isNotEmpty) break;
                }
              }
            }
          } else {
            if (answer is String) {
              textAnswer = answer;
            }
          }

          // Debug logging for final processed values (existing submission)
          if (questionKey == 'state' ||
              questionKey == 'district' ||
              questionKey == 'block') {
            debugPrint(
              '🔍 PROCESSED EXISTING VALUES: key=$questionKey, textAnswer=$textAnswer, selectedOptionIds=$selectedOptionIds, questionType=${question.questionType}',
            );
          }

          await OfflineSurveyService.instance.saveAnswerWithOfflineSupport(
            submissionId: widget.responseId!,
            questionId: question.id,
            textAnswer: textAnswer,
            selectedOptionIds: selectedOptionIds,
            otherText: otherText,
          );

          // Debug log for successful save
          if (questionKey == 'state' ||
              questionKey == 'district' ||
              questionKey == 'block') {
            debugPrint(
              '✅ SAVED EXISTING ANSWER: key=$questionKey, textAnswer=$textAnswer, selectedOptionIds=$selectedOptionIds',
            );
          }
        }

        // Save sub-question answers
        await _saveSubQuestionAnswersForAllOptions();

        debugPrint('Survey: Successfully updated existing submission');

        if (mounted) {
          if (_isLoadingDialogVisible) {
            Navigator.of(context, rootNavigator: true).pop();
            _isLoadingDialogVisible = false;
          }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Survey updated successfully!')),
          );
          context.pop();
        }
      } else {
        // Save current answer before final submission for new responses
        final questionGroups = _getQuestionGroups();
        if (_currentGroupIndex < questionGroups.length) {
          await _saveCurrentGroupAnswers(questionGroups[_currentGroupIndex]);
        }

        final answers = <Input$AnswerInput>[];

        // Add main question answers with proper otherText handling
        final allQuestions = _getFilteredQuestions();
        for (final question in allQuestions) {
          final answer = _answers[question.id];
          if (answer == null) continue;

          // Debug logging for location questions
          final questionKey = question.key?.trim().toLowerCase();
          if (questionKey == 'state' ||
              questionKey == 'district' ||
              questionKey == 'block') {
            debugPrint(
              '🔍 SAVING LOCATION QUESTION: key=$questionKey, questionId=${question.id}, answer=$answer, answerType=${answer.runtimeType}',
            );
          }

          String? textAnswer;
          String? otherText;
          List<String>? selectedOptionIds;

          final isOptionBasedQuestion =
              question.questionType ==
                  Enum$SurveyQuestionQuestionTypeChoices.RADIO ||
              question.questionType ==
                  Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX ||
              question.questionType ==
                  Enum$SurveyQuestionQuestionTypeChoices.DROPDOWN;

          if (isOptionBasedQuestion) {
            if (answer is String && answer.isNotEmpty) {
              selectedOptionIds = [answer];

              // Include other text if selected option is an other option
              final options = question.options.edges
                  .where((edge) => edge?.node != null)
                  .map((edge) => edge!.node!)
                  .toList();
              for (final option in options) {
                if (_isOtherOption(option) && option.id == answer) {
                  final radioKey = '${question.id}_other';
                  final perOptionKey = '${question.id}_${option.id}_other';
                  otherText =
                      (_answers[perOptionKey] as String? ??
                              _answers[radioKey] as String?)
                          ?.trim();
                  break;
                }
              }
            } else if (answer is List<String> && answer.isNotEmpty) {
              selectedOptionIds = answer;
              final options = question.options.edges
                  .where((edge) => edge?.node != null)
                  .map((edge) => edge!.node!)
                  .toList();
              for (final option in options) {
                if (_isOtherOption(option) &&
                    selectedOptionIds.contains(option.id)) {
                  final otherTextKey = '${question.id}_${option.id}_other';
                  otherText = (_answers[otherTextKey] as String?)?.trim();
                  if (otherText != null && otherText!.isNotEmpty) break;
                }
              }
            }
          } else {
            if (answer is String && answer.isNotEmpty) {
              textAnswer = answer;
            }
          }

          // Debug logging for final processed values
          if (questionKey == 'state' ||
              questionKey == 'district' ||
              questionKey == 'block') {
            debugPrint(
              '🔍 PROCESSED VALUES: key=$questionKey, textAnswer=$textAnswer, selectedOptionIds=$selectedOptionIds, questionType=${question.questionType}',
            );
          }

          if ((textAnswer != null && textAnswer!.isNotEmpty) ||
              (selectedOptionIds != null && selectedOptionIds!.isNotEmpty)) {
            final answerInput = Input$AnswerInput(
              questionId: question.id,
              textAnswer: textAnswer,
              selectedOptionIds: selectedOptionIds,
              otherText: otherText,
            );

            // Debug log for answer being added
            if (questionKey == 'state' ||
                questionKey == 'district' ||
                questionKey == 'block') {
              debugPrint(
                '✅ ADDING ANSWER: key=$questionKey, answerInput=${answerInput.toJson()}',
              );
            }

            answers.add(answerInput);
          } else {
            // Debug log for skipped answers
            if (questionKey == 'state' ||
                questionKey == 'district' ||
                questionKey == 'block') {
              debugPrint(
                '❌ SKIPPING ANSWER: key=$questionKey, textAnswer=$textAnswer, selectedOptionIds=$selectedOptionIds',
              );
            }
          }
        }

        // Add sub-question answers
        _subQuestionAnswers.forEach((optionId, subAnswers) {
          if (subAnswers is Map<String, dynamic>) {
            subAnswers.forEach((questionId, answer) {
              if (answer is String && answer.isNotEmpty) {
                answers.add(
                  Input$AnswerInput(questionId: questionId, textAnswer: answer),
                );
              } else if (answer is List<String> && answer.isNotEmpty) {
                answers.add(
                  Input$AnswerInput(
                    questionId: questionId,
                    selectedOptionIds: answer,
                  ),
                );
              }
            });
          }
        });

        // Try to capture current location to attach with submission
        final position = await LocationService.instance.getCurrentPosition();
        final existingServerSubmissionId =
            (_isServerDraft && widget.responseId != null)
                ? widget.responseId
                : (_submissionId != null && !_submissionId!.startsWith('local_'))
                    ? _submissionId
                    : null;

        // Use OfflineSurveyService for submission
        final result = await OfflineSurveyService.instance
            .submitSurveyWithOfflineSupport(
              surveyId: widget.surveyId,
              answers: answers,
              language: widget.language,
              latitude: position?.latitude,
              longitude: position?.longitude,
              localSubmissionId: _submissionId,
              submissionId: existingServerSubmissionId,
            );

        // If this was a server draft and it was submitted online, clean up the
        // linked local draft. When offline, the pending sync row must remain.
        if (_isServerDraft && widget.responseId != null && !result.isOffline) {
          try {
            // Try cleaning up by server_submission_id first
            final localDraft = await OfflineStorageService.instance
                .getOfflineSubmissionByServerId(widget.responseId!);
            if (localDraft != null) {
              await OfflineStorageService.instance.deleteOfflineSubmission(
                localDraft.localId,
              );
              debugPrint(
                'Survey: Deleted local draft ${localDraft.localId} after completing server draft ${widget.responseId}',
              );
            }
            // Also try deleting by localId directly, because saveDraft()
            // stores server draft IDs as localId (not server_submission_id)
            await OfflineStorageService.instance.deleteOfflineSubmission(
              widget.responseId!,
            );
            debugPrint(
              'Survey: Deleted draft entry with localId=${widget.responseId}',
            );
          } catch (e) {
            debugPrint('Survey: Error cleaning up local draft: $e');
          }
        }

        if (mounted) {
          // Close loading dialog before navigating away
          if (_isLoadingDialogVisible) {
            Navigator.of(context, rootNavigator: true).pop();
            _isLoadingDialogVisible = false;
          }
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(result.message)));
          context.pop();
        }
      }
    } catch (e) {
      if (mounted) {
        // Close loader to surface the error message clearly
        if (_isLoadingDialogVisible) {
          Navigator.of(context, rootNavigator: true).pop();
          _isLoadingDialogVisible = false;
        }
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to submit survey: $e')));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
          _isSubmitting = false;
        });
        // Safety: ensure loading dialog is closed in all cases
        if (_isLoadingDialogVisible) {
          Navigator.of(context, rootNavigator: true).pop();
          _isLoadingDialogVisible = false;
        }
      }
    }
  }

  Widget _buildQuestionWidget(Fragment$QuestionFetch question) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Special case: location questions (state, district, block, clf) always render as dropdown
    final questionKey = question.key?.trim().toLowerCase();
    debugPrint(
      '🏗️ BUILDING QUESTION: key=$questionKey (raw="${question.key}"), questionId=${question.id}, questionType=${question.questionType}',
    );

    if (questionKey == 'state' ||
        questionKey == 'district' ||
        questionKey == 'block' ||
        questionKey == 'clf') {
      debugPrint(
        '✅ OVERRIDE: Using dropdown for location question: key=$questionKey',
      );
      return _buildDropdownQuestion(question, theme, colorScheme);
    }

    switch (question.questionType) {
      case Enum$SurveyQuestionQuestionTypeChoices.TEXT:
        debugPrint(
          '📝 BUILDING TEXT QUESTION: key=$questionKey, questionId=${question.id} - This should NOT happen for location questions!',
        );
        return _buildTextQuestion(question, theme, colorScheme);
      case Enum$SurveyQuestionQuestionTypeChoices.TEXTAREA:
        return _buildTextAreaQuestion(question, theme, colorScheme);
      case Enum$SurveyQuestionQuestionTypeChoices.EMAIL:
        return _buildEmailQuestion(question, theme, colorScheme);
      case Enum$SurveyQuestionQuestionTypeChoices.NUMBER:
        return _buildNumberQuestion(question, theme, colorScheme);
      case Enum$SurveyQuestionQuestionTypeChoices.DATE:
        return _buildDateQuestion(question, theme, colorScheme);
      case Enum$SurveyQuestionQuestionTypeChoices.DATETIME:
        return _buildDateTimeQuestion(question, theme, colorScheme);
      case Enum$SurveyQuestionQuestionTypeChoices.TIME:
        return _buildTimeQuestion(question, theme, colorScheme);
      case Enum$SurveyQuestionQuestionTypeChoices.RADIO:
        return _buildRadioQuestion(question, theme, colorScheme);
      case Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX:
        return _buildCheckboxQuestion(question, theme, colorScheme);
      case Enum$SurveyQuestionQuestionTypeChoices.DROPDOWN:
        return _buildDropdownQuestion(question, theme, colorScheme);
      case Enum$SurveyQuestionQuestionTypeChoices.NOTE:
        return _buildNoteQuestion(question, theme, colorScheme);
      case Enum$SurveyQuestionQuestionTypeChoices.CONSENT:
        return _buildConsentQuestion(question, theme, colorScheme);
      default:
        return _buildTextQuestion(question, theme, colorScheme);
    }
  }

  Widget _buildTextQuestion(
    Fragment$QuestionFetch question,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    // Get or create text controller for this question
    if (!_textControllers.containsKey(question.id)) {
      _textControllers[question.id] = TextEditingController(
        text: _answers[question.id] as String? ?? '',
      );
    }
    final controller = _textControllers[question.id]!;

    // Get or create focus node for this question
    if (!_focusNodes.containsKey(question.id)) {
      _focusNodes[question.id] = FocusNode();
    }
    final focusNode = _focusNodes[question.id]!;

    final showVoiceInput =
        widget.mode.speaksAnswers;
    final hintText = _effectiveQuestionHint(question);

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _evaluateTemplate(
                        question.localizedText ?? question.text,
                        question,
                      ),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (hintText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          '($hintText)',
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (question.isRequired)
                Text(
                  '*',
                  style: TextStyle(
                    color: colorScheme.error,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              _buildQuestionTTSButton(question, colorScheme),
            ],
          ),
          const SizedBox(height: 16),

          // Voice Recording Option

          // Text Input Field
          TextFormField(
            controller: controller,
            focusNode: focusNode,
            inputFormatters: _inputFormattersForQuestion(question),
            decoration: InputDecoration(
              hintText: showVoiceInput
                  ? (LanguageUtils.getTypeHere(widget.language))
                  : (isHindi
                        ? 'अपना उत्तर दर्ज करें...'
                        : 'Enter your answer...'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: colorScheme.surface,
            ),
            maxLines: 1,
            validator: question.isRequired
                ? (value) {
                    if (value == null || value.trim().isEmpty) {
                      return isHindi
                          ? 'यह फ़ील्ड आवश्यक है'
                          : 'This field is required';
                    }
                    // Apply API-provided or preset regex validation if present
                    final raw = question.validationPattern?.trim();
                    String? effectivePattern = raw;
                    String? effectiveMessage = question.validationMessage;
                    if (raw != null) {
                      final preset = presetPatternForLabel(raw);
                      if (preset != null) effectivePattern = preset;
                      final msg = presetMessageForLabel(raw);
                      if (effectiveMessage == null && msg != null) {
                        effectiveMessage = msg;
                      }
                    }
                    if (effectivePattern != null &&
                        effectivePattern.trim().isNotEmpty) {
                      try {
                        final regex = RegExp(effectivePattern);
                        if (!regex.hasMatch(value)) {
                          return effectiveMessage ??
                              (isHindi
                                  ? 'इनपुट प्रारूप अमान्य है'
                                  : 'Invalid input format');
                        }
                      } catch (_) {}
                    }

                    // Add minValue and maxValue validation for numeric questions
                    if (_isNumericQuestionType(question.questionType)) {
                      final numValue = num.tryParse(value);
                      if (numValue != null) {
                        // Check minValue
                        if (question.minValue != null &&
                            question.minValue!.isNotEmpty) {
                          final minValue = num.tryParse(question.minValue!);
                          if (minValue != null && numValue < minValue) {
                            return isHindi
                                ? 'मान ${minValue} से कम नहीं हो सकता'
                                : 'Value must be at least ${minValue}';
                          }
                        }

                        // Check maxValue
                        if (question.maxValue != null &&
                            question.maxValue!.isNotEmpty) {
                          final maxValue = num.tryParse(question.maxValue!);
                          if (maxValue != null && numValue > maxValue) {
                            return isHindi
                                ? 'मान ${maxValue} से अधिक नहीं हो सकता'
                                : 'Value must be at most ${maxValue}';
                          }
                        }
                      }
                    }

                    return null;
                  }
                : null,
            onChanged: (value) {
              setState(() {
                _answers[question.id] = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (_isSubmitting) {
      return false;
    }

    // If showing page list, exit normally
    if (_showPageList) {
      final shouldExit = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(LanguageUtils.getExitSurveyText(widget.language)),
          content: Text(
            isHindi
                ? 'क्या आप वाकई इस सर्वेक्षण को छोड़ना चाहते हैं? आपकी प्रगति सहेजी जाएगी।'
                : widget.language.toLowerCase() == 'te'
                    ? 'మీరు ఈ సర్వేను నిష్క్రమించాలనుకుంటున్నారా? మీ పురోగతి భద్రపరచబడుతుంది.'
                    : 'Are you sure you want to exit this survey? Your progress will be saved.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(LanguageUtils.getStayText(widget.language)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(LanguageUtils.getExitText(widget.language)),
            ),
          ],
        ),
      );

      // Save progress before exiting if user confirms
      if (shouldExit == true) {
        // Save all current answers to local SQLite database as draft
        await _saveDraftToLocalStorage();

        // Save ALL answers to backend (not just current group) when online
        await _saveAllAnswersToBackend();

        final questionGroups = _getQuestionGroups();
        if (_currentGroupIndex < questionGroups.length) {
          // Also save the current position to SharedPreferences
          final currentGroup = questionGroups[_currentGroupIndex];
          final currentPageId = currentGroup.pageId;
          if (currentPageId != null) {
            await _saveLastAnsweredPosition(currentPageId, _currentGroupIndex);
          }
        }
      }

      return shouldExit ?? false;
    } else {
      // If showing questions, save draft and current position before going back to page list
      await _saveDraftToLocalStorage();

      final questionGroups = _getQuestionGroups();
      if (_currentGroupIndex < questionGroups.length) {
        final currentGroup = questionGroups[_currentGroupIndex];
        final currentPageId = currentGroup.pageId;
        if (currentPageId != null) {
          await _saveLastAnsweredPosition(currentPageId, _currentGroupIndex);
        }
      }

      // Go back to page list instead of exiting
      setState(() {
        _showPageList = true;
      });
      return false; // Prevent exiting the survey
    }
  }

  String? _getRadioGroupValue(String questionId) {
    final answer = _answers[questionId];
    if (answer is String) {
      return answer;
    } else if (answer is List<String> && answer.isNotEmpty) {
      return answer.first;
    }
    return null;
  }

  Widget _buildRadioQuestion(
    Fragment$QuestionFetch question,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    final options = _effectiveOptions(question);

    final hintText = _effectiveQuestionHint(question);
    String? selectedOptionId = _getRadioGroupValue(question.id);
    if (selectedOptionId != null &&
        !options.any((o) => o.id == selectedOptionId)) {
      selectedOptionId = null;
      // Clear invalid stored answer after build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _answers.remove(question.id);
          });
        }
      });
    }
    // Helper function to get text with fallback to English
    String getLocalizedText(String? localizedText, String fallbackText) {
      // Use localized text for all languages (not just Hindi)
      if (localizedText != null && localizedText.trim().isNotEmpty) {
        return localizedText;
      }
      return fallbackText;
    }

    String evaluatedOptionText(
      Fragment$QuestionFetch$options$edges$node option,
    ) {
      final rawText = _getOptionDisplayText(option, question);
      return _evaluateTemplate(rawText, question);
    }

    // Get or create text controller for other option
    TextEditingController? getOtherOptionController(String optionId) {
      final controllerKey = '${question.id}_$optionId';
      if (!_otherOptionControllers.containsKey(controllerKey)) {
        // Check if we have an existing value for this other option
        String? initialValue;
        if (question.questionType ==
            Enum$SurveyQuestionQuestionTypeChoices.RADIO) {
          final perOptionKey = '${question.id}_${optionId}_other';
          final radioKey = '${question.id}_other';
          initialValue =
              (_answers[perOptionKey] as String?) ??
              (_answers[radioKey] as String?);
          debugPrint(
            'getOtherOptionController (RADIO): question.id=${question.id}, optionId=$optionId, initialValue=$initialValue',
          );
        } else if (question.questionType ==
            Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX) {
          initialValue =
              _answers['${question.id}_${optionId}_other'] as String?;
          debugPrint(
            'getOtherOptionController (CHECKBOX): question.id=${question.id}, optionId=$optionId, initialValue=$initialValue',
          );
        } else {
          debugPrint(
            'getOtherOptionController (UNKNOWN TYPE): question.id=${question.id}, questionType=${question.questionType}',
          );
        }

        _otherOptionControllers[controllerKey] = TextEditingController(
          text: initialValue ?? '',
        );
        debugPrint(
          'Created controller for key: $controllerKey with value: $initialValue',
        );
      } else {
        debugPrint('Using existing controller for key: $controllerKey');
      }
      return _otherOptionControllers[controllerKey];
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _evaluateTemplate(
                        getLocalizedText(question.localizedText, question.text),
                        question,
                      ),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (hintText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          hintText,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (question.isRequired)
                Text(
                  '*',
                  style: TextStyle(
                    color: colorScheme.error,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              _buildQuestionTTSButton(question, colorScheme),
            ],
          ),
          const SizedBox(height: 16),

          // Show different UI based on whether options are available
          if (options.isEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: colorScheme.outline),
                borderRadius: BorderRadius.circular(12),
                color: colorScheme.surface.withOpacity(0.5),
              ),
              child: Text(
                LanguageUtils.getNoOptionsAvailable(widget.language),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.6),
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            )
          else
            Column(
              children: [
                ...options.map(
                  (option) => Column(
                    children: [
                      RadioListTile<String>(
                        title: Text(evaluatedOptionText(option)),
                        value: option.id,
                        groupValue: selectedOptionId,
                        onChanged: (value) async {
                          setState(() {
                            _answers[question.id] = value;
                          });

                          // Speak the selected option if answers are spoken
                          if (widget.mode.speaksAnswers) {
                            final selectedText = LanguageUtils.getSelectedText(
                              widget.language,
                            );
                            final optionText = evaluatedOptionText(option);
                            _speakIfAvailable('$selectedText: $optionText');
                          }

                          // Check if this option has sub-questions
                          if (option.hasSubQuestion == true &&
                              option.subQuestions?.isNotEmpty == true) {
                            await _showSubQuestionsBottomSheet(option);
                          }
                        },
                        contentPadding: EdgeInsets.zero,
                      ),
                      // Show text input for "other" option when selected, but not in dependent questions with custom text
                      if (_isOtherOption(option) &&
                          selectedOptionId == option.id &&
                          !_shouldShowCustomTextInsteadOfInput(
                            option,
                            question,
                          ))
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 40,
                            right: 16,
                            bottom: 16,
                          ),
                          child: TextFormField(
                            controller: getOtherOptionController(option.id),
                            focusNode: getOtherOptionFocusNode(
                              question.id,
                              option.id,
                            ),
                            decoration: InputDecoration(
                              hintText: isHindi
                                  ? 'कृपया अपना उत्तर दर्ज करें...'
                                  : 'Please specify your answer...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: colorScheme.surface,
                            ),
                            validator:
                                question.isRequired &&
                                    !_shouldShowCustomTextInsteadOfInput(
                                      option,
                                      question,
                                    )
                                ? (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return isHindi
                                          ? 'यह फ़ील्ड आवश्यक है'
                                          : 'This field is required';
                                    }
                                    return null;
                                  }
                                : null,
                            onChanged: (value) {
                              // Store the custom text value
                              setState(() {
                                final radioKey = '${question.id}_other';
                                final perOptionKey =
                                    '${question.id}_${option.id}_other';
                                _answers[radioKey] = value;
                                _answers[perOptionKey] = value;
                                // Ensure "other" option remains selected
                                _answers[question.id] = option.id;
                              });
                            },
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
  }

  Widget _buildCheckboxQuestion(
    Fragment$QuestionFetch question,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    final options = _effectiveOptions(question);
    final hintText = _effectiveQuestionHint(question);

    List<String> selectedOptions = _answers[question.id] as List<String>? ?? [];
    // Remove any selections that are no longer available
    final allowedIds = options.map((o) => o.id).toSet();
    final filteredSelected = selectedOptions
        .where((id) => allowedIds.contains(id))
        .toList();
    if (filteredSelected.length != selectedOptions.length) {
      selectedOptions = filteredSelected;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _answers[question.id] = filteredSelected;
          });
        }
      });
    }
    // Normalize selection to ensure "Other" is marked selected if other text exists
    final normalizedSelected = List<String>.from(selectedOptions);
    for (final optEdge in question.options.edges) {
      final opt = optEdge?.node;
      if (opt == null) continue;
      if (_isOtherOption(opt)) {
        final otherKey = '${question.id}_${opt.id}_other';
        final txt = (_answers[otherKey] as String?)?.trim();
        if (txt != null &&
            txt.isNotEmpty &&
            !normalizedSelected.contains(opt.id)) {
          normalizedSelected.add(opt.id);
        }
      }
    }

    // Helper function to get text with fallback to English
    String getLocalizedText(String? localizedText, String fallbackText) {
      // Use localized text for all languages (not just Hindi)
      if (localizedText != null && localizedText.trim().isNotEmpty) {
        return localizedText;
      }
      return fallbackText;
    }

    String evaluatedOptionText(
      Fragment$QuestionFetch$options$edges$node option,
    ) {
      final rawText = _getOptionDisplayText(option, question);
      return _evaluateTemplate(rawText, question);
    }

    // Get or create text controller for other option
    TextEditingController? getOtherOptionController(String optionId) {
      final controllerKey = '${question.id}_$optionId';
      if (!_otherOptionControllers.containsKey(controllerKey)) {
        // Check if we have an existing value for this other option
        String? initialValue;
        if (question.questionType ==
            Enum$SurveyQuestionQuestionTypeChoices.RADIO) {
          initialValue = _answers['${question.id}_other'] as String?;
          debugPrint(
            'getOtherOptionController (RADIO): question.id=${question.id}, optionId=$optionId, initialValue=$initialValue',
          );
        } else if (question.questionType ==
            Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX) {
          initialValue =
              _answers['${question.id}_${optionId}_other'] as String?;
          debugPrint(
            'getOtherOptionController (CHECKBOX): question.id=${question.id}, optionId=$optionId, initialValue=$initialValue',
          );
        } else {
          debugPrint(
            'getOtherOptionController (UNKNOWN TYPE): question.id=${question.id}, questionType=${question.questionType}',
          );
        }

        _otherOptionControllers[controllerKey] = TextEditingController(
          text: initialValue ?? '',
        );
        debugPrint(
          'Created controller for key: $controllerKey with value: $initialValue',
        );
      } else {
        debugPrint('Using existing controller for key: $controllerKey');
      }
      return _otherOptionControllers[controllerKey];
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _evaluateTemplate(
                        getLocalizedText(question.localizedText, question.text),
                        question,
                      ),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (hintText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          hintText,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (question.isRequired)
                Text(
                  '*',
                  style: TextStyle(
                    color: colorScheme.error,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              _buildQuestionTTSButton(question, colorScheme),
            ],
          ),
          const SizedBox(height: 16),

          // Show different UI based on whether options are available
          if (options.isEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: colorScheme.outline),
                borderRadius: BorderRadius.circular(12),
                color: colorScheme.surface.withOpacity(0.5),
              ),
              child: Text(
                LanguageUtils.getNoOptionsAvailable(widget.language),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.6),
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            )
          else
            Builder(
              builder: (context) {
                // Auto-detect if this checkbox question has a "None" option
                // If it does, apply mutual exclusivity (None disables other options)
                final hasNoneOption = options.any((opt) => _isNoneOption(opt));

                // Get current selections directly from _answers for accurate state
                final currentSelections =
                    _answers[question.id] as List<String>? ?? [];

                // Check if "None" option is currently selected
                final isNoneSelected =
                    hasNoneOption &&
                    options.any(
                      (opt) =>
                          _isNoneOption(opt) &&
                          currentSelections.contains(opt.id),
                    );

                return Column(
                  children: [
                    ...options.map((option) {
                      final isNoneOption = _isNoneOption(option);
                      // Disable non-None options when None is selected
                      final isDisabled =
                          hasNoneOption && isNoneSelected && !isNoneOption;

                      return Column(
                        children: [
                          CheckboxListTile(
                            title: Text(
                              evaluatedOptionText(option),
                              style: isDisabled
                                  ? TextStyle(
                                      color: colorScheme.onSurface.withOpacity(
                                        0.38,
                                      ),
                                    )
                                  : null,
                            ),
                            value: currentSelections.contains(option.id),
                            onChanged: isDisabled
                                ? null
                                : (checked) async {
                                    setState(() {
                                      final currentSelected =
                                          _answers[question.id]
                                              as List<String>? ??
                                          [];

                                      if (checked == true) {
                                        // Check if user is selecting "None" option
                                        if (hasNoneOption && isNoneOption) {
                                          // Selecting "None" - deselect all other options
                                          // Also clear any "other" text inputs
                                          for (final opt in options) {
                                            if (_isOtherOption(opt)) {
                                              getOtherOptionController(
                                                opt.id,
                                              )?.clear();
                                              _answers.remove(
                                                '${question.id}_${opt.id}_other',
                                              );
                                            }
                                          }
                                          _answers[question.id] = [option.id];
                                        } else {
                                          // Normal checkbox behavior
                                          _answers[question.id] = [
                                            ...currentSelected,
                                            option.id,
                                          ];
                                        }
                                      } else {
                                        _answers[question.id] = currentSelected
                                            .where((id) => id != option.id)
                                            .toList();
                                        // Clear other text input when deselected
                                        if (_isOtherOption(option)) {
                                          getOtherOptionController(
                                            option.id,
                                          )?.clear();
                                          _answers.remove(
                                            '${question.id}_${option.id}_other',
                                          );
                                        }
                                      }
                                    });

                                    // Speak the selected/deselected option if answers are spoken
                                    if (widget.mode.speaksAnswers) {
                                      final action = checked == true
                                          ? LanguageUtils.getSelectedText(
                                              widget.language,
                                            )
                                          : LanguageUtils.getDeselectedText(
                                              widget.language,
                                            );
                                      final optionText = evaluatedOptionText(
                                        option,
                                      );
                                      _speakIfAvailable('$action: $optionText');
                                    }

                                    // Check if this option has sub-questions and was selected
                                    if (checked == true &&
                                        option.hasSubQuestion == true &&
                                        option.subQuestions?.isNotEmpty ==
                                            true) {
                                      await _showSubQuestionsBottomSheet(
                                        option,
                                      );
                                    }
                                  },
                            contentPadding: EdgeInsets.zero,
                          ),
                          // Show text input for "other" option when selected, but not in dependent questions with custom text
                          if (_isOtherOption(option) &&
                              normalizedSelected.contains(option.id) &&
                              !_shouldShowCustomTextInsteadOfInput(
                                option,
                                question,
                              ))
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 40,
                                right: 16,
                                bottom: 16,
                              ),
                              child: TextFormField(
                                controller: getOtherOptionController(option.id),
                                focusNode: getOtherOptionFocusNode(
                                  question.id,
                                  option.id,
                                ),
                                decoration: InputDecoration(
                                  hintText: isHindi
                                      ? 'कृपया अपना उत्तर दर्ज करें...'
                                      : 'Please specify your answer...',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: colorScheme.surface,
                                ),
                                validator:
                                    question.isRequired &&
                                        !_shouldShowCustomTextInsteadOfInput(
                                          option,
                                          question,
                                        )
                                    ? (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return isHindi
                                              ? 'यह फ़ील्ड आवश्यक है'
                                              : 'This field is required';
                                        }
                                        return null;
                                      }
                                    : null,
                                onTap: () {
                                  // Ensure other option is selected when focusing input
                                  setState(() {
                                    final currentSelected =
                                        _answers[question.id]
                                            as List<String>? ??
                                        [];
                                    if (!currentSelected.contains(option.id)) {
                                      _answers[question.id] = [
                                        ...currentSelected,
                                        option.id,
                                      ];
                                    }
                                  });
                                },
                                onChanged: (value) {
                                  // Store the custom text value
                                  setState(() {
                                    _answers['${question.id}_${option.id}_other'] =
                                        value;
                                    // Auto-select the "other" checkbox if not already
                                    final currentSelected =
                                        _answers[question.id]
                                            as List<String>? ??
                                        [];
                                    if (!currentSelected.contains(option.id)) {
                                      _answers[question.id] = [
                                        ...currentSelected,
                                        option.id,
                                      ];
                                    }
                                  });
                                },
                              ),
                            ),
                        ],
                      );
                    }),
                  ],
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _buildDropdownQuestion(
    Fragment$QuestionFetch question,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    final options = _effectiveOptions(question);

    final hintText = _effectiveQuestionHint(question);

    // Helper function to get text with fallback to English
    String getLocalizedText(String? localizedText, String fallbackText) {
      // Use localized text for all languages (not just Hindi)
      if (localizedText != null && localizedText.trim().isNotEmpty) {
        return localizedText;
      }
      return fallbackText;
    }

    String? selectedOptionId = _answers[question.id] as String?;
    // Ensure selected value is valid under current filtered options
    if (selectedOptionId != null &&
        !options.any((o) => o.id == selectedOptionId)) {
      selectedOptionId = null;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _answers.remove(question.id);
          });
        }
      });
    }

    // Get or create text controller for other option
    TextEditingController? getOtherOptionController(String optionId) {
      final controllerKey = '${question.id}_$optionId';
      if (!_otherOptionControllers.containsKey(controllerKey)) {
        final perOptionKey = '${question.id}_${optionId}_other';
        final radioKey = '${question.id}_other';
        final initialValue =
            (_answers[perOptionKey] as String?) ??
            (_answers[radioKey] as String?);
        _otherOptionControllers[controllerKey] = TextEditingController(
          text: initialValue ?? '',
        );
      }
      return _otherOptionControllers[controllerKey];
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _evaluateTemplate(
                        question.localizedText ?? question.text,
                        question,
                      ),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (hintText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          hintText,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (question.isRequired)
                Text(
                  '*',
                  style: TextStyle(
                    color: colorScheme.error,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              _buildQuestionTTSButton(question, colorScheme),
            ],
          ),
          const SizedBox(height: 16),

          // Show different UI based on whether options are available
          if (options.isEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: colorScheme.outline),
                borderRadius: BorderRadius.circular(12),
                color: colorScheme.surface.withOpacity(0.5),
              ),
              child: Text(
                LanguageUtils.getNoOptionsAvailable(widget.language),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.6),
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            )
          else
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: colorScheme.surface,
                hintText: LanguageUtils.getSelectOption(widget.language),
              ),
              value: selectedOptionId,
              items: options
                  .map(
                    (option) => DropdownMenuItem<String>(
                      value: option.id,
                      child: Text(_getOptionDisplayText(option, question)),
                    ),
                  )
                  .toList(),
              onChanged: (value) async {
                // Debug log for dropdown selection
                final questionKey = question.key?.trim().toLowerCase();
                if (questionKey == 'state' ||
                    questionKey == 'district' ||
                    questionKey == 'block' ||
                    questionKey == 'clf') {
                  debugPrint(
                    '🎯 DROPDOWN SELECTED: key=$questionKey, questionId=${question.id}, value=$value, valueId=${value?.runtimeType}',
                  );
                }

                setState(() {
                  _answers[question.id] = value;
                  selectedOptionId = value;

                  // Debug log for storing value
                  if (questionKey == 'state' ||
                      questionKey == 'district' ||
                      questionKey == 'block' ||
                      questionKey == 'clf') {
                    debugPrint(
                      '💾 STORED IN _answers: key=$questionKey, questionId=${question.id}, storedValue=$value',
                    );
                  }

                  // Cascading clear logic for location dropdowns
                  if (questionKey == 'state') {
                    // Clear district, block and CLF when state changes
                    for (final q in _getSortedQuestions()) {
                      final qKey = q.key?.trim().toLowerCase();
                      if (qKey == 'district' ||
                          qKey == 'block' ||
                          qKey == 'clf') {
                        debugPrint(
                          '🧹 CLEARING: key=$qKey, questionId=${q.id} due to state change',
                        );
                        _answers.remove(q.id);
                      }
                    }
                  } else if (questionKey == 'district') {
                    // Clear block and CLF when district changes
                    for (final q in _getSortedQuestions()) {
                      final qKey = q.key?.trim().toLowerCase();
                      if (qKey == 'block' || qKey == 'clf') {
                        debugPrint(
                          '🧹 CLEARING: key=$qKey, questionId=${q.id} due to district change',
                        );
                        _answers.remove(q.id);
                      }
                    }
                  } else if (questionKey == 'block') {
                    // Clear CLF when block changes
                    for (final q in _getSortedQuestions()) {
                      final qKey = q.key?.trim().toLowerCase();
                      if (qKey == 'clf') {
                        debugPrint(
                          '🧹 CLEARING: key=$qKey, questionId=${q.id} due to block change',
                        );
                        _answers.remove(q.id);
                      }
                    }
                  }
                });

                if (value != null) {
                  final selectedOption = options.firstWhere(
                    (option) => option.id == value,
                  );

                  // Speak the selected option if in audio mode
                  if (widget.mode.speaksAnswers) {
                    final selectedText = LanguageUtils.getSelectedText(
                      widget.language,
                    );
                    final optionText = getLocalizedText(
                      selectedOption.localizedText,
                      selectedOption.text,
                    );
                    _speakIfAvailable('$selectedText: $optionText');
                  }

                  // Check if this option has sub-questions
                  if (selectedOption.hasSubQuestion == true &&
                      selectedOption.subQuestions?.isNotEmpty == true) {
                    await _showSubQuestionsBottomSheet(selectedOption);
                  }
                }
              },
              onTap: () {
                // When answers are spoken, speak the selected option when dropdown is opened
                if (widget.mode.speaksAnswers &&
                    selectedOptionId != null) {
                  final selectedOption = options.firstWhere(
                    (option) => option.id == selectedOptionId,
                    orElse: () => options.first,
                  );
                  final optionText = getLocalizedText(
                    selectedOption.localizedText,
                    selectedOption.text,
                  );
                  _speakIfAvailable(optionText);
                }
              },
              validator: question.isRequired
                  ? (value) {
                      if (value == null || value.isEmpty) {
                        return isHindi
                            ? 'यह फ़ील्ड आवश्यक है'
                            : 'This field is required';
                      }
                      return null;
                    }
                  : null,
            ),
          // Show text input for "other" option when selected, but not in dependent questions with custom text
          if (selectedOptionId != null)
            ...options.where((o) => o.id == selectedOptionId).map((option) {
              final isOther = _isOtherOption(option);
              if (!isOther) return const SizedBox.shrink();
              if (_shouldShowCustomTextInsteadOfInput(option, question))
                return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(
                  left: 0,
                  right: 0,
                  top: 12,
                  bottom: 0,
                ),
                child: TextFormField(
                  controller: getOtherOptionController(option.id),
                  decoration: InputDecoration(
                    hintText: isHindi
                        ? 'कृपया अपना उत्तर दर्ज करें...'
                        : 'Please specify your answer...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: colorScheme.surface,
                  ),
                  validator:
                      question.isRequired &&
                          !_shouldShowCustomTextInsteadOfInput(option, question)
                      ? (value) {
                          if (value == null || value.trim().isEmpty) {
                            return isHindi
                                ? 'यह फ़ील्ड आवश्यक है'
                                : 'This field is required';
                          }
                          return null;
                        }
                      : null,
                  onChanged: (value) {
                    setState(() {
                      final perOptionKey = '${question.id}_${option.id}_other';
                      final radioKey = '${question.id}_other';
                      _answers[perOptionKey] = value;
                      _answers[radioKey] = value;
                      // Keep dropdown selection on the other option
                      _answers[question.id] = option.id;
                    });
                  },
                ),
              );
            }).toList(),
        ],
      ),
    );
  }

  Widget _buildTextAreaQuestion(
    Fragment$QuestionFetch question,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    // Get or create text controller for this question
    if (!_textControllers.containsKey(question.id)) {
      _textControllers[question.id] = TextEditingController(
        text: _answers[question.id] as String? ?? '',
      );
    }
    final controller = _textControllers[question.id]!;

    // Get or create focus node for this question
    if (!_focusNodes.containsKey(question.id)) {
      _focusNodes[question.id] = FocusNode();
    }
    final focusNode = _focusNodes[question.id]!;

    final showVoiceInput =
        widget.mode.speaksAnswers;
    final hintText = _effectiveQuestionHint(question);

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _evaluateTemplate(
                        question.localizedText ?? question.text,
                        question,
                      ),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (hintText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          hintText,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (question.isRequired)
                Text(
                  '*',
                  style: TextStyle(
                    color: colorScheme.error,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              _buildQuestionTTSButton(question, colorScheme),
            ],
          ),
          const SizedBox(height: 16),

          // Voice Recording Option

          // Text Input Field
          TextFormField(
            controller: controller,
            focusNode: focusNode,
            inputFormatters: _inputFormattersForQuestion(question),
            decoration: InputDecoration(
              hintText: showVoiceInput
                  ? (LanguageUtils.getTypeHere(widget.language))
                  : (isHindi
                        ? 'अपना उत्तर दर्ज करें...'
                        : 'Enter your answer...'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: colorScheme.surface,
            ),
            maxLines: 5,
            minLines: 3,
            validator: question.isRequired
                ? (value) {
                    if (value == null || value.trim().isEmpty) {
                      return isHindi
                          ? 'यह फ़ील्ड आवश्यक है'
                          : 'This field is required';
                    }
                    // Apply API-provided or preset regex validation if present
                    final raw = question.validationPattern?.trim();
                    String? effectivePattern = raw;
                    String? effectiveMessage = question.validationMessage;
                    if (raw != null) {
                      final preset = presetPatternForLabel(raw);
                      if (preset != null) effectivePattern = preset;
                      final msg = presetMessageForLabel(raw);
                      if (effectiveMessage == null && msg != null) {
                        effectiveMessage = msg;
                      }
                    }
                    if (effectivePattern != null &&
                        effectivePattern.trim().isNotEmpty) {
                      try {
                        final regex = RegExp(effectivePattern);
                        if (!regex.hasMatch(value)) {
                          return effectiveMessage ??
                              (isHindi
                                  ? 'इनपुट प्रारूप अमान्य है'
                                  : 'Invalid input format');
                        }
                      } catch (_) {}
                    }
                    return null;
                  }
                : null,
            onChanged: (value) {
              setState(() {
                _answers[question.id] = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmailQuestion(
    Fragment$QuestionFetch question,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    // Get or create text controller for this question
    if (!_textControllers.containsKey(question.id)) {
      _textControllers[question.id] = TextEditingController(
        text: _answers[question.id] as String? ?? '',
      );
    }
    final controller = _textControllers[question.id]!;

    // Get or create focus node for this question
    if (!_focusNodes.containsKey(question.id)) {
      _focusNodes[question.id] = FocusNode();
    }
    final focusNode = _focusNodes[question.id]!;
    final hintText = _effectiveQuestionHint(question);

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _evaluateTemplate(
                        question.localizedText ?? question.text,
                        question,
                      ),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (hintText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          hintText,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (question.isRequired)
                Text(
                  '*',
                  style: TextStyle(
                    color: colorScheme.error,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              _buildQuestionTTSButton(question, colorScheme),
            ],
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: TextInputType.emailAddress,
            inputFormatters: _inputFormattersForQuestion(question),
            decoration: InputDecoration(
              hintText: isHindi
                  ? 'ईमेल दर्ज करें...'
                  : 'Enter email address...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: colorScheme.surface,
              prefixIcon: const Icon(Icons.email_outlined),
            ),
            validator: (value) {
              if (question.isRequired &&
                  (value == null || value.trim().isEmpty)) {
                return isHindi
                    ? 'यह फ़ील्ड आवश्यक है'
                    : 'This field is required';
              }
              if (value != null && value.isNotEmpty) {
                final raw = question.validationPattern?.trim();
                String? effectivePattern = raw;
                String? effectiveMessage = question.validationMessage;
                if (raw != null) {
                  final preset = presetPatternForLabel(raw);
                  if (preset != null) effectivePattern = preset;
                  final msg = presetMessageForLabel(raw);
                  if (effectiveMessage == null && msg != null) {
                    effectiveMessage = msg;
                  }
                }
                if (effectivePattern != null &&
                    effectivePattern.trim().isNotEmpty) {
                  try {
                    final regex = RegExp(effectivePattern);
                    if (!regex.hasMatch(value)) {
                      return effectiveMessage ??
                          (isHindi
                              ? 'वैध ईमेल पता दर्ज करें'
                              : 'Please enter a valid email address');
                    }
                  } catch (_) {
                    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                    if (!emailRegex.hasMatch(value)) {
                      return isHindi
                          ? 'वैध ईमेल पता दर्ज करें'
                          : 'Please enter a valid email address';
                    }
                  }
                } else {
                  final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                  if (!emailRegex.hasMatch(value)) {
                    return isHindi
                        ? 'वैध ईमेल पता दर्ज करें'
                        : 'Please enter a valid email address';
                  }
                }
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _answers[question.id] = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNumberQuestion(
    Fragment$QuestionFetch question,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    // Get or create text controller for this question
    if (!_textControllers.containsKey(question.id)) {
      _textControllers[question.id] = TextEditingController(
        text: _answers[question.id] as String? ?? '',
      );
    }
    final controller = _textControllers[question.id]!;

    // Get or create focus node for this question
    if (!_focusNodes.containsKey(question.id)) {
      _focusNodes[question.id] = FocusNode();
    }
    final focusNode = _focusNodes[question.id]!;
    final hintText = _effectiveQuestionHint(question);

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _evaluateTemplate(
                        question.localizedText ?? question.text,
                        question,
                      ),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (hintText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          hintText,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (question.isRequired)
                Text(
                  '*',
                  style: TextStyle(
                    color: colorScheme.error,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              _buildQuestionTTSButton(question, colorScheme),
            ],
          ),
          const SizedBox(height: 16),

          TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
            ],
            decoration: InputDecoration(
              hintText: LanguageUtils.getEnterNumber(widget.language),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: colorScheme.surface,
            ),
            validator: (value) {
              if (question.isRequired &&
                  (value == null || value.trim().isEmpty)) {
                return isHindi
                    ? 'यह फ़ील्ड आवश्यक है'
                    : 'This field is required';
              }
              if (value != null && value.isNotEmpty) {
                final number = double.tryParse(value);
                if (number == null) {
                  return isHindi
                      ? 'वैध संख्या दर्ज करें'
                      : 'Please enter a valid number';
                }

                // Add minValue validation
                if (question.minValue != null &&
                    question.minValue!.isNotEmpty) {
                  final minValue = double.tryParse(question.minValue!);
                  if (minValue != null && number < minValue) {
                    return isHindi
                        ? 'मान ${minValue} से कम नहीं हो सकता'
                        : 'Value must be at least ${minValue}';
                  }
                }

                // Add maxValue validation
                if (question.maxValue != null &&
                    question.maxValue!.isNotEmpty) {
                  final maxValue = double.tryParse(question.maxValue!);
                  if (maxValue != null && number > maxValue) {
                    return isHindi
                        ? 'मान ${maxValue} से अधिक नहीं हो सकता'
                        : 'Value must be at most ${maxValue}';
                  }
                }

                // Cross-question validation: land in name must be less than total land.
                const String totalLandFieldKey = 'total_land_owned';
                const String landInNameFieldKey = 'land_in_name';

                if (_matchesQuestionFieldKey(question, landInNameFieldKey)) {
                  final totalLandAnswer = _getAnswerByQuestionFieldKey(
                    totalLandFieldKey,
                  );
                  if (totalLandAnswer != null && totalLandAnswer.isNotEmpty) {
                    final totalLandValue = double.tryParse(totalLandAnswer);
                    if (totalLandValue != null && number >= totalLandValue) {
                      return isHindi
                          ? 'यह मान कुल भूमि ($totalLandValue) से कम होना चाहिए'
                          : 'This value must be less than total land owned ($totalLandValue)';
                    }
                  }
                }
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _answers[question.id] = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDateQuestion(
    Fragment$QuestionFetch question,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    final hintText = _effectiveQuestionHint(question);

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _evaluateTemplate(
                        question.localizedText ?? question.text,
                        question,
                      ),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (hintText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          hintText,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (question.isRequired)
                Text(
                  '*',
                  style: TextStyle(
                    color: colorScheme.error,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              _buildQuestionTTSButton(question, colorScheme),
            ],
          ),
          const SizedBox(height: 16),

          InkWell(
            onTap: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (selectedDate != null) {
                setState(() {
                  _answers[question.id] = selectedDate.toIso8601String().split(
                    'T',
                  )[0];
                });
              }
            },
            child: InputDecorator(
              decoration: InputDecoration(
                hintText:
                    LanguageUtils.getSelectDateText(widget.language) + '...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: colorScheme.surface,
                suffixIcon: const Icon(Icons.calendar_today),
                errorText: question.isRequired && _answers[question.id] == null
                    ? (isHindi
                          ? 'यह फ़ील्ड आवश्यक है'
                          : 'This field is required')
                    : null,
              ),
              child: Text(
                _answers[question.id] as String? ??
                    (LanguageUtils.getSelectDateText(widget.language)),
                style: TextStyle(
                  color: _answers[question.id] != null
                      ? colorScheme.onSurface
                      : colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeQuestion(
    Fragment$QuestionFetch question,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    final hintText = _effectiveQuestionHint(question);

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question.localizedText ?? question.text,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (hintText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          hintText,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (question.isRequired)
                Text(
                  '*',
                  style: TextStyle(
                    color: colorScheme.error,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              _buildQuestionTTSButton(question, colorScheme),
            ],
          ),
          const SizedBox(height: 16),

          // _effectiveOptions
          InkWell(
            onTap: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (selectedDate != null) {
                final selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (selectedTime != null) {
                  final dateTime = DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    selectedTime.hour,
                    selectedTime.minute,
                  );
                  setState(() {
                    _answers[question.id] = dateTime.toIso8601String();
                  });
                }
              }
            },
            child: InputDecorator(
              decoration: InputDecoration(
                hintText: isHindi
                    ? 'तारीख और समय चुनें...'
                    : 'Select date & time...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: colorScheme.surface,
                suffixIcon: const Icon(Icons.event),
                errorText: question.isRequired && _answers[question.id] == null
                    ? (isHindi
                          ? 'यह फ़ील्ड आवश्यक है'
                          : 'This field is required')
                    : null,
              ),
              child: Text(
                _answers[question.id] != null
                    ? DateTime.parse(
                        _answers[question.id] as String,
                      ).toString().substring(0, 16)
                    : (LanguageUtils.getSelectDateAndTime(widget.language)),
                style: TextStyle(
                  color: _answers[question.id] != null
                      ? colorScheme.onSurface
                      : colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeQuestion(
    Fragment$QuestionFetch question,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    final hintText = _effectiveQuestionHint(question);

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question.localizedText ?? question.text,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (hintText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          hintText,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (question.isRequired)
                Text(
                  '*',
                  style: TextStyle(
                    color: colorScheme.error,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              _buildQuestionTTSButton(question, colorScheme),
            ],
          ),
          const SizedBox(height: 16),

          InkWell(
            onTap: () async {
              final selectedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (selectedTime != null) {
                setState(() {
                  _answers[question.id] =
                      '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';
                });
              }
            },
            child: InputDecorator(
              decoration: InputDecoration(
                hintText:
                    LanguageUtils.getSelectTimeText(widget.language) + '...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: colorScheme.surface,
                suffixIcon: const Icon(Icons.access_time),
                errorText: question.isRequired && _answers[question.id] == null
                    ? (isHindi
                          ? 'यह फ़ील्ड आवश్యक है'
                          : 'This field is required')
                    : null,
              ),
              child: Text(
                _answers[question.id] as String? ??
                    (LanguageUtils.getSelectTimeText(widget.language)),
                style: TextStyle(
                  color: _answers[question.id] != null
                      ? colorScheme.onSurface
                      : colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoteQuestion(
    Fragment$QuestionFetch question,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    final hintText = _effectiveQuestionHint(question);

    // Evaluate template in the question text
    final evaluatedText = _evaluateTemplate(
      question.localizedText ?? question.text,
      question,
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      evaluatedText,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (hintText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          hintText,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (question.isRequired)
                Text(
                  '*',
                  style: TextStyle(
                    color: colorScheme.error,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              _buildQuestionTTSButton(question, colorScheme),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildConsentQuestion(
    Fragment$QuestionFetch question,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    final hintText = _effectiveQuestionHint(question);

    // Evaluate template in the question text
    final evaluatedText = _evaluateTemplate(
      question.localizedText ?? question.text,
      question,
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      evaluatedText,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if (hintText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          hintText,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (question.isRequired)
                Text(
                  '*',
                  style: TextStyle(
                    color: colorScheme.error,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              _buildQuestionTTSButton(question, colorScheme),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  String _evaluateTemplate(
    String template,
    Fragment$QuestionFetch currentQuestion,
  ) {
    // Regular expression to match template variables like {{ questionKey + question2 }}
    final regex = RegExp(r'{{\s*([^}]+)\s*}}');

    return template.replaceAllMapped(regex, (match) {
      final expression = match.group(1)?.trim() ?? '';

      try {
        // Parse the expression using the expressions package
        final parsedExpression = Expression.parse(expression);

        // Create context with question values
        final context = <String, dynamic>{};
        final allQuestions = _getSortedQuestions();

        // Add all question values to context using their keys
        for (final question in allQuestions) {
          if (question.key != null && question.key!.isNotEmpty) {
            final key = question.key!;
            final answer = _answers[question.id];
            dynamic contextValue;

            if (_isAnswerEmpty(answer)) {
              if (_isNumericQuestionType(question.questionType)) {
                contextValue = 0;
                print('Added to context (numeric default): $key = 0');
              } else {
                contextValue = '';
                print('Added to context (string default): $key = ""');
              }
            } else {
              if (answer is String) {
                if (_isNumericQuestionType(question.questionType)) {
                  final numValue = num.tryParse(answer);
                  contextValue = numValue ?? 0;
                } else if (_isSingleSelectQuestion(question.questionType)) {
                  final matchedOption = _findOptionById(question, answer);
                  if (matchedOption != null) {
                    contextValue = _localizedOptionText(matchedOption);
                    context['${key}_id'] = answer;
                    print('Added to context raw id: ${key}_id = $answer');
                  } else {
                    contextValue = answer;
                  }
                } else {
                  contextValue = answer;
                }
              } else if (answer is num) {
                contextValue = answer;
              } else if (answer is List<String>) {
                if (_isMultiSelectQuestion(question.questionType)) {
                  final optionTexts = <String>[];
                  final optionIds = <String>[];
                  for (final optionId in answer) {
                    final option = _findOptionById(question, optionId);
                    if (option != null) {
                      optionTexts.add(_localizedOptionText(option));
                      optionIds.add(optionId);
                    } else {
                      optionTexts.add(optionId);
                      optionIds.add(optionId);
                    }
                  }
                  contextValue = optionTexts.join(', ');
                  if (optionIds.isNotEmpty) {
                    context['${key}_ids'] = optionIds;
                    print('Added to context ids: ${key}_ids = $optionIds');
                  }
                } else {
                  contextValue = answer.join(', ');
                }
              } else {
                contextValue = answer.toString();
              }
              print('Added to context: $key = $contextValue');
            }

            context[key] = contextValue;

            final otherKey = '${key}_other';
            final otherText = _otherTextForQuestion(question);
            if (otherText != null && otherText.isNotEmpty) {
              context[otherKey] = otherText;
              print('Added to context: $otherKey = $otherText');
            } else {
              context[otherKey] = '';
            }
          }
        }

        debugPrint(
          'Evaluating template expression "$expression" with context: $context',
        );

        // Evaluate the expression
        const evaluator = ExpressionEvaluator();
        final result = evaluator.eval(parsedExpression, context);

        return result?.toString() ?? '';
      } catch (e) {
        final message = 'Template error for "$expression": ${e.toString()}';
        print('Error evaluating template expression "$expression": $e');
        debugPrint('Error evaluating template expression "$expression": $e');
        _showTemplateErrorSnackbar(message);
        return '';
      }
    });
  }

  void _showTemplateErrorSnackbar(String message) {
    if (!mounted) return;
    if (_templateErrorSnackbarShowing) return;

    _templateErrorSnackbarShowing = true;
  }

  bool _isNumericQuestionType(
    Enum$SurveyQuestionQuestionTypeChoices questionType,
  ) {
    // Define which question types should be treated as numeric
    final numericTypes = [Enum$SurveyQuestionQuestionTypeChoices.NUMBER];

    return numericTypes.contains(questionType);
  }

  bool _isSingleSelectQuestion(
    Enum$SurveyQuestionQuestionTypeChoices questionType,
  ) {
    return questionType == Enum$SurveyQuestionQuestionTypeChoices.RADIO ||
        questionType == Enum$SurveyQuestionQuestionTypeChoices.DROPDOWN;
  }

  bool _isMultiSelectQuestion(
    Enum$SurveyQuestionQuestionTypeChoices questionType,
  ) {
    return questionType == Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX;
  }

  Fragment$QuestionFetch$options$edges$node? _findOptionById(
    Fragment$QuestionFetch question,
    String optionId,
  ) {
    for (final edge in question.options.edges) {
      final option = edge?.node;
      if (option != null && option.id == optionId) {
        return option;
      }
    }
    return null;
  }

  String _localizedOptionText(
    Fragment$QuestionFetch$options$edges$node option,
  ) {
    final localized = option.localizedText?.trim();
    if (isHindi && localized != null && localized.isNotEmpty) {
      return localized;
    }

    final defaultText = option.text.trim();
    return defaultText.isNotEmpty ? defaultText : option.text;
  }

  bool _isAnswerEmpty(dynamic answer) {
    if (answer == null) return true;
    if (answer is String) return answer.trim().isEmpty;
    if (answer is List) return answer.isEmpty;
    return false;
  }

  String? _effectiveQuestionHint(Fragment$QuestionFetch question) {
    final localizedHint = question.localizedHint?.trim();
    if (localizedHint != null && localizedHint.isNotEmpty) {
      return localizedHint;
    }

    final defaultHint = question.hint?.trim();
    if (defaultHint != null && defaultHint.isNotEmpty) {
      return defaultHint;
    }

    return null;
  }

  String _effectivePageTitle(Query$Survey$survey$pages$edges$node page) {
    final localizedTitle = page.localizedTitle?.trim();
    if (localizedTitle != null && localizedTitle.isNotEmpty) {
      return localizedTitle;
    }

    final defaultTitle = page.title?.trim();
    if (defaultTitle != null && defaultTitle.isNotEmpty) {
      return defaultTitle;
    }

    return '';
  }

  // Build page list UI
  Widget _buildPageList() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final sortedPages = _getSortedPages();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _survey!.title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page list
            Expanded(
              child: ListView.builder(
                itemCount: sortedPages.length,
                itemBuilder: (context, index) {
                  final page = sortedPages[index];
                  final pageTitle = _effectivePageTitle(page);
                  final completionPercentage =
                      _calculatePageCompletionPercentage(index);
                  final percentageText = completionPercentage > 0
                      ? '${(completionPercentage * 100).toStringAsFixed(0)}%'
                      : '';
                  final isPageEnabled = _isPageEnabled(index);

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isPageEnabled
                            ? (completionPercentage == 1.0
                                  ? Colors.green
                                  : colorScheme.primary)
                            : Colors.grey,
                        child: Text(
                          '${_calculatePageDisplayNumber(index)}',
                          style: TextStyle(
                            color: isPageEnabled
                                ? colorScheme.onPrimary
                                : Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        pageTitle,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isPageEnabled
                              ? theme.textTheme.titleMedium?.color
                              : Colors.grey,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isPageEnabled)
                            // Progress bar
                            LinearProgressIndicator(
                              value: completionPercentage,
                              backgroundColor: colorScheme.surfaceVariant,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                isPageEnabled
                                    ? (completionPercentage == 1.0
                                          ? Colors.green
                                          : colorScheme.primary)
                                    : Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(4),
                              minHeight: 6,
                            ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (percentageText != '' && isPageEnabled)
                                Text(
                                  percentageText,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: isPageEnabled
                                        ? (completionPercentage == 1.0
                                              ? Colors.green
                                              : colorScheme.primary)
                                        : Colors.grey,
                                  ),
                                ),
                              Text(
                                isPageEnabled
                                    ? (isHindi
                                          ? 'क्लिक करके प्रश्न देखें'
                                          : 'Click to view questions')
                                    : (isHindi
                                          ? 'पिछला पृष्ठ पूरा करें'
                                          : 'Complete previous page'),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: isPageEnabled
                                      ? theme.textTheme.bodySmall?.color
                                      : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: isPageEnabled
                          ? const Icon(Icons.arrow_forward_ios, size: 16)
                          : const Icon(
                              Icons.lock,
                              size: 16,
                              color: Colors.grey,
                            ),
                      onTap: isPageEnabled
                          ? () async {
                              debugPrint(
                                'Page list: Tapped on page index $index',
                              );

                              // Get the target page
                              final sortedPages = _getSortedPages();
                              if (index < 0 || index >= sortedPages.length)
                                return;

                              final targetPage = sortedPages[index];
                              final pageId = targetPage.id;

                              // Try to load the last answered position for this page from SharedPreferences
                              final lastAnsweredPosition =
                                  await _loadLastAnsweredPosition(pageId);

                              int questionIndex;
                              if (lastAnsweredPosition != null) {
                                // Validate and resume from the last answered position
                                questionIndex = _findValidPositionForPage(
                                  lastAnsweredPosition,
                                  pageId,
                                );
                                debugPrint(
                                  'Page list: Validated resume position $questionIndex (was $lastAnsweredPosition) for page $index (pageId: $pageId)',
                                );

                                // If the validated position is different from saved, try to find unanswered question
                                if (questionIndex != lastAnsweredPosition) {
                                  final unansweredIndex =
                                      _findFirstUnansweredQuestionForPage(
                                        pageId,
                                      );
                                  if (unansweredIndex != null) {
                                    questionIndex = unansweredIndex;
                                    debugPrint(
                                      'Page list: Using unanswered question fallback at index $questionIndex for page $index',
                                    );
                                  }
                                }
                              } else {
                                // Find first unanswered question for this page (smart fallback)
                                final unansweredIndex =
                                    _findFirstUnansweredQuestionForPage(pageId);
                                questionIndex =
                                    unansweredIndex ??
                                    _findFirstQuestionIndexForPage(index);
                                debugPrint(
                                  'Page list: No saved position, using unanswered question index $questionIndex for page $index (pageId: $pageId)',
                                );
                              }

                              // Stop any playing TTS when navigating
                              _stopTTS();

                              setState(() {
                                _showPageList = false;
                                _currentGroupIndex = questionIndex;
                              });
                              // Navigate to the selected question
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                if (_pageController.hasClients) {
                                  _pageController.jumpToPage(questionIndex);
                                }
                              });
                            }
                          : () {
                              // Show feedback for disabled page
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    isHindi
                                        ? 'कृपया पहले पिछला पृष्ठ पूरा करें'
                                        : 'Please complete the previous page first',
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
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

  @override
  Widget build(BuildContext context) {
    // Invalidate dependent caches at the start of each build to ensure
    // condition-based filtering reflects current answer state.
    // Note: _cachedSortedQuestions is NOT invalidated since it only depends on survey data.
    _invalidateDependentCaches();

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Survey'),
          elevation: 0,
          backgroundColor: colorScheme.surface,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
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
                  _error!,
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
      final isOnline = ConnectivityService.instance.isOnline;
      return Scaffold(
        appBar: AppBar(title: const Text('Survey')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isOnline ? Icons.search_off : Icons.cloud_off,
                  size: 64,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(height: 16),
                Text(
                  isOnline ? 'Survey not found' : 'No offline data available',
                  style: theme.textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  isOnline
                      ? 'The requested survey could not be found on the server.'
                      : 'Please connect to the internet to download this survey first.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _loadSurvey,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Show page list for both new submissions (when uploads are completed)
    // and existing submissions when _showPageList is true
    if (_showPageList &&
        (widget.responseId == null ? _uploadsCompleted : true)) {
      return _buildPageList();
    }

    // Show upload section if not completed and not loading existing response
    if (!_uploadsCompleted && widget.responseId == null) {
      return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              _survey!.title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            elevation: 0,
            backgroundColor: colorScheme.surface,
            foregroundColor: colorScheme.onSurface,
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colorScheme.surface,
                  colorScheme.surfaceVariant.withOpacity(0.3),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.upload_file,
                          color: colorScheme.onPrimaryContainer,
                          size: 32,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LanguageUtils.getUploadRequired(
                                  widget.language,
                                ),
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: colorScheme.onPrimaryContainer,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                isHindi
                                    ? 'सर्वेक्षण शुरू करने से पहले कृपया निम्नलिखित अपलोड करें'
                                    : 'Please upload the following before starting the survey',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onPrimaryContainer
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

                  // Progress Indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LanguageUtils.getProgressText(widget.language),
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${(_signatureUrl != null ? 1 : 0) + (_photoUrl != null ? 1 : 0)}/2',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value:
                        (_signatureUrl != null ? 0.5 : 0) +
                        (_photoUrl != null ? 0.5 : 0),
                    backgroundColor: colorScheme.surfaceVariant,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  const SizedBox(height: 24),

                  // Upload Section
                  Expanded(child: _buildUploadSection()),
                ],
              ),
            ),
          ),
          bottomNavigationBar: _uploadsCompleted
              ? Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.shadow.withOpacity(0.2),
                        blurRadius: 16,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Show page list instead of directly going to questions
                        _showPageList = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.list_alt,
                          size: 20,
                          color: colorScheme.onPrimary,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          widget.language.toLowerCase() == 'hi'
                              ? 'पृष्ठ सूची देखें'
                              : 'View Page List',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : null,
        ),
      );
    }

    final allQuestions = _getSortedQuestions();
    final questionGroups = _getQuestionGroups();
    final nonConsentGroups = _getNonConsentQuestionGroups();

    if (questionGroups.isNotEmpty &&
        _currentGroupIndex >= questionGroups.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        final lastIndex = questionGroups.length - 1;
        setState(() {
          _currentGroupIndex = lastIndex;
        });
        if (_pageController.hasClients) {
          _pageController.jumpToPage(lastIndex);
        }
      });
    }

    if (allQuestions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(_survey!.title)),
        body: const Center(child: Text('No questions available')),
      );
    }

    final visibleGroupCount = questionGroups.length;
    final safeCurrentIndex = visibleGroupCount == 0
        ? 0
        : _currentGroupIndex.clamp(0, visibleGroupCount - 1);
    final progress = visibleGroupCount == 0
        ? 0.0
        : (safeCurrentIndex + 1) / visibleGroupCount;

    final currentGroupForHeader = questionGroups.isNotEmpty
        ? questionGroups[safeCurrentIndex]
        : null;
    final currentQuestionForHeader = currentGroupForHeader?.firstQuestion;
    final currentPageOrder = currentQuestionForHeader?.page?.order;
    int pageCount = 0;
    int pageIndex = 0;
    String? currentPageTitle;
    if (currentGroupForHeader != null && currentPageOrder != null) {
      final pageGroups = questionGroups
          .where(
            (group) => group.questions.any(
              (question) => question.page?.order == currentPageOrder,
            ),
          )
          .toList();
      pageCount = pageGroups.length;
      final currentGroupPosition = pageGroups.indexOf(currentGroupForHeader);
      pageIndex = currentGroupPosition >= 0 ? currentGroupPosition + 1 : 1;
      // Resolve title from survey pages with localization
      if (_survey?.pages.edges != null) {
        for (final edge in _survey!.pages.edges) {
          final node = edge?.node;
          if (node != null && node.order == currentPageOrder) {
            // Use localized title if available and language is Hindi, otherwise use default title
            final localizedTitle = node.localizedTitle?.trim();
            if (localizedTitle != null && localizedTitle.isNotEmpty) {
              currentPageTitle = localizedTitle;
            } else {
              currentPageTitle = node.title?.trim() ?? '';
            }
            break;
          }
        }
      }
    }

    final bool isLastGroup = visibleGroupCount == 0
        ? true
        : safeCurrentIndex >= visibleGroupCount - 1;
    final bool isConsentGroup =
        currentGroupForHeader != null &&
        currentGroupForHeader.questions.length == 1 &&
        currentGroupForHeader.questions.first.questionType ==
            Enum$SurveyQuestionQuestionTypeChoices.CONSENT;
    final IconData nextButtonIcon = isLastGroup
        ? Icons.send_outlined
        : Icons.arrow_forward;

    // Get localized button label based on language
    String _getButtonLabel(String englishLabel) {
      switch (englishLabel) {
        case 'Submit':
          return LanguageUtils.getSubmitText(widget.language);
        case 'Confirm':
          return LanguageUtils.getConfirmText(widget.language);
        case 'Next':
          return LanguageUtils.getNextText(widget.language);
        case 'Previous':
          return LanguageUtils.getPreviousText(widget.language);
        default:
          return englishLabel;
      }
    }

    final String nextButtonLabel = isLastGroup
        ? _getButtonLabel('Submit')
        : (isConsentGroup
              ? _getButtonLabel('Confirm')
              : _getButtonLabel('Next'));

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_survey!.title),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              if (_showPageList) {
                // If already on page list, trigger _onWillPop to save draft and handle exit
                final shouldPop = await _onWillPop();
                if (shouldPop && mounted) {
                  Navigator.of(context).pop();
                }
              } else {
                // If on questions, save draft and show page list
                await _saveDraftToLocalStorage();
                setState(() {
                  _showPageList = true;
                });
              }
            },
            tooltip: widget.language.toLowerCase() == 'hi'
                ? 'पृष्ठ सूची पर वापस जाएं'
                : 'Back to page list',
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                pageCount > 0 ? '$pageIndex / $pageCount' : '--',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                // Progress Bar
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: colorScheme.surfaceVariant,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    colorScheme.primary,
                  ),
                ),

                // Question Content
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: PageView.builder(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      // Disable swipe
                      onPageChanged: (index) {
                        // Stop any playing TTS when page changes
                        _stopTTS();

                        setState(() {
                          _currentGroupIndex = index;
                        });

                        // Focus the input field for the new question
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _focusCurrentQuestionInput();
                        });
                      },
                      itemCount: questionGroups.length,
                      itemBuilder: (context, index) {
                        final group = questionGroups[index];
                        return SingleChildScrollView(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (
                                int i = 0;
                                i < group.questions.length;
                                i++
                              ) ...[
                                _buildQuestionWidget(group.questions[i]),
                                if (i != group.questions.length - 1)
                                  const SizedBox(height: 16),
                              ],
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Navigation Buttons with Saving Indicator
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    border: Border(
                      top: BorderSide(
                        color: colorScheme.outlineVariant,
                        width: 0.6,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.shadow.withOpacity(0.06),
                        blurRadius: 6,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Page separator with centered title
                      if ((currentPageTitle ?? '').trim().isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            children: [
                              const SizedBox(width: 4),
                              Expanded(
                                child: Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: colorScheme.outlineVariant,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.article_outlined,
                                      size: 16,
                                      color: colorScheme.onSurface.withOpacity(
                                        0.7,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    ConstrainedBox(
                                      constraints: const BoxConstraints(
                                        maxWidth: 220,
                                      ),
                                      child: Text(
                                        currentPageTitle!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.labelMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: colorScheme.onSurface,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: colorScheme.outlineVariant,
                                ),
                              ),
                              const SizedBox(width: 4),
                            ],
                          ),
                        ),
                      // Saving Indicator
                      if (_isSaving)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    colorScheme.primary,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Saving...',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurface.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),

                      // Navigation Buttons
                      Row(
                        children: [
                          if (_currentGroupIndex > 0) ...[
                            Expanded(
                              child: OutlinedButton(
                                onPressed: _isSaving ? null : _previousQuestion,
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.arrow_back, size: 20),
                                    const SizedBox(width: 8),
                                    Text(
                                      _getButtonLabel('Previous'),
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                          ],
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _isSaving
                                  ? null
                                  : (_isCurrentGroupValid()
                                        ? _nextQuestion
                                        : null),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: colorScheme.primary,
                                foregroundColor: colorScheme.onPrimary,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(nextButtonIcon, size: 20),
                                  const SizedBox(width: 8),
                                  Text(
                                    nextButtonLabel,
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (_isSubmitting)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.shadow.withOpacity(0.2),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                colorScheme.primary,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            widget.language.toLowerCase() == 'hi'
                                ? 'प्रसंस्करण...'
                                : 'Processing...',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Focus the input field for the current question
  void _focusCurrentQuestionInput() {
    final questionGroups = _getQuestionGroups();
    if (questionGroups.isEmpty) return;

    if (_currentGroupIndex >= questionGroups.length) return;

    final currentGroup = questionGroups[_currentGroupIndex];
    for (final question in currentGroup.questions) {
      final focusNode = _focusNodes[question.id];
      if (focusNode != null && !focusNode.hasFocus) {
        focusNode.requestFocus();
        break;
      }
    }
  }

  // Log variable values used in evaluator expressions
  void _logVariableValuesForExpression(String expression) {
    debugPrint('Expression: $expression');

    // Use the actual context that will be used for evaluation
    final context = _buildExpressionContext();

    // Debug: Show question key -> raw value mapping
    debugPrint('=== DEBUG: Question key -> raw value mapping ===');
    final allQuestions = _getSortedQuestions();
    for (final question in allQuestions) {
      if (question.key != null && question.key!.isNotEmpty) {
        final answer = _answers[question.id];
        debugPrint('  ${question.key} = $answer');
      }
    }
    debugPrint('=== END DEBUG: Question key -> raw value mapping ===');

    // Find all variable names in the expression
    final variablePattern = RegExp(r'\b[a-zA-Z_][a-zA-Z0-9_]*\b');
    final matches = variablePattern.allMatches(expression);

    final variables = <String>{};
    for (final match in matches) {
      final variable = match.group(0)!;
      // Exclude common programming keywords, operators, and common words
      final excludedWords = {
        'true',
        'false',
        'and',
        'or',
        'not',
        '&&',
        '||',
        '!',
        '>=',
        '<=',
        '>',
        '<',
        '==',
        '!=',
        // Common words that appear in your expressions but aren't variables
        'Agriculture',
        'Dairy',
        'Animal',
        'Husbandry',
        'Daily',
        'Agri',
        'Labour',
        'Non',
        'Allied',
        'Sectors',
        'Aquaculture',
        'Forestry',
        'etc',
        'Any',
        'other',
        'sources',
        'Self',
        'Employed',
        'Salaried',
        'Work',
        'in',
        'an',
        'FPO',
        'Pension',
        'Income',
        'from',
        'social', 'security', 'schemes',
      };

      if (!excludedWords.contains(variable) &&
          !variable.startsWith('"') &&
          !variable.startsWith("'") &&
          variable.length > 1) {
        // Exclude single characters like operators
        variables.add(variable);
      }
    }

    if (variables.isEmpty) {
      debugPrint('  No variables found in expression');
      return;
    }

    debugPrint('  Variables found (after conversion to evaluation context):');

    for (final variable in variables) {
      final value = context[variable];

      String valueStr;

      if (value == null) {
        valueStr = 'null (unanswered) (will be treated as: 0)';
      } else if (value is String) {
        if (value.isEmpty) {
          valueStr = '"" (empty string, will be treated as 0)';
        } else {
          valueStr = '"$value"';
        }
      } else if (value is num) {
        valueStr = value.toString();
      } else if (value is bool) {
        valueStr = value.toString();
      } else {
        valueStr = value.toString();
      }

      debugPrint('    $variable = $valueStr');
    }

    debugPrint(
      'Note: For numeric questions, null values are treated as 0 in evaluation',
    );
    debugPrint(
      'Note: For RADIO/DROPDOWN/CHECKBOX questions, option IDs are converted to option text values',
    );
  }

  // Get or create focus node for other option text fields
  FocusNode getOtherOptionFocusNode(String questionId, String optionId) {
    final key = '${questionId}_${optionId}_other';
    if (!_focusNodes.containsKey(key)) {
      _focusNodes[key] = FocusNode();
    }
    return _focusNodes[key]!;
  }
}
