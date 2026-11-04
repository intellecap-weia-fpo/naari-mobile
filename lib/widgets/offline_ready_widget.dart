import 'package:flutter/material.dart';
import '../graphql/queries/surveys.graphql.dart';
import '../services/connectivity_service.dart';
import '../services/offline_download_manager.dart';
import '../services/offline_survey_service.dart';
import 'offline_download_bottom_sheet.dart';

/// Widget to display offline readiness status and download progress
class OfflineReadyWidget extends StatefulWidget {
  final bool showCard;
  final VoidCallback? onRefresh;
  final List<Query$AccessibleSurveys$accessibleSurveys$edges$node>? surveys;

  const OfflineReadyWidget({
    super.key,
    this.showCard = true,
    this.onRefresh,
    this.surveys,
  });

  @override
  State<OfflineReadyWidget> createState() => _OfflineReadyWidgetState();
}

class _OfflineReadyWidgetState extends State<OfflineReadyWidget> {
  bool _hasUpdates = false;
  bool _isChecking = false;

  @override
  void initState() {
    super.initState();
    _checkForUpdates();
  }

  @override
  void didUpdateWidget(OfflineReadyWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Re-check when surveys change
    if (widget.surveys != oldWidget.surveys &&
        widget.surveys != null &&
        widget.surveys!.isNotEmpty) {
      _checkForUpdates();
    }
  }

  Future<void> _checkForUpdates() async {
    if (_isChecking) return;
    if (!ConnectivityService.instance.isOnline) return;
    if (widget.surveys == null || widget.surveys!.isEmpty) return;

    setState(() => _isChecking = true);

    try {
      final outdated = await OfflineSurveyService.instance
          .getOutdatedSurveyTitles(widget.surveys!);

      if (mounted) {
        setState(() {
          _hasUpdates = outdated.isNotEmpty;
          _isChecking = false;
        });
      }

      // Auto-download if cache is older than 24 hours
      await _autoDownloadIfStale();
    } catch (e) {
      if (mounted) {
        setState(() => _isChecking = false);
      }
    }
  }

