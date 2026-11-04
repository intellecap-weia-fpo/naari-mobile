import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/auth_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    await AuthService.instance.checkAuthStatus();
    
    // Force redirect after auth check
    if (mounted) {
      final authService = AuthService.instance;
      if (authService.isAuthenticated) {
        context.go('/home/dashboard');
      } else {
        context.go('/');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Icons.how_to_vote,
                size: 40,
                color: colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'NAARI Survey',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 48),
            CircularProgressIndicator(
              color: colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Initializing...',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}