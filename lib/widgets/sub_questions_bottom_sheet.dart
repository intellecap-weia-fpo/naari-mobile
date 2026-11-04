import 'package:flutter/material.dart';

import '../graphql/queries/surveys.graphql.dart';
import '../models/survey_mode.dart';
import '../schema.graphql.dart';
import '../services/tts_service.dart';

class SubQuestionsBottomSheet extends StatefulWidget {
  final List<Fragment$QuestionFetch$options$edges$node$subQuestions?>
  subQuestions;
  final String language;
  final SurveyMode mode;
  final Map<String, dynamic> initialAnswers;
  final Function(Map<String, dynamic>) onSubmit;
  final String selectedOptionText;

  const SubQuestionsBottomSheet({
    super.key,
    required this.subQuestions,
    required this.language,
    required this.mode,
    required this.initialAnswers,
    required this.onSubmit,
    required this.selectedOptionText,
  });

  @override
  State<SubQuestionsBottomSheet> createState() =>
      _SubQuestionsBottomSheetState();
}

class _SubQuestionsBottomSheetState extends State<SubQuestionsBottomSheet> {
  final Map<String, dynamic> _answers = {};
  final Map<String, TextEditingController> _textControllers = {};
  final _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _answers.addAll(widget.initialAnswers);
    _loadInitialData();
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (final controller in _textControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _loadInitialData() {
    setState(() {
      _isLoading = false;
    });

    if (widget.mode.hasVoice && widget.subQuestions.isNotEmpty) {
      final firstQuestion = widget.subQuestions.first;
      if (firstQuestion != null) {
        _speakQuestion(firstQuestion);
      }
    }
  }

  Future<void> _speakQuestion(
    Fragment$QuestionFetch$options$edges$node$subQuestions question,
  ) async {
    if (!widget.mode.hasVoice) return;

    final questionText = question.localizedText ?? question.text;
    String textToSpeak = questionText;
    final isHindi = widget.language.toLowerCase() == 'hi';

    if (widget.mode.speaksAnswers) {
      textToSpeak = questionText;

      if (question.questionType ==
              Enum$SurveyQuestionQuestionTypeChoices.RADIO ||
          question.questionType ==
              Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX) {
        final options = _effectiveOptionsSub(question);

        if (options.isNotEmpty) {
          final optionsIntro = isHindi ? 'आपके विकल्प हैं' : 'Your options are';
          final optionPrefix = isHindi ? 'विकल्प' : 'Option';
          final optionsText = options
              .map((option) => option.localizedText ?? option.text)
              .join('. $optionPrefix: ');
          textToSpeak =
              '$questionText. $optionsIntro: $optionPrefix: $optionsText';
        }
      }
    }

    await TTSService.instance.speak(textToSpeak);
  }

  bool _areAllRequiredAnswered() {
    for (final question in widget.subQuestions) {
      if (question == null) continue;
      if (!question.isRequired) continue;
      final answer = _answers[question.id];
      switch (question.questionType) {
        case Enum$SurveyQuestionQuestionTypeChoices.RADIO:
        case Enum$SurveyQuestionQuestionTypeChoices.DROPDOWN:
          if (answer == null || (answer is String && answer.isEmpty)) {
            return false;
          }
          break;
        case Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX:
          if (answer == null || (answer is List && answer.isEmpty)) {
            return false;
          }
          break;
        case Enum$SurveyQuestionQuestionTypeChoices.TEXT:
        case Enum$SurveyQuestionQuestionTypeChoices.TEXTAREA:
        case Enum$SurveyQuestionQuestionTypeChoices.EMAIL:
        case Enum$SurveyQuestionQuestionTypeChoices.NUMBER:
        default:
          if (answer == null || (answer is String && answer.trim().isEmpty)) {
            return false;
          }
      }
    }
    return true;
  }

  void _submitAnswers() {
    if (!_formKey.currentState!.validate()) return;
    if (!_areAllRequiredAnswered()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please answer all required questions.')),
      );
      return;
    }

    widget.onSubmit(_answers);
    Navigator.of(context).pop();
  }

