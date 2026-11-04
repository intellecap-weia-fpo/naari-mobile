import 'package:flutter/material.dart';

import '../services/offline_storage_service.dart';

class SyncActivityPage extends StatefulWidget {
  const SyncActivityPage({super.key});

  @override
  State<SyncActivityPage> createState() => _SyncActivityPageState();
}

class _SyncActivityPageState extends State<SyncActivityPage> {
  static const int _pageSize = 25;

  final List<SyncLogEntry> _logs = [];
  bool _isLoading = true;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadFirstPage();
  }

  Future<void> _loadFirstPage() async {
    setState(() {
      _isLoading = true;
      _error = null;
      _logs.clear();
      _hasMore = true;
    });

    try {
      final logs = await OfflineStorageService.instance.getSyncLogsPage(
        limit: _pageSize,
      );
      if (!mounted) return;
      setState(() {
        _logs.addAll(logs);
        _hasMore = logs.length == _pageSize;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _loadMore() async {
    if (_isLoadingMore || !_hasMore) return;

    setState(() => _isLoadingMore = true);
    try {
      final logs = await OfflineStorageService.instance.getSyncLogsPage(
        limit: _pageSize,
        offset: _logs.length,
      );
      if (!mounted) return;
      setState(() {
        _logs.addAll(logs);
        _hasMore = logs.length == _pageSize;
        _isLoadingMore = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = e.toString();
        _isLoadingMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Sync Activity')),
      body: RefreshIndicator(
        onRefresh: _loadFirstPage,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
            ? ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  Icon(Icons.error_outline, color: colorScheme.error, size: 48),
                  const SizedBox(height: 12),
                  Text(
                    'Failed to load sync activity',
                    style: theme.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _error!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : _logs.isEmpty
            ? ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  const SizedBox(height: 120),
                  Icon(
                    Icons.list_alt,
                    color: colorScheme.onSurfaceVariant,
                    size: 56,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'No sync activity yet',
                    style: theme.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _logs.length + 1,
                itemBuilder: (context, index) {
                  if (index == _logs.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 24),
                      child: _hasMore
                          ? FilledButton.icon(
                              onPressed: _isLoadingMore ? null : _loadMore,
                              icon: _isLoadingMore
                                  ? const SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Icon(Icons.expand_more),
                              label: Text(
                                _isLoadingMore ? 'Loading...' : 'Load more',
                              ),
                            )
                          : Text(
                              'Showing all ${_logs.length} logs',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                              textAlign: TextAlign.center,
                            ),
                    );
                  }

                  return _SyncLogTile(log: _logs[index]);
                },
              ),
      ),
    );
  }
}

class _SyncLogTile extends StatelessWidget {
  final SyncLogEntry log;

  const _SyncLogTile({required this.log});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final Color color;
    final IconData icon;
    switch (log.status) {
      case SyncStatus.completed:
        color = Colors.green.shade700;
        icon = Icons.check_circle_outline;
        break;
      case SyncStatus.failed:
        color = colorScheme.error;
        icon = Icons.error_outline;
        break;
      case SyncStatus.syncing:
        color = colorScheme.primary;
        icon = Icons.sync;
        break;
      case SyncStatus.pending:
        color = Colors.orange.shade700;
        icon = Icons.schedule;
        break;
    }

    final details = <String>[
      _operationLabel(log.operationType),
      if (log.surveyId != null) 'Survey ${_shortId(log.surveyId!)}',
      if (log.localId != null) 'Local ${_shortId(log.localId!)}',
      if (log.serverSubmissionId != null)
        'Submission ${_shortId(log.serverSubmissionId!)}',
      if (log.questionId != null) 'Question ${_shortId(log.questionId!)}',
      _formatDateTime(log.createdAt),
    ].join(' • ');

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.22)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  log.message,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  details,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _operationLabel(String operationType) {
    switch (operationType) {
      case 'surveySubmission':
      case 'submitSurvey':
        return 'Survey submission';
      case 'draftSubmission':
        return 'Draft submission';
      case 'draftAnswer':
      case 'saveAnswer':
      case 'answer':
      case 'answerRecovery':
        return 'Answer sync';
      case 'uploadSignature':
        return 'Signature upload';
      case 'uploadPhoto':
        return 'Photo upload';
      case 'testSeed':
        return 'Test seed';
      default:
        return operationType;
    }
  }

  String _shortId(String value) {
    if (value.length <= 8) return value;
    return value.substring(0, 8);
  }

  String _formatDateTime(DateTime value) {
    final local = value.toLocal();
    final date =
        '${local.day.toString().padLeft(2, '0')}/${local.month.toString().padLeft(2, '0')}/${local.year}';
    final time =
        '${local.hour.toString().padLeft(2, '0')}:${local.minute.toString().padLeft(2, '0')}';
    return '$date $time';
  }
}
