import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/tts_service.dart';

class DemoSurveyPage extends StatefulWidget {
  const DemoSurveyPage({super.key});

  @override
  State<DemoSurveyPage> createState() => _DemoSurveyPageState();
}

class _DemoSurveyPageState extends State<DemoSurveyPage> {
  final Map<String, String?> _answers = {};
  final _formKey = GlobalKey<FormState>();
  bool _showA2 = false;
  bool _showA3 = false;

  // A1 options
  final List<String> a1Options = [
    'Yes, Cash',
    'Yes, In-Kind',
    'Yes, Cash And In-Kind',
    'No',
    'Don\'t Know',
  ];

  // A2 options
  final List<String> a2Options = [
    'Yes, Cash',
    'Yes, In-Kind',
    'Yes, Cash And In-Kind',
    'No',
    'Don\'t Know',
  ];

  // A3 options
  final List<String> a3Options = [
    'Self',
    'Spouse (or Partner) In HH',
    'Spouse (or Partner) Outside HH',
    'Other HH Member',
    'Non-HH Member, Relative',
    'Non-HH Member, No Relation',
    'Government or Other Institution',
    'Clan (Group of Relatives)',
    'Not Applicable / No Decision Made',
  ];

  @override
  void initState() {
    super.initState();
    TTSService.instance.initialize();
    TTSService.instance.setLanguage('en-US');
  }

  @override
  void dispose() {
    TTSService.instance.stop();
    super.dispose();
  }

  void _speakQuestion(String question) {
    TTSService.instance.speak(question);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Survey'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/home/dashboard'),
        ),
        actions: [
          IconButton(
            onPressed: () => _speakQuestion(
              'A1. Have you personally taken the loan from "Non-governmental organization (NGO)"?',
            ),
            icon: Icon(
              TTSService.instance.isSpeaking
                  ? Icons.stop_circle_outlined
                  : Icons.play_circle_outlined,
              color: colorScheme.primary,
            ),
            tooltip: TTSService.instance.isSpeaking
                ? 'Stop reading'
                : 'Read question',
          ),
        ],
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question A1
              _buildQuestionCard(
                title:
                    'A1. Have you personally taken the loan from "Non-governmental organization (NGO)"?',
                options: a1Options,
                answerKey: 'A1',
                onChanged: (value) {
                  setState(() {
                    _showA2 =
                        value == 'Yes, Cash' ||
                        value == 'Yes, In-Kind' ||
                        value == 'Yes, Cash And In-Kind';
                    _showA3 = _showA2;

                    // Clear A2 and A3 if A1 is not "Yes"
                    if (!_showA2) {
                      _answers['A2'] = null;
                      _answers['A3'] = null;
                    }
                  });
                },
              ),

              const SizedBox(height: 20),

              // Question A2 (conditional)
              if (_showA2) ...[
                _buildQuestionCard(
                  title:
                      'A2. Has anyone in your household taken any loans or borrowed cash/in-kind from "Non-governmental organization (NGO)" in the past 12 months?',
                  options: a2Options,
                  answerKey: 'A2',
                  onChanged: (value) {
                    setState(() {
                      // A2 is now answered
                      _showA3 = value != null && value.isNotEmpty;
                    });
                  },
                ),
                const SizedBox(height: 20),
              ],

              // Question A3 (conditional)
              if (_showA3) ...[
                _buildQuestionCard(
                  title:
                      'A3. Who made the decision to borrow from "Non-governmental organization (NGO)" most of the time?',
                  options: a3Options,
                  answerKey: 'A3',
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20),
              ],

              // Submit Button
              Center(
                child: ElevatedButton(
                  onPressed: () => _submitSurvey(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Submit Demo',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionCard({
    required String title,
    required List<String> options,
    required String answerKey,
    required Function(String?) onChanged,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16),

          // Radio buttons for options
          ...options.map((option) {
            return RadioListTile<String>(
              title: Text(option),
              value: option,
              groupValue: _answers[answerKey],
              onChanged: (value) {
                setState(() {
                  _answers[answerKey] = value;
                });
                onChanged(value);
              },
              contentPadding: EdgeInsets.zero,
            );
          }).toList(),
        ],
      ),
    );
  }

  void _submitSurvey() {
    if (_formKey.currentState!.validate()) {
      // Show the collected answers
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Survey Results'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('A1: ${_answers['A1'] ?? 'Not answered'}'),
              if (_showA2) Text('A2: ${_answers['A2'] ?? 'Not answered'}'),
              if (_showA3) Text('A3: ${_answers['A3'] ?? 'Not answered'}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