  String getLocalizedText(String? localizedText, String fallbackText) {
    final isHindi = widget.language.toLowerCase() == 'hi';
    if (isHindi && localizedText != null && localizedText.trim().isNotEmpty) {
      return localizedText;
    }
    return fallbackText;
  }

  // Compute effective options for a sub-question, applying filterOptionsQuestion if set
  List<
          Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node>
      _effectiveOptionsSub(
    Fragment$QuestionFetch$options$edges$node$subQuestions question,
  ) {
    final baseOptions = question.options.edges
        .where((edge) => edge?.node != null)
        .map((edge) => edge!.node!)
        .toList()
      ..sort((a, b) => a.order.compareTo(b.order));

    final filterRef = question.filterOptionsQuestion;
    if (filterRef == null) {
      // Apply option-level conditions, if any
      return baseOptions
          .where((opt) => _isOptionVisibleSub(opt))
          .toList()
        ..sort((a, b) => a.order.compareTo(b.order));
    }

    // Find referenced sub-question in this bottom sheet
    Fragment$QuestionFetch$options$edges$node$subQuestions? refQ;
    for (final q in widget.subQuestions) {
      if (q?.id == filterRef.id) {
        refQ = q;
        break;
      }
    }
    if (refQ == null) {
      return baseOptions
          .where((opt) => _isOptionVisibleSub(opt))
          .toList()
        ..sort((a, b) => a.order.compareTo(b.order));
    }

    // Get selected option ids from the referenced answer map within this sheet
    final srcAns = _answers[refQ.id];
    final List<String> selectedIds = [];
    if (srcAns is String && srcAns.isNotEmpty) {
      selectedIds.add(srcAns);
    } else if (srcAns is List<String>) {
      selectedIds.addAll(srcAns);
    } else {
      return [];
    }

    // Build set of selected option texts from ref question
    final Set<String> selectedTexts = {};
    for (final e in refQ.options.edges) {
      final opt = e?.node;
      if (opt == null) continue;
      if (selectedIds.contains(opt.id)) {
        // Use localized text if available, fallback to original text
        final effectiveText = opt.localizedText ?? opt.text;
        selectedTexts.add(effectiveText.trim().toLowerCase());
      }
    }
    if (selectedTexts.isEmpty) return [];

    final filteredByMap = baseOptions
        .where(
          (opt) {
            // Use localized text if available, fallback to original text
            final effectiveText = opt.localizedText ?? opt.text;
            return selectedTexts.contains(effectiveText.trim().toLowerCase());
          },
        )
        .toList();

    // Apply option-level conditions
    final finalOptions = filteredByMap
        .where((opt) => _isOptionVisibleSub(opt))
        .toList()
      ..sort((a, b) => a.order.compareTo(b.order));

    return finalOptions;
  }

  bool _isOptionVisibleSub(
    Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node
        option,
  ) {
    final conditions = option.conditions;
    if (conditions == null || conditions.isEmpty) return true;
    return _evaluateOptionConditionsSub(conditions);
  }

  bool _evaluateOptionConditionsSub(
    List<
            Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions?>
        conditions,
  ) {
    if (conditions.isEmpty) return true;

    bool finalResult = false;
    bool hasConditions = false;

    for (final condition in conditions) {
      if (condition == null) continue;
      hasConditions = true;
      final conditionResult = _evaluateSingleOptionConditionSub(condition);

      if (condition.logicOperator ==
          Enum$SurveyOptionConditionLogicOperatorChoices.AND) {
        if (!conditionResult) return false;
        finalResult = true;
      } else if (condition.logicOperator ==
          Enum$SurveyOptionConditionLogicOperatorChoices.OR) {
        if (conditionResult) return true;
        finalResult = finalResult || conditionResult;
      }
    }

    return hasConditions ? finalResult : true;
  }

