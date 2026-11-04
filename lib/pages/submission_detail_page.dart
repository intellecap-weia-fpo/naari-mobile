import 'package:flutter/material.dart';

import '../graphql/queries/submissions.graphql.dart';
import '../schema.graphql.dart';
import '../services/submission_service.dart';

class SubmissionDetailPage extends StatefulWidget {
  final String submissionId;

  const SubmissionDetailPage({super.key, required this.submissionId});

  @override
  State<SubmissionDetailPage> createState() => _SubmissionDetailPageState();
}

class _SubmissionDetailPageState extends State<SubmissionDetailPage> {
  Fragment$SubmissionFields? _submission;
  bool _isLoading = true;
  String? _error;
  final Set<String> _expandedPages = {};

  @override
  void initState() {
    super.initState();
    _loadSubmission();
  }

  Future<void> _loadSubmission() async {
    setState(() {
      _isLoading = true;
      _error = null;
      _submission = null;
    });

    try {
      final submission = await SubmissionService.instance.getSubmissionById(
        widget.submissionId,
      );

      if (mounted) {
        setState(() {
          _submission = submission;
          _isLoading = false;
        });
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

  String _getSubmissionStatus() {
    if (_submission?.status == null) return 'Unknown';
    switch (_submission!.status) {
      case Enum$SurveySubmissionStatusChoices.DRAFT:
        return 'Draft';
      case Enum$SurveySubmissionStatusChoices.COMPLETED:
        return 'Completed';
      case Enum$SurveySubmissionStatusChoices.PENDING:
        return 'Pending';
      case Enum$SurveySubmissionStatusChoices.$unknown:
        return 'Unknown';
    }
  }

  bool _isDraft() {
    return _submission?.status == Enum$SurveySubmissionStatusChoices.DRAFT;
  }

  List<Fragment$SubmissionFields$answers$edges$node> _getSortedAnswers() {
    final answers = _submission?.answers.edges
            .where((edge) => edge?.node != null)
            .map((edge) => edge!.node!)
            .toList() ??
        [];

    answers.sort((a, b) {
      final aPageOrder = a.question.page?.order ?? 1 << 30;
      final bPageOrder = b.question.page?.order ?? 1 << 30;
      final pageCompare = aPageOrder.compareTo(bPageOrder);
      if (pageCompare != 0) return pageCompare;

      final aPageId = a.question.page?.id ?? '';
      final bPageId = b.question.page?.id ?? '';
      final pageIdCompare = aPageId.compareTo(bPageId);
      if (pageIdCompare != 0) return pageIdCompare;

      final questionCompare = a.question.order.compareTo(b.question.order);
      if (questionCompare != 0) return questionCompare;

      return a.question.id.compareTo(b.question.id);
    });

    return answers;
  }

  String _getPageTitle(
    Fragment$SubmissionFields$answers$edges$node$question$page? page,
  ) {
    if (page == null) return 'Unassigned Page';

    final localizedTitle = page.localizedTitle?.trim();
    if (localizedTitle != null && localizedTitle.isNotEmpty) {
      return localizedTitle;
    }

    final title = page.title?.trim();
    if (title != null && title.isNotEmpty) {
      return title;
    }

    return 'Page ${page.order}';
  }

  List<Widget> _buildGroupedAnswersList(
    List<Fragment$SubmissionFields$answers$edges$node> answers,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    final widgets = <Widget>[];
    final pageGroups = <String, List<Fragment$SubmissionFields$answers$edges$node>>{};
    final pageOrder = <String, int>{};
    final pageInfo = <String, Fragment$SubmissionFields$answers$edges$node$question$page?>{};

    for (final answer in answers) {
      final page = answer.question.page;
      final pageId = page?.id ?? 'unassigned';

      pageGroups.putIfAbsent(pageId, () => []).add(answer);
      pageOrder[pageId] = page?.order ?? 0;
      pageInfo[pageId] = page;
    }

    final sortedPageIds = pageGroups.keys.toList()
      ..sort((a, b) => pageOrder[a]!.compareTo(pageOrder[b]!));

    for (final pageId in sortedPageIds) {
      final pageAnswers = pageGroups[pageId]!;
      final page = pageInfo[pageId];
      final isExpanded = _expandedPages.contains(pageId);

      widgets.add(
        _buildPageSection(
          pageId: pageId,
          page: page,
          answers: pageAnswers,
          isExpanded: isExpanded,
          theme: theme,
          colorScheme: colorScheme,
        ),
      );
    }

    return widgets;
  }

  Widget _buildPageSection({
    required String pageId,
    required Fragment$SubmissionFields$answers$edges$node$question$page? page,
    required List<Fragment$SubmissionFields$answers$edges$node> answers,
    required bool isExpanded,
    required ThemeData theme,
    required ColorScheme colorScheme,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if (isExpanded) {
                  _expandedPages.remove(pageId);
                } else {
                  _expandedPages.add(pageId);
                }
              });
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  AnimatedRotation(
                    turns: isExpanded ? 0.25 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(
                    Icons.folder_outlined,
                    size: 16,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _getPageTitle(page),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${answers.length}',
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: answers.asMap().entries.map((entry) {
                final index = entry.key;
                final answer = entry.value;
                final isLast = index == answers.length - 1;
                return _buildCompactAnswerRow(
                  answer,
                  index + 1,
                  isLast,
                  theme,
                  colorScheme,
                );
              }).toList(),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactAnswerRow(
    Fragment$SubmissionFields$answers$edges$node answer,
    int sequence,
    bool isLast,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(
                bottom: BorderSide(
                  color: colorScheme.outline.withValues(alpha: 0.06),
                ),
              ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(top: 2, right: 10),
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                '$sequence',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 11,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  answer.question.text,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurface,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 6),
                _buildCompactAnswerContent(answer, theme, colorScheme),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactAnswerContent(
    Fragment$SubmissionFields$answers$edges$node answer,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    if (answer.textAnswer != null) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.08),
          ),
        ),
        child: Text(
          answer.textAnswer!,
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurface,
            height: 1.4,
          ),
        ),
      );
    }

    if (answer.selectedOptions.edges.isNotEmpty) {
      final chips = answer.selectedOptions.edges
          .where((edge) => edge?.node != null)
          .map((edge) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  edge!.node!.text,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ))
          .toList();

      if (answer.otherText != null && answer.otherText!.trim().isNotEmpty) {
        chips.add(Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: colorScheme.tertiaryContainer.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            'Other: ${answer.otherText}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onTertiaryContainer,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ));
      }

      return Wrap(
        spacing: 6,
        runSpacing: 6,
        children: chips,
      );
    }

    return Text(
      '—',
      style: theme.textTheme.bodySmall?.copyWith(
        color: colorScheme.outline,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Loading...')),
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
                  'Failed to load submission',
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
                  onPressed: _loadSubmission,
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (_submission == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Submission')),
        body: const Center(child: Text('Submission not found')),
      );
    }

    final isDraft = _isDraft();
    final statusColor = isDraft ? colorScheme.tertiary : colorScheme.primary;
    final sortedAnswers = _getSortedAnswers();

    return Scaffold(
      appBar: AppBar(title: const Text('Submission Details'), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Submission Header Card
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
                          _submission!.survey.title,
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
                          color: statusColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _getSubmissionStatus(),
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: statusColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 16,
                        color: colorScheme.onPrimaryContainer.withOpacity(0.8),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Submitted on ${_submission!.submittedAt.day}/${_submission!.submittedAt.month}/${_submission!.submittedAt.year}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onPrimaryContainer.withOpacity(
                            0.8,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.quiz_outlined,
                        size: 16,
                        color: colorScheme.onPrimaryContainer.withOpacity(0.8),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${sortedAnswers.length} answers',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onPrimaryContainer.withOpacity(
                            0.8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Answers Section
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.quiz_outlined,
                    color: colorScheme.onSecondaryContainer,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Answers',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Answers List
            if (sortedAnswers.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.quiz_outlined,
                      size: 20,
                      color: colorScheme.outline,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'No answers yet',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              )
            else
              ..._buildGroupedAnswersList(sortedAnswers, theme, colorScheme),
          ],
        ),
      ),
    );
  }
}
