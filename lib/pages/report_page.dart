import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../graphql/queries/reports.graphql.dart';
import '../schema.graphql.dart';
import '../services/report_service.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ReportService _reportService = ReportService.instance;

  Query$ReportStatistics$submissionStatistics? _stats;
  List<Query$MySurveysReport$mySurveys$edges$node> _mySurveys = [];
  List<Query$MySubmissionsReport$mySubmissions$edges$node> _mySubmissions = [];

  bool _isLoading = true;
  String? _error;

  bool _isLoadingMore = false;
  bool _hasMoreSubmissions = true;
  String? _submissionsEndCursor;
  final ScrollController _submissionsScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadData();
    _submissionsScrollController.addListener(_onSubmissionsScroll);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _submissionsScrollController.dispose();
    super.dispose();
  }

  void _onSubmissionsScroll() {
    if (_submissionsScrollController.position.pixels >=
            _submissionsScrollController.position.maxScrollExtent - 200 &&
        !_isLoadingMore &&
        _hasMoreSubmissions) {
      _loadMoreSubmissions();
    }
  }

  Future<void> _loadMoreSubmissions() async {
    if (_isLoadingMore || !_hasMoreSubmissions) return;

    setState(() => _isLoadingMore = true);

    try {
      final result = await _reportService.getMySubmissionsReport(
        first: 10,
        after: _submissionsEndCursor,
      );

      setState(() {
        _mySubmissions.addAll(result.submissions);
        _hasMoreSubmissions = result.hasNextPage;
        _submissionsEndCursor = result.endCursor;
        _isLoadingMore = false;
      });
    } catch (e) {
      setState(() => _isLoadingMore = false);
    }
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final futures = <Future>[
        _reportService.getReportStatistics(),
        _reportService.getMySurveysReport(),
        _reportService.getMySubmissionsReport(first: 10),
      ];

      final results = await Future.wait(futures);

      _stats = results[0] as Query$ReportStatistics$submissionStatistics?;
      _mySurveys =
          results[1] as List<Query$MySurveysReport$mySurveys$edges$node>;
      final submissionsResult = results[2] as MySubmissionsResult;
      _mySubmissions = submissionsResult.submissions;
      _hasMoreSubmissions = submissionsResult.hasNextPage;
      _submissionsEndCursor = submissionsResult.endCursor;

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports & Analytics'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          labelPadding: EdgeInsets.zero,
          labelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          tabs: const [
            Tab(icon: Icon(Icons.dashboard), text: 'Overview'),
            Tab(icon: Icon(Icons.assignment), text: 'My Surveys'),
            Tab(icon: Icon(Icons.list_alt), text: 'Submissions'),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, size: 64, color: Colors.red[400]),
                  const SizedBox(height: 16),
                  Text('Error loading data: $_error'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _loadData,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            )
          : TabBarView(
              controller: _tabController,
              children: [
                _buildOverviewTab(),
                _buildMySurveysTab(),
                _buildMySubmissionsTab(),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadData,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatsCards(),
          const SizedBox(height: 24),
          _buildRecentActivity(),
          const SizedBox(height: 24),
          _buildSurveyPerformance(),
        ],
      ),
    );
  }

  Widget _buildStatsCards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Statistics Overview',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final isSmallScreen = constraints.maxWidth < 600;
            return GridView.count(
              crossAxisCount: isSmallScreen ? 2 : 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: isSmallScreen ? 1.2 : 1.5,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _buildStatCard(
                  'Total Submissions',
                  _stats?.totalCount?.toString() ?? '0',
                  Icons.assignment_turned_in,
                  Colors.blue,
                ),
                _buildStatCard(
                  'Completed',
                  _stats?.completedCount?.toString() ?? '0',
                  Icons.check_circle,
                  Colors.green,
                ),
                _buildStatCard(
                  'Pending',
                  _stats?.pendingCount?.toString() ?? '0',
                  Icons.pending,
                  Colors.orange,
                ),
                _buildStatCard(
                  'Drafts',
                  _stats?.draftCount?.toString() ?? '0',
                  Icons.drafts,
                  Colors.grey,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivity() {
    final recentSubmissions = _mySubmissions.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Activity',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        if (recentSubmissions.isEmpty)
          const Card(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Center(child: Text('No recent activity')),
            ),
          )
        else
          ...recentSubmissions.map(
            (submission) => _buildSubmissionCard(submission, compact: true),
          ),
      ],
    );
  }

  Widget _buildSurveyPerformance() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'My Surveys Performance',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Card(
          child: Column(
            children: _mySurveys.isEmpty
                ? [
                    const Padding(
                      padding: EdgeInsets.all(32),
                      child: Text('No surveys created yet'),
                    ),
                  ]
                : _mySurveys.map((survey) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                survey.isActive
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: survey.isActive
                                    ? Colors.green
                                    : Colors.grey,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  survey.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.blue.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${survey.submissionCount ?? 0}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      'responses',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const SizedBox(width: 28),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Created: ${DateFormat('MMM d, y').format(survey.createdAt)}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      'Visibility: ${survey.visibility.name}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider(height: 1),
                        ],
                      ),
                    );
                  }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildMySurveysTab() {
    final activeSurveys = _mySurveys.where((s) => s.isActive).length;
    final totalResponses = _mySurveys.fold<int>(
      0,
      (sum, s) => sum + (s.submissionCount ?? 0),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Surveys Summary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoTile(
                          'Total Surveys',
                          _mySurveys.length.toString(),
                        ),
                      ),
                      Expanded(
                        child: _buildInfoTile(
                          'Active',
                          activeSurveys.toString(),
                        ),
                      ),
                      Expanded(
                        child: _buildInfoTile(
                          'Total Responses',
                          totalResponses.toString(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ..._mySurveys.map((survey) {
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          survey.isActive
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                          color: survey.isActive ? Colors.green : Colors.grey,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            survey.title,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${survey.submissionCount ?? 0}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'responses',
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const SizedBox(width: 28),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Created: ${DateFormat('MMM d, y').format(survey.createdAt)}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Visibility: ${survey.visibility.name}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildMySubmissionsTab() {
    return ListView.builder(
      controller: _submissionsScrollController,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
      itemCount: _mySubmissions.length + (_hasMoreSubmissions ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= _mySubmissions.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final submission = _mySubmissions[index];
        return _buildSubmissionCard(submission);
      },
    );
  }

  Widget _buildSubmissionCard(
    Query$MySubmissionsReport$mySubmissions$edges$node submission, {
    bool compact = false,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final statusColor = _getStatusColor(submission.status);

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: compact ? 12 : 16),
      padding: EdgeInsets.all(compact ? 16 : 20),
      decoration: BoxDecoration(
        color: colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(compact ? 10 : 12),
            decoration: BoxDecoration(
              color: colorScheme.onTertiaryContainer.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getStatusIcon(submission.status),
              color: colorScheme.onTertiaryContainer,
              size: compact ? 20 : 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  submission.survey.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onTertiaryContainer,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  _formatSubmissionTimestamp(submission),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onTertiaryContainer.withValues(
                      alpha: 0.8,
                    ),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              _formatStatusLabel(submission.status),
              style: TextStyle(
                fontSize: 11,
                color: statusColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  String _formatSubmissionTimestamp(
    Query$MySubmissionsReport$mySubmissions$edges$node submission,
  ) {
    final localTime = submission.submittedAt.toLocal();
    final action = submission.status == Enum$SurveySubmissionStatusChoices.DRAFT
        ? 'Draft saved on'
        : 'Submitted on';

    return '$action ${DateFormat('d/M/y h:mm a').format(localTime)}';
  }

  String _formatStatusLabel(Enum$SurveySubmissionStatusChoices? status) {
    final name = status?.name ?? 'UNKNOWN';
    return name[0] + name.substring(1).toLowerCase();
  }

  IconData _getStatusIcon(Enum$SurveySubmissionStatusChoices? status) {
    switch (status?.name) {
      case 'COMPLETED':
        return Icons.check_circle;
      case 'PENDING':
        return Icons.pending;
      case 'DRAFT':
        return Icons.drafts;
      default:
        return Icons.help;
    }
  }

  Color _getStatusColor(Enum$SurveySubmissionStatusChoices? status) {
    switch (status?.name) {
      case 'COMPLETED':
        return Colors.green;
      case 'PENDING':
        return Colors.orange;
      case 'DRAFT':
        return Colors.grey;
      default:
        return Colors.blue;
    }
  }
}
