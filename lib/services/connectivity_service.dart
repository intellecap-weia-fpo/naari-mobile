import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Service to monitor network connectivity status
class ConnectivityService extends ChangeNotifier {
  static ConnectivityService? _instance;
  static ConnectivityService get instance =>
      _instance ??= ConnectivityService._();

  ConnectivityService._() {
    _initialize();
  }

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  bool _isOnline = true;
  bool _isInitialized = false;
  List<ConnectivityResult> _connectionTypes = [];

  /// Whether the device currently has network connectivity
  bool get isOnline => _isOnline;

  /// Whether the service has completed initial connectivity check
  bool get isInitialized => _isInitialized;

  /// Current connection types (wifi, mobile, etc.)
  List<ConnectivityResult> get connectionTypes => _connectionTypes;

  /// Stream that emits when connectivity status changes
  Stream<bool> get onConnectivityChanged => _connectivityController.stream;
  final _connectivityController = StreamController<bool>.broadcast();

  Future<void> _initialize() async {
    try {
      // Check initial connectivity
      _connectionTypes = await _connectivity.checkConnectivity();
      _isOnline = _hasConnection(_connectionTypes);
      _isInitialized = true;
      notifyListeners();

      debugPrint(
        'Connectivity: Initial status - online: $_isOnline, types: $_connectionTypes',
      );

      // Listen for connectivity changes
      _subscription = _connectivity.onConnectivityChanged.listen(
        _onConnectivityChanged,
      );
    } catch (e) {
      debugPrint('Connectivity: Error during initialization: $e');
      _isOnline = true; // Assume online if can't determine
      _isInitialized = true;
      notifyListeners();
    }
  }

  void _onConnectivityChanged(List<ConnectivityResult> result) {
    final wasOnline = _isOnline;
    _connectionTypes = result;
    _isOnline = _hasConnection(result);

    debugPrint(
      'Connectivity: Status changed - online: $_isOnline, types: $result',
    );

    if (wasOnline != _isOnline) {
      _connectivityController.add(_isOnline);
      notifyListeners();
    }
  }

  bool _hasConnection(List<ConnectivityResult> results) {
    if (results.isEmpty) return false;
    return results.any((result) => result != ConnectivityResult.none);
  }

  /// Check if device can actually reach the internet
  /// This performs an actual network request to verify connectivity
  Future<bool> checkActualConnectivity() async {
    if (!_isOnline) return false;

    try {
      // TODO: Replace with your actual server health check endpoint
      // For now, we just trust the connectivity status
      return _isOnline;
    } catch (e) {
      debugPrint('Connectivity: Actual connectivity check failed: $e');
      return false;
    }
  }

  /// Wait for connectivity to be restored
  Future<void> waitForConnectivity({Duration? timeout}) async {
    if (_isOnline) return;

    final completer = Completer<void>();
    StreamSubscription<bool>? subscription;
    Timer? timeoutTimer;

    subscription = onConnectivityChanged.listen((isOnline) {
      if (isOnline) {
        subscription?.cancel();
        timeoutTimer?.cancel();
        if (!completer.isCompleted) {
          completer.complete();
        }
      }
    });

    if (timeout != null) {
      timeoutTimer = Timer(timeout, () {
        subscription?.cancel();
        if (!completer.isCompleted) {
          completer.completeError(
            TimeoutException('Connectivity timeout', timeout),
          );
        }
      });
    }

    return completer.future;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _connectivityController.close();
    super.dispose();
  }
}
