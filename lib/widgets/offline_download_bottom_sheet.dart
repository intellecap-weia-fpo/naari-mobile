import 'package:flutter/material.dart';
import '../services/offline_survey_service.dart';
import '../services/survey_service.dart';
import '../graphql/queries/surveys.graphql.dart';

class OfflineDownloadBottomSheet extends StatefulWidget {
  const OfflineDownloadBottomSheet({super.key});

  static Future<Map<String, dynamic>?> show(BuildContext context) async {
    final surveys =
        await SurveyService.instance.getAccessibleSurveys(first: 100);

    if (surveys.length == 1 && context.mounted) {
      final survey = surveys.first;
      final languages = await showDialog<List<String>>(
        context: context,
        barrierDismissible: false,
        builder: (context) => LanguageSelectionDialog(
          surveyId: survey.id,
          surveyTitle: survey.title,
        ),
      );

      if (languages != null && languages.isNotEmpty) {
        return {
          'surveyId': survey.id,
          'surveyTitle': survey.title,
          'languages': languages,
        };
      }
      return null;
    }

    if (!context.mounted) return null;

    return showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const OfflineDownloadBottomSheet(),
    );
  }

  @override
  State<OfflineDownloadBottomSheet> createState() =>
      _OfflineDownloadBottomSheetState();
}

class _OfflineDownloadBottomSheetState
    extends State<OfflineDownloadBottomSheet> {
  final SurveyService _surveyService = SurveyService.instance;

  List<Query$AccessibleSurveys$accessibleSurveys$edges$node> _surveys = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadSurveys();
  }

  Future<void> _loadSurveys() async {
    try {
      final surveys = await _surveyService.getAccessibleSurveys(first: 100);
      setState(() {
        _surveys = surveys;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _onSurveySelected(
    Query$AccessibleSurveys$accessibleSurveys$edges$node survey,
  ) async {
    final languages = await showDialog<List<String>>(
      context: context,
      barrierDismissible: false,
      builder: (context) => LanguageSelectionDialog(
        surveyId: survey.id,
        surveyTitle: survey.title,
      ),
    );

    if (languages != null && languages.isNotEmpty && mounted) {
      Navigator.of(context).pop({
        'surveyId': survey.id,
        'surveyTitle': survey.title,
        'languages': languages,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Select Survey to Download',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
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
              const Divider(height: 1),
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _error != null
                        ? Center(child: Text('Error: $_error'))
                        : _surveys.isEmpty
                            ? const Center(
                                child: Text('No surveys available'))
                            : ListView.separated(
                                controller: scrollController,
                                itemCount: _surveys.length,
                                separatorBuilder: (_, __) =>
                                    const Divider(height: 1, indent: 16),
                                itemBuilder: (context, index) {
                                  final survey = _surveys[index];
                                  return ListTile(
                                    title: Text(
                                      survey.title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    subtitle: survey.description != null
                                        ? Text(
                                            survey.description!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        : null,
                                    trailing:
                                        const Icon(Icons.chevron_right),
                                    onTap: () =>
                                        _onSurveySelected(survey),
                                  );
                                },
                              ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class LanguageSelectionDialog extends StatefulWidget {
  final String surveyId;
  final String surveyTitle;

  const LanguageSelectionDialog({
    super.key,
    required this.surveyId,
    required this.surveyTitle,
  });

  @override
  State<LanguageSelectionDialog> createState() =>
      _LanguageSelectionDialogState();
}

class _LanguageSelectionDialogState extends State<LanguageSelectionDialog> {
  final OfflineSurveyService _offlineSurveyService =
      OfflineSurveyService.instance;

  List<String> _availableLanguages = [];
  final Set<String> _selectedLanguages = {'en'};
  bool _isLoading = true;

  static const Map<String, String> _languageNames = {
    'en': 'English',
    'hi': 'Hindi',
    'te': 'Telugu',
    'ta': 'Tamil',
    'kn': 'Kannada',
    'ml': 'Malayalam',
    'mr': 'Marathi',
    'bn': 'Bengali',
    'gu': 'Gujarati',
    'or': 'Odia',
    'pa': 'Punjabi',
    'as': 'Assamese',
    'ur': 'Urdu',
  };

  static const List<String> _priorityLanguages = ['en', 'hi', 'te'];

  @override
  void initState() {
    super.initState();
    _loadLanguages();
  }

  Future<void> _loadLanguages() async {
    try {
      final surveyBasic =
          await _offlineSurveyService.getSurveyBasic(widget.surveyId);
      final languages = surveyBasic?.availableLanguages
              ?.where((l) => l != null)
              .map((l) => l!.toLowerCase())
              .toList() ??
          ['en'];

      languages.sort((a, b) {
        final aPriority = _priorityLanguages.indexOf(a);
        final bPriority = _priorityLanguages.indexOf(b);

        if (aPriority != -1 && bPriority != -1) {
          return aPriority.compareTo(bPriority);
        } else if (aPriority != -1) {
          return -1;
        } else if (bPriority != -1) {
          return 1;
        }
        return _getLanguageName(a).compareTo(_getLanguageName(b));
      });

      setState(() {
        _availableLanguages = languages;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _availableLanguages = ['en'];
        _isLoading = false;
      });
    }
  }

  String _getLanguageName(String code) {
    return _languageNames[code.toLowerCase()] ?? code.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: double.maxFinite,
        constraints: const BoxConstraints(maxHeight: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
              child: Column(
                children: [
                  Text(
                    widget.surveyTitle,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Select languages to download',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Flexible(
              child: _isLoading
                  ? const Padding(
                      padding: EdgeInsets.all(32),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: _availableLanguages.length,
                      itemBuilder: (context, index) {
                        final lang = _availableLanguages[index];
                        final isEnglish = lang == 'en';

                        return CheckboxListTile(
                          title: Text(
                            _getLanguageName(lang),
                            style: TextStyle(
                              fontWeight: isEnglish
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          subtitle: isEnglish
                              ? const Text(
                                  'Required',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                )
                              : null,
                          value: _selectedLanguages.contains(lang),
                          onChanged: isEnglish
                              ? null
                              : (checked) {
                                  setState(() {
                                    if (checked == true) {
                                      _selectedLanguages.add(lang);
                                    } else {
                                      _selectedLanguages.remove(lang);
                                    }
                                  });
                                },
                          activeColor: theme.colorScheme.primary,
                        );
                      },
                    ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Back'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: FilledButton.icon(
                      onPressed: _selectedLanguages.isNotEmpty
                          ? () => Navigator.of(context)
                              .pop(_selectedLanguages.toList())
                          : null,
                      icon: const Icon(Icons.download),
                      label: Text(
                        'Download (${_selectedLanguages.length})',
                      ),
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
}
