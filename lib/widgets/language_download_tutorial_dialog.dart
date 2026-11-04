import 'dart:io';

import 'package:flutter/material.dart';

import '../utils/language_utils.dart';

/// Shows a tutorial dialog for downloading language voice packs
/// with platform-specific instructions for iOS and Android
void showLanguageDownloadTutorial({
  required BuildContext context,
  required String languageCode,
  required VoidCallback onDismiss,
}) {
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    useSafeArea: true,
    isDismissible: true,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Drag handle
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: colorScheme.onSurfaceVariant.withOpacity(0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: colorScheme.primary,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    LanguageUtils.getLanguageNotAvailableTitle(languageCode),
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onDismiss();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Message
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.volume_up,
                          color: colorScheme.onPrimaryContainer,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            LanguageUtils.getLanguageDownloadMessage(
                              languageCode,
                            ),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Platform-specific instructions
                  if (Platform.isIOS) ...[
                    _buildInstructionsSection(
                      context: context,
                      title: LanguageUtils.getInstructionsForIOS(languageCode),
                      icon: Icons.phone_iphone,
                      steps: LanguageUtils.getIOSInstructionSteps(languageCode),
                    ),
                  ] else if (Platform.isAndroid) ...[
                    _buildInstructionsSection(
                      context: context,
                      title: LanguageUtils.getInstructionsForAndroid(languageCode),
                      icon: Icons.phone_android,
                      steps: LanguageUtils.getAndroidInstructionSteps(languageCode),
                    ),
                  ],

                  const SizedBox(height: 24),

                  // Note
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.tertiaryContainer.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: colorScheme.outline.withOpacity(0.2),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          color: colorScheme.onTertiaryContainer,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            LanguageUtils.getContinueSurveyNote(languageCode),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onTertiaryContainer,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // Bottom button
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onDismiss();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  LanguageUtils.getGotItText(languageCode),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildInstructionsSection({
  required BuildContext context,
  required String title,
  required IconData icon,
  required List<String> steps,
}) {
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(
            icon,
            color: colorScheme.secondary,
            size: 24,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
        ],
      ),
      const SizedBox(height: 12),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.surfaceVariant.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colorScheme.outline.withOpacity(0.2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: steps
              .asMap()
              .entries
              .map(
                (entry) => Padding(
                  padding: EdgeInsets.only(
                    bottom: entry.key < steps.length - 1 ? 12 : 0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            '${entry.key + 1}',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          entry.value,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    ],
  );
}
