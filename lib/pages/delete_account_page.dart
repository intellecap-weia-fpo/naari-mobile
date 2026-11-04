import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config.dart';
import '../services/auth_service.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  final _password = TextEditingController();
  bool _deleting = false;
  String? _error;

  @override
  void dispose() {
    _password.dispose();
    super.dispose();
  }

  Future<void> _delete() async {
    if (_password.text.isEmpty) {
      setState(() => _error = 'Enter your current password.');
      return;
    }
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permanently delete account?'),
        content: Text(
          'Your account in ${Config.workspaceName} and the survey responses '
          'submitted by this account will be permanently deleted. '
          'This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete Account'),
          ),
        ],
      ),
    );
    if (!mounted || confirmed != true) return;
    setState(() {
      _deleting = true;
      _error = null;
    });
    try {
      await AuthService.instance.deleteAccount(_password.text);
      if (!mounted) return;
      context.go('/');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Your account has been permanently deleted.'),
        ),
      );
    } on AccountDeletionException catch (e) {
      if (mounted) setState(() => _error = e.message);
    } finally {
      if (mounted) setState(() => _deleting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return PopScope(
      canPop: !_deleting,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Delete Account'),
          automaticallyImplyLeading: !_deleting,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Delete your ${Config.workspaceName} account',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              const Text(
                'This permanently deletes your login, profile, survey responses '
                'submitted by this account, and their photos and signatures. '
                'Downloaded surveys, local drafts, and pending uploads on this '
                'device will also be removed. Unsynced work will be lost.\n\n'
                'Shared survey definitions and responses submitted by other '
                'people remain in the workspace without your account as creator. '
                'Accounts in other workspaces are separate.\n\n'
                'You need an internet connection and your current password. '
                'There is no recovery period.',
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _password,
                enabled: !_deleting,
                obscureText: true,
                autocorrect: false,
                enableSuggestions: false,
                decoration: const InputDecoration(
                  labelText: 'Current password',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (_) {
                  if (!_deleting) _delete();
                },
              ),
              if (_error != null) ...[
                const SizedBox(height: 16),
                Text(_error!, style: TextStyle(color: colors.error)),
              ],
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _deleting ? null : _delete,
                style: FilledButton.styleFrom(backgroundColor: colors.error),
                icon: _deleting
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.delete_forever_outlined),
                label: Text(
                  _deleting ? 'Deleting…' : 'Delete Account Permanently',
                ),
              ),
              TextButton(
                onPressed: _deleting
                    ? null
                    : () => context.push('/privacy-policy'),
                child: const Text('Privacy Policy'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
