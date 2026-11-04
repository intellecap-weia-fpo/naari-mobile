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

The iOS build is tested with Flutter 3.41. The Android project still uses older Gradle and Android Gradle Plugin versions, which Flutter 3.41 rejects, so Android builds need those upgraded first.

Android emulators reach a server on your computer at `10.0.2.2`. Release builds need your own signing setup; no signing keys are in this repository.

## Tests

```bash
flutter analyze
flutter test
```

## Community

See the [privacy notice](PRIVACY.md), [CONTRIBUTING.md](CONTRIBUTING.md), [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) and [SECURITY.md](SECURITY.md).

## Copyright and licence

Copyright (C) 2025-2026 IntelleCap Advisory Services Pvt. Ltd.. Licensed under the Apache License, Version 2.0; see [LICENSE](LICENSE) and [NOTICE](NOTICE).
