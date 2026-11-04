import '../graphql/queries/surveys.graphql.dart';

class QuestionGroup {
  QuestionGroup({
    required this.pageId,
    required this.groupKey,
    List<Fragment$QuestionFetch>? questions,
  }) : questions = questions ?? <Fragment$QuestionFetch>[];

  final String? pageId;
  final String? groupKey;
  final List<Fragment$QuestionFetch> questions;

  Fragment$QuestionFetch? get firstQuestion =>
      questions.isNotEmpty ? questions.first : null;

  Fragment$QuestionFetch? get lastQuestion =>
      questions.isNotEmpty ? questions.last : null;
}
