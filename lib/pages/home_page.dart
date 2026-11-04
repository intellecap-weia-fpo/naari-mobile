import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../config.dart';
import '../graphql/queries/statistics.graphql.dart';
import '../graphql/queries/surveys.graphql.dart';
import '../services/auth_service.dart';
import '../services/connectivity_service.dart';
import '../services/offline_download_manager.dart';
import '../services/offline_file_storage_service.dart';
import '../services/offline_storage_service.dart';
import '../services/offline_survey_service.dart';
import '../services/offline_sync_test_seed_service.dart';
import '../services/sync_manager.dart';
import '../widgets/app_version_text.dart';
import '../widgets/offline_ready_widget.dart';
import '../widgets/sync_status_widget.dart';

class HomePage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomePage({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        final shouldExit = await _confirmExit(context);
        if (shouldExit == true) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 68,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('NAARI Survey'),
              const SizedBox(height: 2),
              Text(
                'Workspace: ${Config.workspaceName}',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AppVersionText(
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.78),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          actions: [
            const SyncStatusWidget(),
            IconButton(
              tooltip: 'Logout',
              onPressed: () => _handleLogout(context),
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Column(
          children: [
            const OfflineBanner(),
            Expanded(child: navigationShell),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) => navigationShell.goBranch(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleLogout(BuildContext context) async {
    final action = await _showLogoutDialog(context);
    if (!context.mounted || action == null || action == 'cancel') return;

    if (action == 'sync') {
      // User chose to sync first — trigger sync and stay logged in
      SyncManager.instance.syncNow();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Syncing your data... You can logout after sync completes.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      return;
    }

    await AuthService.instance.signOut();
    if (context.mounted) {
      context.go('/');
    }
  }

  Future<String?> _showLogoutDialog(BuildContext context) async {
    final pendingCount = SyncManager.instance.pendingCount;

    // Count local drafts
    int draftCount = 0;
    try {
      final drafts = await OfflineStorageService.instance.getAllDrafts();
      draftCount = drafts.length;
    } catch (_) {}

    final bool hasData = pendingCount > 0 || draftCount > 0;

    // Build warning message
    final warnings = <String>[];
    if (pendingCount > 0) {
      warnings.add('$pendingCount item(s) waiting to sync');
    }
    if (draftCount > 0) {
      warnings.add('$draftCount saved draft(s)');
    }

    final String message;
    if (warnings.isNotEmpty) {
      message =
          'You have ${warnings.join(' and ')}. All locally stored data including drafts, cached surveys, and offline files will be permanently deleted from this device.\n\nSync your data first to avoid losing it, or continue with logout to delete everything.';
    } else {
      message =
          'All locally stored data including cached surveys and offline files will be deleted from this device after logout.';
    }

    if (!context.mounted) return null;

    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout?'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'cancel'),
            child: const Text('Cancel'),
          ),
          if (hasData)
            OutlinedButton.icon(
              onPressed: () => Navigator.pop(context, 'sync'),
              icon: const Icon(Icons.sync),
              label: const Text('Sync First'),
            ),
          FilledButton.icon(
            onPressed: () => Navigator.pop(context, 'logout'),
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            style: FilledButton.styleFrom(
              backgroundColor: hasData ? Theme.of(context).colorScheme.error : null,
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> _confirmExit(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit app?'),
        content: const Text(
          'Are you sure you want to exit? Unsynced offline data will remain on this device until you come back and sync.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Exit'),
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Query$AccessibleSurveys$accessibleSurveys$edges$node>? _surveys;
  Query$SubmissionStatistics$submissionStatistics? _statistics;
  bool _isLoading = true;
  bool _isSeedingOfflineSyncTest = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Load surveys first — this works offline from cache
      await _loadSurveys();

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }

      // Load statistics in background — don't block UI for network calls
      _loadStatistics();
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _loadStatistics() async {
    // Skip statistics if offline
    if (!ConnectivityService.instance.isOnline) {
      return;
    }

    try {
      final client = AuthService.instance.client;
      final result = await client.query$SubmissionStatistics();

      if (!result.hasException &&
          result.parsedData?.submissionStatistics != null) {
        if (mounted) {
          setState(() {
            _statistics = result.parsedData!.submissionStatistics!;
          });
        }
      }
    } catch (e) {
      debugPrint('Failed to load statistics: $e');
    }
  }

  Future<void> _loadSurveys() async {
    try {
      final surveys = await OfflineSurveyService.instance
          .getAccessibleSurveys();

      if (mounted) {
        setState(() {
          _surveys = surveys;
        });
      }
    } catch (e) {
      debugPrint('Failed to load surveys: $e');
      // Don't rethrow, just show empty list or error state
      if (mounted) {
        setState(() {
          _error = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return RefreshIndicator(
        onRefresh: _loadData,
        child: Stack(
          children: [
            ListView(), // Empty ListView to enable pull-to-refresh
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Failed to load surveys',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _loadData,
                          child: const Text('Retry'),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'or pull down',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (_surveys?.isEmpty ?? true) {
      return RefreshIndicator(
        onRefresh: _loadData,
        child: Stack(
          children: [
            ListView(), // Empty ListView to enable pull-to-refresh
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceVariant.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.inbox_outlined,
                        size: 80,
                        color: colorScheme.onSurfaceVariant.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'No Survey Available',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'There are no surveys available at the moment.\nCheck back later or pull down to refresh.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.6),
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    OutlinedButton.icon(
                      onPressed: _loadData,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Refresh'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadData,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Debug-only offline DB controls hidden for now.
          // _OfflineSyncTestButton(
          //   isLoading: _isSeedingOfflineSyncTest,
          //   onPressed: _seedOfflineSyncTestData,
          // ),
          // const SizedBox(height: 8),
          // _ClearOfflineDataButton(onPressed: _clearOfflineData),
          // const SizedBox(height: 16),

          // Offline Ready Status Card
          OfflineReadyWidget(
            showCard: true,
            onRefresh: _loadData,
            surveys: _surveys,
          ),

          // Statistics Section
          if (_statistics != null) ...[
            _StatisticsSection(statistics: _statistics!),
            const SizedBox(height: 24),
          ],

          // Surveys Section
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.assignment_outlined,
                  color: colorScheme.onSecondaryContainer,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Available Surveys',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${_surveys?.length ?? 0}',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Regular Surveys
          ...(_surveys?.map((survey) => SurveyCard(survey: survey)) ?? []),
        ],
      ),
    );
  }

  Future<void> _seedOfflineSyncTestData() async {
    if (_isSeedingOfflineSyncTest) return;

    final submissionCount = await _showOfflineSyncSeedSheet();
    if (!mounted || submissionCount == null) return;

    setState(() {
      _isSeedingOfflineSyncTest = true;
    });

    try {
      final result = await OfflineSyncTestSeedService.instance
          .seedLocalSurveySixOfflineSyncTest(
            submissionCount: submissionCount,
          );

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Created ${result.submissionCount} offline submissions for ${result.surveyTitle}: ${result.answerCount} answers, ${result.fileCount} files, ${result.consentCount} consent rows.',
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green.shade700,
          duration: const Duration(seconds: 5),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create offline sync test data: $e'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Theme.of(context).colorScheme.error,
          duration: const Duration(seconds: 6),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSeedingOfflineSyncTest = false;
        });
      }
    }
  }

  Future<int?> _showOfflineSyncSeedSheet() async {
    return showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      builder: (context) => const _OfflineSyncSeedSheet(),
    );
  }

  Future<void> _clearOfflineData() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear offline data?'),
        content: const Text(
          'This will remove cached surveys, offline submissions, sync queue items, consent rows, sync logs, and pending offline files from this device.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Clear'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      await SyncManager.instance.clearAll();
      await OfflineDownloadManager.instance.resetDownloadState();
      await OfflineFileStorageService.instance.clearAll();

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Offline DB data and files cleared.'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green.shade700,
        ),
      );
      await _loadData();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to clear offline data: $e'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }
}

class _OfflineSyncSeedSheet extends StatefulWidget {
  const _OfflineSyncSeedSheet();

  @override
  State<_OfflineSyncSeedSheet> createState() => _OfflineSyncSeedSheetState();
}

class _OfflineSyncSeedSheetState extends State<_OfflineSyncSeedSheet> {
  late final TextEditingController _controller;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '40');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final value = int.tryParse(_controller.text.trim());
    if (value == null || value <= 0) {
      setState(() {
        _errorText = 'Enter a number greater than 0';
      });
      return;
    }

    Navigator.pop(context, value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.science_outlined, color: colorScheme.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Create offline sync data',
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'How many offline submissions do you want to create for testing?',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Number of submissions',
                hintText: 'Example: 10',
                errorText: _errorText,
                prefixIcon: const Icon(Icons.format_list_numbered),
                border: const OutlineInputBorder(),
              ),
              onSubmitted: (_) => _submit(),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _submit,
                    icon: const Icon(Icons.add),
                    label: const Text('Create'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _OfflineSyncTestButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const _OfflineSyncTestButton({
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: colorScheme.secondaryContainer,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: isLoading ? null : onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              if (isLoading)
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: colorScheme.onSecondaryContainer,
                  ),
                )
              else
                Icon(
                  Icons.science_outlined,
                  color: colorScheme.onSecondaryContainer,
                ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  isLoading
                      ? 'Creating offline sync test records...'
                      : 'Create offline sync test data',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                'Custom',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: colorScheme.onSecondaryContainer,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ClearOfflineDataButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _ClearOfflineDataButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(Icons.delete_outline, color: colorScheme.error),
      label: Text(
        'Clear offline DB data',
        style: theme.textTheme.bodyMedium?.copyWith(
          color: colorScheme.error,
          fontWeight: FontWeight.w700,
        ),
      ),
      style: OutlinedButton.styleFrom(
        alignment: Alignment.centerLeft,
        minimumSize: const Size.fromHeight(48),
        side: BorderSide(color: colorScheme.error.withOpacity(0.45)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

class _StatisticsSection extends StatelessWidget {
  final Query$SubmissionStatistics$submissionStatistics statistics;

  const _StatisticsSection({required this.statistics});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 20),
          child: Text(
            'Overview',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
            ),
          ),
        ),
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 2.0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _StatCard(
              title: 'Total Surveys',
              value: statistics.totalCount?.toString() ?? '0',
              icon: Icons.poll_outlined,
              backgroundColor: colorScheme.primaryContainer,
              iconColor: colorScheme.onPrimaryContainer,
              textColor: colorScheme.onPrimaryContainer,
            ),
            _StatCard(
              title: 'Completed',
              value: statistics.completedCount?.toString() ?? '0',
              icon: Icons.check_circle_outline,
              backgroundColor: colorScheme.secondaryContainer,
              iconColor: colorScheme.onSecondaryContainer,
              textColor: colorScheme.onSecondaryContainer,
            ),
            _StatCard(
              title: 'In Progress',
              value: statistics.pendingCount?.toString() ?? '0',
              icon: Icons.schedule_outlined,
              backgroundColor: colorScheme.tertiaryContainer,
              iconColor: colorScheme.onTertiaryContainer,
              textColor: colorScheme.onTertiaryContainer,
            ),
            _StatCard(
              title: 'Draft',
              value: statistics.draftCount?.toString() ?? '0',
              icon: Icons.drafts_outlined,
              backgroundColor: colorScheme.surfaceVariant,
              iconColor: colorScheme.onSurfaceVariant,
              textColor: colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, size: 20, color: iconColor),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        value,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: textColor,
                          height: 1.0,
                        ),
                      ),
                      Text(
                        title,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: textColor.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SurveyCard extends StatelessWidget {
  final Query$AccessibleSurveys$accessibleSurveys$edges$node survey;

  const SurveyCard({super.key, required this.survey});

  String _formatEndDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = date.difference(now);

      if (difference.isNegative) {
        return 'Expired';
      } else if (difference.inDays == 0) {
        return 'Today';
      } else if (difference.inDays == 1) {
        return 'Tomorrow';
      } else if (difference.inDays <= 7) {
        return '${difference.inDays} days';
      } else {
        return '${date.day}/${date.month}/${date.year}';
      }
    } catch (e) {
      return dateString; // Fallback to original string
    }
  }

  Color _getEndDateColor(String dateString, ColorScheme colorScheme) {
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = date.difference(now);

      if (difference.isNegative) {
        return colorScheme.error;
      } else if (difference.inDays <= 3) {
        return colorScheme.error;
      } else if (difference.inDays <= 7) {
        return colorScheme.tertiary;
      } else {
        return colorScheme.onSurface.withOpacity(0.6);
      }
    } catch (e) {
      return colorScheme.onSurface.withOpacity(0.6); // Fallback color
    }
  }

  bool _isExpiringSoon(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final now = DateTime.now();
      final difference = date.difference(now);
      return !difference.isNegative && difference.inDays <= 3;
    } catch (e) {
      return false; // Fallback to not expiring soon
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.08),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            context.push('/survey/${survey.id}');
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            survey.title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (survey.description != null) ...[
                            const SizedBox(height: 4),
                            Text(
                              survey.description!,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurface.withOpacity(0.7),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: survey.visibility.name == 'PUBLIC'
                            ? colorScheme.primaryContainer
                            : colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        survey.visibility.name,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: survey.visibility.name == 'PUBLIC'
                              ? colorScheme.onPrimaryContainer
                              : colorScheme.onSecondaryContainer,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // End date display
                if (survey.endDate != null) ...[
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 16,
                        color: _getEndDateColor(survey.endDate!, colorScheme),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Ends: ${_formatEndDate(survey.endDate!)}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: _getEndDateColor(survey.endDate!, colorScheme),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (_isExpiringSoon(survey.endDate!)) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.errorContainer,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'Expiring Soon',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.onErrorContainer,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 8),
                ],

                Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 16,
                      color: colorScheme.onSurface.withOpacity(0.6),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      survey.createdBy == null
                          ? 'Deleted account'
                          : '${survey.createdBy?.firstName ?? ''} ${survey.createdBy?.lastName ?? ''}'.trim(),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                    const Spacer(),
                    if (survey.submissionCount != null) ...[
                      Icon(
                        Icons.poll_outlined,
                        size: 16,
                        color: colorScheme.onSurface.withOpacity(0.6),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${survey.submissionCount} responses',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    ],
                    const SizedBox(width: 12),
                    if (survey.hasSubmitted == true)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Completed',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
