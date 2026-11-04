import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/connectivity_service.dart';
import '../services/sync_manager.dart';
import '../services/offline_storage_service.dart';

/// Widget to display current sync status and pending items
class SyncStatusWidget extends StatelessWidget {
  final bool showLabel;
  final bool compact;
  final VoidCallback? onTap;

  const SyncStatusWidget({
    super.key,
    this.showLabel = true,
    this.compact = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        ConnectivityService.instance,
        SyncManager.instance,
      ]),
      builder: (context, _) {
        final connectivity = ConnectivityService.instance;
        final syncManager = SyncManager.instance;

        final isOnline = connectivity.isOnline;
        final isSyncing = syncManager.isSyncing;
        final pendingCount = syncManager.pendingCount;

        if (compact) {
          return _buildCompactIndicator(
            context,
            isOnline: isOnline,
            isSyncing: isSyncing,
            pendingCount: pendingCount,
          );
        }

        return _buildFullWidget(
          context,
          isOnline: isOnline,
          isSyncing: isSyncing,
          pendingCount: pendingCount,
        );
      },
    );
  }

  Widget _buildCompactIndicator(
    BuildContext context, {
    required bool isOnline,
    required bool isSyncing,
    required int pendingCount,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget indicator;
    Color color;
    String tooltip;

    if (isSyncing) {
      color = colorScheme.primary;
      tooltip = 'Syncing...';
      indicator = SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      );
    } else if (!isOnline && pendingCount > 0) {
      color = colorScheme.error;
      tooltip = 'Offline - $pendingCount pending';
      indicator = Badge(
        label: Text('$pendingCount'),
        child: Icon(Icons.cloud_off, color: color, size: 20),
      );
    } else if (!isOnline) {
      color = Colors.orange;
      tooltip = 'Offline';
      indicator = Icon(Icons.cloud_off, color: color, size: 20);
    } else if (pendingCount > 0) {
      color = colorScheme.tertiary;
      tooltip = '$pendingCount items pending sync';
      indicator = Badge(
        label: Text('$pendingCount'),
        child: Icon(Icons.cloud_upload, color: color, size: 20),
      );
    } else {
      color = Colors.green;
      tooltip = 'Online';
      indicator = Icon(Icons.cloud_done, color: color, size: 20);
    }

    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap ?? () => _showSyncDialog(context),
        borderRadius: BorderRadius.circular(20),
        child: Padding(padding: const EdgeInsets.all(8), child: indicator),
      ),
    );
  }

  Widget _buildFullWidget(
    BuildContext context, {
    required bool isOnline,
    required bool isSyncing,
    required int pendingCount,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final theme = Theme.of(context);

    Color backgroundColor;
    Color iconColor;
    IconData icon;
    String statusText;

    if (isSyncing) {
      backgroundColor = colorScheme.primaryContainer;
      iconColor = colorScheme.primary;
      icon = Icons.sync;
      statusText = 'Syncing...';
    } else if (!isOnline && pendingCount > 0) {
      backgroundColor = colorScheme.errorContainer;
      iconColor = colorScheme.error;
      icon = Icons.cloud_off;
      statusText = 'Offline - $pendingCount pending';
    } else if (!isOnline) {
      backgroundColor = Colors.orange.shade100;
      iconColor = Colors.orange.shade700;
      icon = Icons.cloud_off;
      statusText = 'Offline mode';
    } else if (pendingCount > 0) {
      backgroundColor = colorScheme.tertiaryContainer;
      iconColor = colorScheme.tertiary;
      icon = Icons.cloud_upload;
      statusText = '$pendingCount items to sync';
    } else {
      backgroundColor = Colors.green.shade100;
      iconColor = Colors.green.shade700;
      icon = Icons.cloud_done;
      statusText = 'All synced';
    }

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap ?? () => _showSyncDialog(context),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isSyncing)
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(iconColor),
                  ),
                )
              else
                Icon(icon, color: iconColor, size: 20),
              if (showLabel) ...[
                const SizedBox(width: 8),
                Text(
                  statusText,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: iconColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _showSyncDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const SyncStatusBottomSheet(),
    );
  }
}