  bool _evaluateSingleOptionConditionSub(
    Fragment$QuestionFetch$options$edges$node$subQuestions$options$edges$node$conditions
        condition,
  ) {
    final targetQuestionId = condition.targetQuestion.id;
    final targetAnswer = _answers[targetQuestionId];

    if (targetAnswer == null) {
      return condition.conditionType ==
          Enum$SurveyOptionConditionConditionTypeChoices.IS_EMPTY;
    }

    switch (condition.conditionType) {
      case Enum$SurveyOptionConditionConditionTypeChoices.EQUALS:
        return _equalsConditionSub(targetAnswer, condition.value);
      case Enum$SurveyOptionConditionConditionTypeChoices.NOT_EQUALS:
        return !_equalsConditionSub(targetAnswer, condition.value);
      case Enum$SurveyOptionConditionConditionTypeChoices.CONTAINS:
        return _containsConditionSub(targetAnswer, condition.value);
      case Enum$SurveyOptionConditionConditionTypeChoices.NOT_CONTAINS:
        return !_containsConditionSub(targetAnswer, condition.value);
      case Enum$SurveyOptionConditionConditionTypeChoices.GREATER_THAN:
        return _greaterThanConditionSub(targetAnswer, condition.value);
      case Enum$SurveyOptionConditionConditionTypeChoices.LESS_THAN:
        return _lessThanConditionSub(targetAnswer, condition.value);
      case Enum$SurveyOptionConditionConditionTypeChoices.IS_EMPTY:
        return _isEmptyConditionSub(targetAnswer);
      case Enum$SurveyOptionConditionConditionTypeChoices.IS_NOT_EMPTY:
        return !_isEmptyConditionSub(targetAnswer);
      default:
        return false;
    }
  }

  bool _equalsConditionSub(dynamic targetAnswer, String? conditionValue) {
    if (targetAnswer is String) {
      // Map option id to text if possible within sub-questions
      for (final q in widget.subQuestions) {
        if (q == null) continue;
        for (final edge in q.options.edges) {
          final opt = edge?.node;
          if (opt?.id == targetAnswer) {
            final optText = opt!.localizedText ?? opt.text;
            return optText == conditionValue;
          }
        }
      }
      return targetAnswer == conditionValue;
    } else if (targetAnswer is List<String>) {
      for (final id in targetAnswer) {
        for (final q in widget.subQuestions) {
          if (q == null) continue;
          for (final edge in q.options.edges) {
            final opt = edge?.node;
            if (opt?.id == id) {
              final optText = opt!.localizedText ?? opt.text;
              if (optText == conditionValue) return true;
            }
          }
        }
      }
      return targetAnswer.contains(conditionValue);
    }
    return false;
  }

  bool _containsConditionSub(dynamic targetAnswer, String? conditionValue) {
    if (targetAnswer is String && conditionValue != null) {
      for (final q in widget.subQuestions) {
        if (q == null) continue;
        for (final edge in q.options.edges) {
          final opt = edge?.node;
          if (opt?.id == targetAnswer) {
            final optText = opt!.localizedText ?? opt.text;
            return optText.contains(conditionValue);
          }
        }
      }
      return targetAnswer.contains(conditionValue);
    }
    return false;
  }

  bool _greaterThanConditionSub(dynamic targetAnswer, String? conditionValue) {
    if (targetAnswer is num && conditionValue != null) {
      final numValue = num.tryParse(conditionValue);
      return numValue != null && targetAnswer > numValue;
    }
    return false;
  }

  bool _lessThanConditionSub(dynamic targetAnswer, String? conditionValue) {
    if (targetAnswer is num && conditionValue != null) {
      final numValue = num.tryParse(conditionValue);
      return numValue != null && targetAnswer < numValue;
    }
    return false;
  }

  bool _isEmptyConditionSub(dynamic targetAnswer) {
    if (targetAnswer is String) return targetAnswer.isEmpty;
    if (targetAnswer is List) return targetAnswer.isEmpty;
    return targetAnswer == null;
  }

