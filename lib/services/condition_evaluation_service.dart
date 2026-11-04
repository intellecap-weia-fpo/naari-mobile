import '../graphql/queries/surveys.graphql.dart';
import '../schema.graphql.dart';

class ConditionEvaluationService {
  /// Evaluate all conditions for a question
  static bool evaluateConditions({
    required List<Fragment$QuestionFetch$conditions?> conditions,
    required Map<String, dynamic> answers,
    required Query$Survey$survey? survey,
  }) {
    if (conditions.isEmpty) return true;

    bool finalResult = false;
    bool hasConditions = false;

    for (final condition in conditions) {
      if (condition == null) continue;

      hasConditions = true;
      final conditionResult = _evaluateSingleCondition(
        condition: condition,
        answers: answers,
        survey: survey,
      );

      // For AND logic, all conditions must be true
      if (condition.logicOperator ==
          Enum$SurveyQuestionConditionLogicOperatorChoices.AND) {
        if (!conditionResult) return false; // Early exit for AND failure
        finalResult = true;
      }
      // For OR logic, at least one condition must be true
      else if (condition.logicOperator ==
          Enum$SurveyQuestionConditionLogicOperatorChoices.OR) {
        if (conditionResult) return true; // Early exit for OR success
        finalResult = finalResult || conditionResult;
      }
    }

    return hasConditions ? finalResult : true;
  }

  /// Evaluate a single condition
  static bool _evaluateSingleCondition({
    required Fragment$QuestionFetch$conditions condition,
    required Map<String, dynamic> answers,
    required Query$Survey$survey? survey,
  }) {
    final targetQuestionId = condition.targetQuestion?.id;
    if (targetQuestionId == null) return false;

    // Get the answer for the target question
    final targetAnswer = answers[targetQuestionId];
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
        return _equalsCondition(targetAnswer, conditionValue, survey);
      case Enum$SurveyQuestionConditionConditionTypeChoices.NOT_EQUALS:
        return !_equalsCondition(targetAnswer, conditionValue, survey);
      case Enum$SurveyQuestionConditionConditionTypeChoices.CONTAINS:
        return _containsCondition(targetAnswer, conditionValue, survey);
      case Enum$SurveyQuestionConditionConditionTypeChoices.NOT_CONTAINS:
        return !_containsCondition(targetAnswer, conditionValue, survey);
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

  static bool _equalsCondition(
    dynamic targetAnswer,
    String? conditionValue,
    Query$Survey$survey? survey,
  ) {
    if (targetAnswer is String) {
      // For radio/dropdown questions, targetAnswer is the option ID
      // We need to get the actual option text to compare with conditionValue
      if (survey != null) {
        // Search for the option with this ID and get its text
        for (final question in _getAllQuestions(survey)) {
          for (final optionEdge in question.options.edges) {
            final option = optionEdge?.node;
            if (option?.id == targetAnswer) {
              // Use localized text if available, fallback to original text
              final effectiveText = option?.localizedText ?? option?.text;
              return _stringEquals(effectiveText, conditionValue);
            }
          }
        }
      }
      return targetAnswer == conditionValue;
    } else if (targetAnswer is List<String>) {
      // For checkbox questions, targetAnswer is a list of option IDs
      // We need to check if any of the selected options matches the conditionValue
      if (survey != null) {
        for (final optionId in targetAnswer) {
          for (final question in _getAllQuestions(survey)) {
            for (final optionEdge in question.options.edges) {
              final option = optionEdge?.node;
              if (option?.id == optionId) {
                // Use localized text if available, fallback to original text
              final effectiveText = option?.localizedText ?? option?.text;
                if (_stringEquals(effectiveText, conditionValue)) {
                  return true;
                }
              }
            }
          }
        }
      }
      return targetAnswer.contains(conditionValue);
    }
    return false;
  }

  static bool _containsCondition(
    dynamic targetAnswer,
    String? conditionValue,
    Query$Survey$survey? survey,
  ) {
    if (targetAnswer is String && conditionValue != null) {
      // For radio/dropdown questions, targetAnswer is the option ID
      // We need to get the actual option text to check for containment
      if (survey != null) {
        // Search for the option with this ID and get its text
        for (final question in _getAllQuestions(survey)) {
          for (final optionEdge in question.options.edges) {
            final option = optionEdge?.node;
            if (option?.id == targetAnswer) {
              // Use localized text if available, fallback to original text
              final effectiveText = option?.localizedText ?? option?.text;
              return _stringContains(effectiveText, conditionValue);
            }
          }
        }
      }
      return targetAnswer.contains(conditionValue);
    }
    return false;
  }

  static bool _greaterThanCondition(
    dynamic targetAnswer,
    String? conditionValue,
  ) {
    if (targetAnswer is num && conditionValue != null) {
      final numValue = num.tryParse(conditionValue);
      return numValue != null && targetAnswer > numValue;
    }
    return false;
  }

  static bool _lessThanCondition(dynamic targetAnswer, String? conditionValue) {
    if (targetAnswer is num && conditionValue != null) {
      final numValue = num.tryParse(conditionValue);
      return numValue != null && targetAnswer < numValue;
    }
    return false;
  }

  static bool _isEmptyCondition(dynamic targetAnswer) {
    if (targetAnswer is String) {
      // For option-based questions, an empty string means no selection
      return targetAnswer.isEmpty;
    } else if (targetAnswer is List) {
      // For checkbox questions, empty list means no selection
      return targetAnswer.isEmpty;
    }
    return targetAnswer == null;
  }

  /// Helper method to get all questions from survey
  static List<Fragment$QuestionFetch> _getAllQuestions(
    Query$Survey$survey survey,
  ) {
    if (survey.pages == null) return [];

    final List<Fragment$QuestionFetch> allQuestions = [];

    // Get all pages and sort them by order
    final pages =
        survey.pages.edges
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

    return allQuestions;
  }

  // Helper methods for case-insensitive string comparison
  static bool _stringEquals(String? value1, String? value2) {
    if (value1 == null || value2 == null) return false;
    return value1.toLowerCase() == value2.toLowerCase();
  }

  static bool _stringContains(String? value, String? pattern) {
    if (value == null || pattern == null) return false;
    return value.toLowerCase().contains(pattern.toLowerCase());
  }
}