  Future<void> _autoDownloadIfStale() async {
    if (!_hasUpdates) return;

    final lastDownload = OfflineDownloadManager.instance.lastDownloadAt;
    if (lastDownload == null) return;

    final hoursSinceDownload = DateTime.now().difference(lastDownload).inHours;
    if (hoursSinceDownload < 24) return;

    debugPrint(
      'OfflineReadyWidget: Cache is ${hoursSinceDownload}h old, auto-downloading...',
    );

    final success = await OfflineDownloadManager.instance.downloadAllSurveys(
      forceRefresh: true,
    );

    if (success && mounted) {
      setState(() => _hasUpdates = false);
      widget.onRefresh?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        OfflineDownloadManager.instance,
        ConnectivityService.instance,
      ]),
      builder: (context, _) {
        final downloadManager = OfflineDownloadManager.instance;
        final connectivity = ConnectivityService.instance;
        final progress = downloadManager.currentProgress;

        if (widget.showCard) {
          return _buildCard(context, progress, connectivity.isOnline);
        }
        return _buildCompact(context, progress, connectivity.isOnline);
      },
    );
  }

  Widget _buildCard(
    BuildContext context,
    OfflineDownloadProgress progress,
    bool isOnline,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Color backgroundColor;
    Color iconColor;
    IconData icon;
    String title;
    String subtitle;
    Widget? action;

    switch (progress.status) {
      case OfflineDownloadStatus.idle:
        if (_hasUpdates) {
          backgroundColor = Colors.orange.shade50;
          iconColor = Colors.orange.shade700;
          icon = Icons.system_update_outlined;
          title = 'Update Available';
          subtitle = 'New version available. Tap refresh to update.';
          if (isOnline) {
            action = _buildRefreshButton(context, colorScheme, isUpdate: true);
          }
        } else {
          backgroundColor = colorScheme.surfaceVariant;
          iconColor = colorScheme.onSurfaceVariant;
          icon = Icons.cloud_download_outlined;
          title = 'Download for Offline';
          subtitle = 'Download surveys to use offline';
          if (isOnline) {
            action = _buildDownloadButton(context, colorScheme);
          }
        }
        break;

      case OfflineDownloadStatus.downloading:
        backgroundColor = colorScheme.primaryContainer;
        iconColor = colorScheme.primary;
        icon = Icons.cloud_download;
        title = 'Downloading...';
        subtitle =
            progress.currentDetail ??
            progress.currentSurveyTitle ??
            '${progress.downloadedSurveys}/${progress.totalSurveys} surveys';
        action = _buildProgressIndicator(progress, colorScheme);
        break;

      case OfflineDownloadStatus.completed:
        if (_hasUpdates) {
          backgroundColor = Colors.orange.shade50;
          iconColor = Colors.orange.shade700;
          icon = Icons.system_update_outlined;
          title = 'Update Available';
          subtitle = 'New version available. Tap refresh to update.';
          if (isOnline) {
            action = _buildRefreshButton(context, colorScheme, isUpdate: true);
          }
        } else {
          backgroundColor = Colors.green.shade50;
          iconColor = Colors.green.shade700;
          icon = Icons.cloud_done;
          title = 'Ready for Offline';
          subtitle = OfflineDownloadManager.instance.getStatusMessage();
          if (isOnline) {
            action = _buildRefreshButton(context, colorScheme);
          }
        }
        break;

      case OfflineDownloadStatus.failed:
        backgroundColor = colorScheme.errorContainer;
        iconColor = colorScheme.error;
        icon = Icons.cloud_off;
        title = 'Download Failed';
        subtitle = progress.errorMessage ?? 'Please try again';
        if (isOnline) {
          action = _buildRetryButton(context, colorScheme);
        }
        break;

      case OfflineDownloadStatus.cancelled:
        backgroundColor = colorScheme.surfaceVariant;
        iconColor = colorScheme.onSurfaceVariant;
        icon = Icons.cloud_off;
        title = 'Download Cancelled';
        subtitle = 'Tap to resume';
        if (isOnline) {
          action = _buildDownloadButton(context, colorScheme);
        }
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: iconColor.withOpacity(0.2), width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap:
              progress.status == OfflineDownloadStatus.idle ||
                  progress.status == OfflineDownloadStatus.cancelled ||
                  progress.status == OfflineDownloadStatus.failed
              ? () => _startDownload(context)
              : null,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: progress.status == OfflineDownloadStatus.downloading
                      ? SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation(iconColor),
                            value: progress.totalItems > 0
                                ? progress.downloadedItems / progress.totalItems
                                : null,
                          ),
                        )
                      : Icon(icon, color: iconColor, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: iconColor,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: iconColor.withOpacity(0.8),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (progress.status ==
                          OfflineDownloadStatus.downloading) ...[
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: progress.totalItems > 0
                                ? progress.downloadedItems / progress.totalItems
                                : null,
                            backgroundColor: iconColor.withOpacity(0.2),
                            valueColor: AlwaysStoppedAnimation(iconColor),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (action != null) ...[const SizedBox(width: 12), action],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompact(
    BuildContext context,
    OfflineDownloadProgress progress,
    bool isOnline,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    Color color;
    IconData icon;
    String tooltip;

    switch (progress.status) {
      case OfflineDownloadStatus.idle:
        color = colorScheme.onSurfaceVariant;
        icon = Icons.cloud_download_outlined;
        tooltip = 'Download for offline';
        break;

      case OfflineDownloadStatus.downloading:
        color = colorScheme.primary;
        icon = Icons.cloud_download;
        tooltip = progress.totalItems > 0
            ? 'Downloading ${progress.downloadedItems}/${progress.totalItems}'
            : 'Downloading...';
        break;

      case OfflineDownloadStatus.completed:
        color = Colors.green;
        icon = Icons.cloud_done;
        tooltip = 'Offline ready';
        break;

      case OfflineDownloadStatus.failed:
        color = colorScheme.error;
        icon = Icons.cloud_off;
        tooltip = 'Download failed';
        break;

      case OfflineDownloadStatus.cancelled:
        color = colorScheme.onSurfaceVariant;
        icon = Icons.cloud_off;
        tooltip = 'Download cancelled';
        break;
    }

    Widget indicator;
    if (progress.status == OfflineDownloadStatus.downloading) {
      indicator = SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(color),
          value: progress.totalItems > 0
              ? progress.downloadedItems / progress.totalItems
              : null,
        ),
      );
    } else {
      indicator = Icon(icon, color: color, size: 20);
    }

    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: () => _showOfflineDialog(context),
        borderRadius: BorderRadius.circular(20),
        child: Padding(padding: const EdgeInsets.all(8), child: indicator),
      ),
    );
  }

  Widget _buildDownloadButton(BuildContext context, ColorScheme colorScheme) {
    return IconButton(
      onPressed: () => _startDownload(context),
      icon: Icon(Icons.download, color: colorScheme.primary),
      tooltip: 'Download now',
    );
  }

  Widget _buildRefreshButton(
    BuildContext context,
    ColorScheme colorScheme, {
    bool isUpdate = false,
  }) {
    return IconButton(
      onPressed: () => _startDownload(context, forceRefresh: true),
      icon: Icon(
        isUpdate ? Icons.download : Icons.refresh,
        color: isUpdate ? Colors.orange.shade700 : Colors.green.shade700,
      ),
      tooltip: isUpdate ? 'Update now' : 'Refresh',
    );
  }

  Widget _buildRetryButton(BuildContext context, ColorScheme colorScheme) {
    return IconButton(
      onPressed: () => _startDownload(context),
      icon: Icon(Icons.refresh, color: colorScheme.error),
      tooltip: 'Retry',
    );
  }

  Widget _buildProgressIndicator(
    OfflineDownloadProgress progress,
    ColorScheme colorScheme,
  ) {
    // No cancel button — download should always run to completion
    return const SizedBox.shrink();
  }

  void _startDownload(BuildContext context, {bool forceRefresh = false}) async {
    if (!ConnectivityService.instance.isOnline) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cannot download while offline'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final result = await OfflineDownloadBottomSheet.show(context);

    if (result != null) {
      final surveyId = result['surveyId'] as String;
      final surveyTitle = result['surveyTitle'] as String;
      final languages = result['languages'] as List<String>;

      final success = await OfflineDownloadManager.instance.downloadSurvey(
        surveyId: surveyId,
        surveyTitle: surveyTitle,
        languages: languages,
        forceRefresh: forceRefresh,
      );

      // Show toast if survey was already up-to-date
      if (success &&
          context.mounted &&
          OfflineDownloadManager.instance.errorMessage == 'already_up_to_date') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white, size: 18),
                SizedBox(width: 8),
                Text('Survey is already up-to-date!'),
              ],
            ),
            backgroundColor: Colors.green.shade700,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
          ),
        );
      }

      if (success && mounted) {
        setState(() => _hasUpdates = false);
      }

      widget.onRefresh?.call();
    }
  }

  void _showOfflineDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const OfflineStatusBottomSheet(),
    );
  }
}