  Widget _buildQuestionWidget(
    Fragment$QuestionFetch$options$edges$node$subQuestions question,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    switch (question.questionType) {
      case Enum$SurveyQuestionQuestionTypeChoices.TEXT:
      case Enum$SurveyQuestionQuestionTypeChoices.TEXTAREA:
      case Enum$SurveyQuestionQuestionTypeChoices.EMAIL:
      case Enum$SurveyQuestionQuestionTypeChoices.NUMBER:
        return _buildTextQuestion(question, theme, colorScheme);
      case Enum$SurveyQuestionQuestionTypeChoices.RADIO:
        return _buildRadioQuestion(question, theme, colorScheme);
      case Enum$SurveyQuestionQuestionTypeChoices.CHECKBOX:
        return _buildCheckboxQuestion(question, theme, colorScheme);
      case Enum$SurveyQuestionQuestionTypeChoices.DROPDOWN:
        return _buildDropdownQuestion(question, theme, colorScheme);
      default:
        return _buildTextQuestion(question, theme, colorScheme);
    }
  }

  Widget _buildTextQuestion(
    Fragment$QuestionFetch$options$edges$node$subQuestions question,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    if (!_textControllers.containsKey(question.id)) {
      _textControllers[question.id] = TextEditingController(
        text: _answers[question.id] as String? ?? '',
      );
    }
    final controller = _textControllers[question.id]!;

    final showVoiceInput =
        widget.mode.speaksAnswers;
    final isHindi = widget.language.toLowerCase() == 'hi';

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
                      getLocalizedText(question.localizedText, question.text),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if ((question.hint ?? '').trim().isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          question.hint!,
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
            ],
          ),
          const SizedBox(height: 16),


          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: showVoiceInput
                  ? (isHindi ? 'यहाँ टाइप करें...' : 'Type here...')
                  : (isHindi
                        ? 'अपना उत्तर दर्ज करें...'
                        : 'Enter your answer...'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: colorScheme.surface,
            ),
            maxLines:
                question.questionType ==
                    Enum$SurveyQuestionQuestionTypeChoices.TEXTAREA
                ? 3
                : 1,
            keyboardType:
                question.questionType ==
                    Enum$SurveyQuestionQuestionTypeChoices.EMAIL
                ? TextInputType.emailAddress
                : question.questionType ==
                      Enum$SurveyQuestionQuestionTypeChoices.NUMBER
                ? TextInputType.number
                : TextInputType.text,
            validator: question.isRequired
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
              _answers[question.id] = value;
            },
          ),
        ],
      ),
    );
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
    Fragment$QuestionFetch$options$edges$node$subQuestions question,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    final options = _effectiveOptionsSub(question);
    final isHindi = widget.language.toLowerCase() == 'hi';
    String? selectedOptionId = _getRadioGroupValue(question.id);
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
                      getLocalizedText(question.localizedText, question.text),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    if ((question.hint ?? '').trim().isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          question.hint!,
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
            ],
          ),
          const SizedBox(height: 16),

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
                isHindi ? 'कोई विकल्प उपलब्ध नहीं' : 'No options available',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.6),
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            )
          else
            ...options.map(
              (option) => GestureDetector(
                onTap: () {
                  if (widget.mode.speaksAnswers) {
                    final optionText = getLocalizedText(
                      option.localizedText,
                      option.text,
                    );
                    TTSService.instance.speak(optionText);
                  }
                },
                child: RadioListTile<String>(
                  title: Text(
                    getLocalizedText(option.localizedText, option.text),
                  ),
                  value: option.id,
                  groupValue: selectedOptionId,
                  onChanged: (value) {
                    setState(() {
                      _answers[question.id] = value;
                    });

                    if (widget.mode.speaksAnswers) {
                      final selectedText = isHindi ? 'चयनित' : 'Selected';
                      final optionText = getLocalizedText(
                        option.localizedText,
                        option.text,
                      );
                      TTSService.instance.speak('$selectedText: $optionText');
                    }
                  },
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCheckboxQuestion(
    Fragment$QuestionFetch$options$edges$node$subQuestions question,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    final options = _effectiveOptionsSub(question);

    List<String> selectedOptions = _answers[question.id] as List<String>? ?? [];
    final allowedIds = options.map((o) => o.id).toSet();
    final filteredSelected =
        selectedOptions.where((id) => allowedIds.contains(id)).toList();
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
    final isHindi = widget.language.toLowerCase() == 'hi';

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
                child: Text(
                  getLocalizedText(question.localizedText, question.text),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurfaceVariant,
                  ),
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
            ],
          ),
          const SizedBox(height: 16),

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
                isHindi ? 'कोई विकल्प उपलब्ध नहीं' : 'No options available',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.6),
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            )
          else
            ...options.map(
              (option) => GestureDetector(
                onTap: () {
                  if (widget.mode.speaksAnswers) {
                    final optionText = getLocalizedText(
                      option.localizedText,
                      option.text,
                    );
                    TTSService.instance.speak(optionText);
                  }
                },
                child: CheckboxListTile(
                  title: Text(
                    getLocalizedText(option.localizedText, option.text),
                  ),
                  value: selectedOptions.contains(option.id),
                  onChanged: (checked) {
                    setState(() {
                      final currentSelected =
                          _answers[question.id] as List<String>? ?? [];
                      if (checked == true) {
                        _answers[question.id] = [...currentSelected, option.id];
                      } else {
                        _answers[question.id] = currentSelected
                            .where((id) => id != option.id)
                            .toList();
                      }
                    });

                    if (widget.mode.speaksAnswers) {
                      final action = checked == true
                          ? (isHindi ? 'चयनित' : 'Selected')
                          : (isHindi ? 'अचयनित' : 'Deselected');
                      final optionText = getLocalizedText(
                        option.localizedText,
                        option.text,
                      );
                      TTSService.instance.speak('$action: $optionText');
                    }
                  },
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDropdownQuestion(
    Fragment$QuestionFetch$options$edges$node$subQuestions question,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    final options = _effectiveOptionsSub(question);
    String? selectedOptionId = _answers[question.id] as String?;
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

    final isHindi = widget.language.toLowerCase() == 'hi';

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
                child: Text(
                  getLocalizedText(question.localizedText, question.text),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurfaceVariant,
                  ),
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
            ],
          ),
          const SizedBox(height: 16),

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
                isHindi ? 'कोई विकल्प उपलब्ध नहीं' : 'No options available',
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
                hintText: isHindi ? 'विकल्प चुनें...' : 'Select an option...',
              ),
              value: selectedOptionId,
              items: options
                  .map(
                    (option) => DropdownMenuItem<String>(
                      value: option.id,
                      child: GestureDetector(
                        onTap: () {
                          if (widget.mode.speaksAnswers) {
                            final optionText = getLocalizedText(
                              option.localizedText,
                              option.text,
                            );
                            TTSService.instance.speak(optionText);
                          }
                        },
                        child: Text(
                          getLocalizedText(option.localizedText, option.text),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _answers[question.id] = value;
                });

                if (value != null &&
                    (widget.mode.speaksAnswers)) {
                  final selectedOption = options.firstWhere(
                    (option) => option.id == value,
                  );
                  final selectedText = isHindi ? 'चयनित' : 'Selected';
                  final optionText = getLocalizedText(
                    selectedOption.localizedText,
                    selectedOption.text,
                  );
                  TTSService.instance.speak('$selectedText: $optionText');
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isHindi = widget.language.toLowerCase() == 'hi';

    if (_isLoading) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.7,
        padding: const EdgeInsets.all(20),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    if (widget.subQuestions.isEmpty) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            isHindi
                ? 'कोई उप-प्रश्न उपलब्ध नहीं'
                : 'No sub-questions available',
            style: theme.textTheme.bodyLarge,
          ),
        ),
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colorScheme.surfaceVariant,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                // Drag indicator
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: colorScheme.onSurfaceVariant.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),

                // Title only (all questions shown in one page)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.selectedOptionText,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // All sub-questions in one scrollable page
          Expanded(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    for (final q in widget.subQuestions)
                      if (q != null) _buildQuestionWidget(q),
                  ],
                ),
              ),
            ),
          ),

          // Action buttons
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: colorScheme.shadow.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      isHindi ? 'रद्द करें' : 'Cancel',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _submitAnswers,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check_outlined, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          isHindi ? 'जमा करें' : 'Submit',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
