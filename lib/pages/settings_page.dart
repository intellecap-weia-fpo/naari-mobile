import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/auth_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final AuthService _authService = AuthService.instance;
  bool _isLoggingOut = false;

  Future<void> _logout() async {
    final action = await _showLogoutDialog();
    if (!mounted || action == null || action == 'cancel') return;

    setState(() => _isLoggingOut = true);

    try {
      await _authService.signOut();
      if (mounted) {
        context.go('/');
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoggingOut = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error signing out: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Future<String?> _showLogoutDialog() {
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign out?'),
        content: const Text(
          'All locally stored data may be lost from this device after sign out. Make sure everything important is synced before signing out.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'cancel'),
            child: const Text('Cancel'),
          ),
          FilledButton.icon(
            onPressed: () => Navigator.pop(context, 'logout'),
            icon: const Icon(Icons.logout),
            label: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = _authService.user;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: colorScheme.primary,
                          child: Text(
                            user?.username?.substring(0, 1).toUpperCase() ?? 'U',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${user?.firstName ?? ''} ${user?.lastName ?? ''}'.trim().isEmpty 
                                    ? user?.username ?? 'Unknown User'
                                    : '${user?.firstName ?? ''} ${user?.lastName ?? ''}'.trim(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (user?.username != null) ...[
                                const SizedBox(height: 4),
                                Text(
                                  '@${user!.username}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 16),
                    
                    // User Details
                    if (user?.email != null) ...[
                      _buildInfoRow(
                        icon: Icons.email_outlined,
                        label: 'Email',
                        value: user!.email!,
                      ),
                      const SizedBox(height: 12),
                    ],
                    
                    if (user?.username != null) ...[
                      _buildInfoRow(
                        icon: Icons.person_outline,
                        label: 'Username',
                        value: user!.username!,
                      ),
                      const SizedBox(height: 12),
                    ],
                    
                    _buildInfoRow(
                      icon: Icons.admin_panel_settings_outlined,
                      label: 'Account Type',
                      value: user?.isStaff == true ? 'Staff' : 'User',
                    ),
                    const SizedBox(height: 12),
                    
                    _buildInfoRow(
                      icon: Icons.verified_user_outlined,
                      label: 'Status',
                      value: user?.isActive == true ? 'Active' : 'Inactive',
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Change Password Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  context.push('/home/settings/change-password');
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.password),
                label: const Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Logout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isLoggingOut ? null : _logout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.error,
                  foregroundColor: colorScheme.onError,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: _isLoggingOut 
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colorScheme.onError,
                        ),
                      )
                    : const Icon(Icons.logout),
                label: Text(
                  _isLoggingOut ? 'Signing Out...' : 'Sign Out',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.privacy_tip_outlined),
              title: const Text('Privacy Policy'),
              trailing: const Icon(Icons.chevron_right),
              onTap: _isLoggingOut
                  ? null
                  : () => context.push('/privacy-policy'),
            ),
            ListTile(
              leading: Icon(
                Icons.delete_forever_outlined,
                color: colorScheme.error,
              ),
              title: Text(
                'Delete Account',
                style: TextStyle(color: colorScheme.error),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: _isLoggingOut
                  ? null
                  : () => context.push('/home/settings/delete-account'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
