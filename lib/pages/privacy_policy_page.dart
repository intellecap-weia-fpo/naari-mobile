import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  late final Future<Map<String, dynamic>> _policy = _loadPolicy();

  Future<Map<String, dynamic>> _loadPolicy() async {
    final text = await rootBundle.loadString('assets/privacy_policy.json');
    return jsonDecode(text) as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _policy,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Padding(
              padding: EdgeInsets.all(24),
              child: SelectableText(
                'Unable to load the privacy policy. '
                'Contact dpg@invarya.com for a copy.',
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final policy = snapshot.data!;
          return SelectionArea(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                Text(
                  policy['title'] as String,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text('Last updated: ${policy['updated']}'),
                const SizedBox(height: 8),
                Text('Privacy contact: ${policy['contact']}'),
                for (final section in policy['sections'] as List) ...[
                  const SizedBox(height: 24),
                  Text(
                    section['title'] as String,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(section['body'] as String),
                ],
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}
