<p align="center"><img src="docs/logo.png" alt="NAARI logo" width="160"></p>

# NAARI field app

Flutter app for field teams running NAARI surveys, including offline capture and sync. Questions can be read aloud using the phone's own text-to-speech.

## Requirements

- Flutter 3.41 ([fvm](https://fvm.app) reads the version from `.fvmrc`, if present).
- A running [naari](https://github.com/intellecap-weia-fpo/naari) server.

## Build and run

```bash
flutter pub get
flutter run --dart-define=NAARI_API_BASE=http://10.0.2.2:8000
```

The Android debug build (`flutter build apk --debug`) and the iOS simulator build are tested with Flutter 3.41.9, the version pinned in `.fvmrc`, and the debug APK has been launched on an Android 16 emulator. Use that Flutter version: Flutter 3.47 rejects this project's Gradle and Android Gradle Plugin versions.

Android emulators reach a server on your computer at `10.0.2.2`. Release builds need your own signing setup; no signing keys are in this repository.

## Tests

```bash
flutter analyze
flutter test
```

## Community

See the [server overview](https://github.com/intellecap-weia-fpo/naari/blob/main/docs/overview.md), [content policy](https://github.com/intellecap-weia-fpo/naari/blob/main/docs/content-policy.md), [privacy notice](PRIVACY.md), [CONTRIBUTING.md](CONTRIBUTING.md), [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) and [SECURITY.md](SECURITY.md).

## Copyright and licence

Copyright (C) 2025-2026 IntelleCap Advisory Services Pvt. Ltd.. Licensed under the Apache License, Version 2.0; see [LICENSE](LICENSE) and [NOTICE](NOTICE).