/// Bottom sheet showing detailed offline status
class OfflineStatusBottomSheet extends StatelessWidget {
  const OfflineStatusBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ListenableBuilder(
      listenable: Listenable.merge([
        OfflineDownloadManager.instance,
        ConnectivityService.instance,
      ]),
      builder: (context, _) {
        final downloadManager = OfflineDownloadManager.instance;
        final connectivity = ConnectivityService.instance;
        final progress = downloadManager.currentProgress;

        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Icon(
                    progress.status == OfflineDownloadStatus.completed
                        ? Icons.cloud_done
                        : Icons.cloud_download,
                    color: progress.status == OfflineDownloadStatus.completed
                        ? Colors.green
                        : colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Text('Offline Status', style: theme.textTheme.titleLarge),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Status message
              Text(
                downloadManager.getStatusMessage(),
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),

              // Download progress if downloading
              if (progress.status == OfflineDownloadStatus.downloading) ...[
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress.totalItems > 0
                        ? progress.downloadedItems / progress.totalItems
                        : null,
                  ),
                ),
                const SizedBox(height: 8),
                if (progress.currentDetail != null)
                  Text(
                    progress.currentDetail!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                if (progress.totalItems > 0)
                  Text(
                    '${progress.downloadedItems} of ${progress.totalItems} items (${progress.downloadedSurveys}/${progress.totalSurveys} surveys)',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
              ],

              const SizedBox(height: 24),

              // Action buttons
              if (connectivity.isOnline) ...[
                if (progress.status != OfflineDownloadStatus.downloading)
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () async {
                        Navigator.pop(context);
                        final result =
                            await OfflineDownloadBottomSheet.show(context);
                        if (result != null) {
                          final success = await downloadManager.downloadSurvey(
                            surveyId: result['surveyId'] as String,
                            surveyTitle: result['surveyTitle'] as String,
                            languages: result['languages'] as List<String>,
                            forceRefresh: true,
                          );
                          // Show toast if survey was already up-to-date
                          if (success &&
                              context.mounted &&
                              downloadManager.errorMessage == 'already_up_to_date') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Row(
                                  children: [
                                    Icon(Icons.check_circle, color: Colors.white, size: 18),
                                    SizedBox(width: 8),
                                    Text('Survey is already up-to-date!'),
                                  ],
                                ),
                                backgroundColor: Colors.green.shade700,
                                behavior: SnackBarBehavior.floating,
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
                        }
                      },
                      icon: const Icon(Icons.download),
                      label: Text(
                        progress.status == OfflineDownloadStatus.completed
                            ? 'Download Another Survey'
                            : 'Download Survey',
                      ),
                    ),
                  ),
              ] else
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
                      Icon(Icons.wifi_off, color: Colors.orange.shade700),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Connect to internet to download surveys',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.orange.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // Last download info
              if (downloadManager.lastDownloadAt != null) ...[
                const SizedBox(height: 16),
                Text(
                  'Last updated: ${_formatLastDownload(downloadManager.lastDownloadAt!)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  String _formatLastDownload(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes} minutes ago';
    if (diff.inHours < 24) return '${diff.inHours} hours ago';
    return '${diff.inDays} days ago';
  }
}
