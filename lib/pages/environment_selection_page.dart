import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../config.dart';
import '../services/auth_service.dart';

class EnvironmentSelectionPage extends StatelessWidget {
  const EnvironmentSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 1),
              
              // Logo/Icon
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    'assets/icon-512.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Select Workspace',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Choose your environment to continue',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 48),

              // Naari Option
              _EnvironmentCard(
                title: 'NAARI',
                icon: Icons.rocket_launch_rounded,
                isSelected: Config.activeEndpointBase == Config.endpointDefault,
                onTap: () async {
                  await AuthService.instance.updateEndpoint(Config.endpointDefault);
                  if (context.mounted) {
                    context.go('/login');
                  }
                },
              ),
              
              const SizedBox(height: 16),

              
              const Spacer(flex: 2),
              TextButton(
                onPressed: () => context.push('/privacy-policy'),
                child: const Text('Privacy Policy'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EnvironmentCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _EnvironmentCard({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? colorScheme.primary : colorScheme.outlineVariant,
              width: isSelected ? 2 : 1,
            ),
            color: isSelected 
                ? colorScheme.primaryContainer.withValues(alpha: 0.3)
                : colorScheme.surface,
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSelected 
                      ? colorScheme.primary 
                      : colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: isSelected 
                      ? colorScheme.onPrimary 
                      : colorScheme.onSurfaceVariant,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: isSelected ? colorScheme.primary : colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle_rounded,
                  color: colorScheme.primary,
                )
              else
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: colorScheme.onSurfaceVariant,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