/// Bottom sheet showing detailed sync status
class SyncStatusBottomSheet extends StatelessWidget {
  const SyncStatusBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListenableBuilder(
      listenable: Listenable.merge([
        ConnectivityService.instance,
        SyncManager.instance,
      ]),
      builder: (context, _) {
        final connectivity = ConnectivityService.instance;
        final syncManager = SyncManager.instance;

        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.85,
          ),
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Icon(
                    connectivity.isOnline ? Icons.cloud_done : Icons.cloud_off,
                    color: connectivity.isOnline ? Colors.green : Colors.orange,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    connectivity.isOnline ? 'Online' : 'Offline',
                    style: theme.textTheme.titleLarge,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Connection type
              if (connectivity.connectionTypes.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    'Connection: ${connectivity.connectionTypes.map((t) => t.name).join(', ')}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),

              // Pending items
              FutureBuilder<Map<String, int>>(
                future: OfflineStorageService.instance.getStorageStats(),
                builder: (context, snapshot) {
                  final stats = snapshot.data ?? {};

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStatRow(
                        context,
                        'Pending sync',
                        '${stats['pendingTotal'] ?? syncManager.pendingCount} items',
                        Icons.sync,
                      ),
                      if ((stats['failedQueue'] ?? 0) > 0 ||
                          (stats['failedLogs'] ?? 0) > 0)
                        _buildStatRow(
                          context,
                          'Recent failures',
                          '${stats['failedQueue'] ?? 0} queued, ${stats['failedLogs'] ?? 0} logged',
                          Icons.error_outline,
                        ),
                      _buildStatRow(
                        context,
                        'Queue records',
                        '${stats['syncQueue'] ?? 0}',
                        Icons.format_list_bulleted,
                      ),
                      _buildStatRow(
                        context,
                        'Offline-ready surveys',
                        '${stats['cachedSurveys'] ?? 0}',
                        Icons.save,
                      ),
                      _buildStatRow(
                        context,
                        'Offline submissions',
                        '${stats['offlineSubmissions'] ?? 0}',
                        Icons.assignment,
                      ),
                      _buildStatRow(
                        context,
                        'Incomplete drafts',
                        '${stats['draftSubmissions'] ?? 0}',
                        Icons.edit_note,
                      ),
                      _buildStatRow(
                        context,
                        'Pending files',
                        '${stats['pendingFiles'] ?? 0}',
                        Icons.attach_file,
                      ),
                      _buildStatRow(
                        context,
                        'Offline consent',
                        '${stats['offlineConsent'] ?? 0}',
                        Icons.verified_user_outlined,
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 24),

              // Sync button
              if (connectivity.isOnline)
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: syncManager.isSyncing
                        ? null
                        : () async {
                            if (syncManager.pendingCount == 0) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Row(
                                    children: [
                                      Icon(Icons.check_circle, color: Colors.white, size: 18),
                                      SizedBox(width: 8),
                                      Text('Everything is already synced!'),
                                    ],
                                  ),
                                  backgroundColor: Colors.green.shade700,
                                  behavior: SnackBarBehavior.floating,
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                              return;
                            }
                            final result = await syncManager.syncNow();
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  result.hasErrors
                                      ? 'Sync finished with ${result.failureCount} failure(s). Check the log details.'
                                      : result.pendingCount > 0
                                      ? 'Sync paused with ${result.pendingCount} item(s) still pending. Check the log details.'
                                      : 'Sync complete: ${result.successCount} item(s) synced.',
                                ),
                                backgroundColor: result.hasErrors
                                    ? Colors.red.shade700
                                    : Colors.green.shade700,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },
                    icon: syncManager.isSyncing
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.sync),
                    label: Text(
                      syncManager.isSyncing ? 'Syncing...' : 'Sync Now',
                    ),
                  ),
                )
              else
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.orange.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.orange.shade700),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Data will sync automatically when you\'re back online',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.orange.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // Last sync info
              if (syncManager.lastSyncResult != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    'Last sync: ${_formatLastSync(syncManager.lastSyncResult!.syncedAt)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),

              const SizedBox(height: 16),
              FutureBuilder<List<SyncLogEntry>>(
                future: OfflineStorageService.instance.getRecentSyncLogs(
                  limit: 10,
                ),
                builder: (context, snapshot) {
                  final logs = snapshot.data ?? const <SyncLogEntry>[];
                  if (logs.isEmpty) {
                    return Text(
                      'No sync activity logged yet',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recent sync activity',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      for (final log in logs) _buildLogRow(context, log),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton.icon(
                          onPressed: () {
                            final router = GoRouter.of(context);
                            Navigator.pop(context);
                            router.push('/home/sync-activity');
                          },
                          icon: const Icon(Icons.list_alt),
                          label: const Text('Show more'),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLogRow(BuildContext context, SyncLogEntry log) {
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
      _formatLastSync(log.createdAt),
    ].join(' • ');

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.22)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  log.message,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
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
      default:
        return operationType;
    }
  }

  String _shortId(String value) {
    if (value.length <= 8) return value;
    return value.substring(0, 8);
  }

  Widget _buildStatRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: colorScheme.onSurfaceVariant),
          const SizedBox(width: 12),
          Text(label, style: theme.textTheme.bodyMedium),
          const Spacer(),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _formatLastSync(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    return '${diff.inDays}d ago';
  }
}

/// Offline banner shown at top of screen when offline
class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ConnectivityService.instance,
      builder: (context, _) {
        final isOnline = ConnectivityService.instance.isOnline;

        return AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: isOnline
              ? const SizedBox.shrink()
              : Container(
                  width: double.infinity,
                  color: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: const SafeArea(
                    bottom: false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_off, color: Colors.white, size: 16),
                        SizedBox(width: 8),
                        Text(
                          'You\'re offline - Changes will sync when connected',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}

/// Wrapper widget that adds offline support to a screen
class OfflineAwareScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool showSyncStatus;

  const OfflineAwareScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.showSyncStatus = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          const OfflineBanner(),
          Expanded(child: body),
        ],
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
