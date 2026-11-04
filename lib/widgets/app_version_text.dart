import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionText extends StatefulWidget {
  const AppVersionText({super.key, this.style});

  final TextStyle? style;

  @override
  State<AppVersionText> createState() => _AppVersionTextState();
}

class _AppVersionTextState extends State<AppVersionText> {
  late final Future<String> _versionFuture;

  @override
  void initState() {
    super.initState();
    _versionFuture = _loadVersion();
  }

  static String? _buildEnvVersion() {
    const buildName = String.fromEnvironment('FLUTTER_BUILD_NAME');
    const buildNumber = String.fromEnvironment('FLUTTER_BUILD_NUMBER');

    if (buildName.isEmpty) return null;
    if (buildNumber.isEmpty) return 'v$buildName';
    return 'v$buildName ($buildNumber)';
  }

  Future<String> _loadVersion() async {
    try {
      final info = await PackageInfo.fromPlatform();
      if (info.version.isEmpty) {
        return 'Version unavailable';
      }
      if (info.buildNumber.isEmpty) {
        return 'v${info.version}';
      }
      return 'v${info.version} (${info.buildNumber})';
    } catch (e, st) {
      if (kDebugMode) {
        developer.log(
          'AppVersionText: PackageInfo.fromPlatform failed',
          error: e,
          stackTrace: st,
        );
      }
      return 'Version unavailable';
    }
  }

  @override
  Widget build(BuildContext context) {
    final envVersion = _buildEnvVersion();
    if (envVersion != null) {
      return Text(envVersion, style: widget.style);
    }

    return FutureBuilder<String>(
      initialData: 'Loading version...',
      future: _versionFuture,
      builder: (context, snapshot) {
        final version = snapshot.data ?? 'Version unavailable';
        return Text(version, style: widget.style);
      },
    );
  }
}
