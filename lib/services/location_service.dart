import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  LocationService._();
  static LocationService? _instance;
  static LocationService get instance => _instance ??= LocationService._();

  Position? _lastPosition;

  /// Requests location service and permission if needed.
  /// Returns true when location permission is granted (whileInUse or always).
  Future<bool> ensurePermission() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        debugPrint('Location: Service disabled');
        // Do not open settings automatically, just report status.
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        debugPrint(
            'Location: Permission permanently denied. Please enable in settings.');
        return false;
      }

      final granted = permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse;
      debugPrint('Location: permission granted? $granted');
      return granted;
    } catch (e) {
      debugPrint('Location: Error requesting permission: $e');
      return false;
    }
  }

  /// Attempts to fetch current device position. Falls back to last known.
  Future<Position?> getCurrentPosition({
    LocationAccuracy accuracy = LocationAccuracy.high,
  }) async {
    try {
      final hasPerm = await ensurePermission();
      if (!hasPerm) return _lastPosition;

      final pos = await Geolocator.getCurrentPosition(desiredAccuracy: accuracy);
      _lastPosition = pos;
      return pos;
    } catch (e) {
      debugPrint('Location: getCurrentPosition error: $e');
      try {
        final last = await Geolocator.getLastKnownPosition();
        _lastPosition = last ?? _lastPosition;
        return _lastPosition;
      } catch (_) {
        return _lastPosition;
      }
    }
  }

  /// Returns the most recently fetched position, if available.
  Position? get lastPosition => _lastPosition;
}

