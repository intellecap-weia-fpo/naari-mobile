import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../graphql/queries/auth.graphql.dart';
import '../config.dart';
import 'offline_download_manager.dart';
import 'offline_file_storage_service.dart';
import 'sync_manager.dart';
import 'connectivity_service.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AccountDeletionException implements Exception {
  const AccountDeletionException(this.message);
  final String message;
}

class AuthService extends ChangeNotifier {
  static AuthService? _instance;
  static AuthService get instance => _instance ??= AuthService._();

  AuthService._() {
    _initialize();
  }

  AuthStatus _status = AuthStatus.unknown;
  String? _token;
  String? _refreshToken;
  GraphQLClient? _client;
  Query$Me$me? _user;

  /// Offline grace period - allow offline use even if token expires
  /// This is stored when user successfully authenticates
  DateTime? _lastSuccessfulAuth;
  static const Duration _offlineGracePeriod = Duration(hours: 720); // 30 days
  static const String _lastAuthKey = 'last_successful_auth';
  static const String _userDataKey = 'auth_user_data';

  AuthStatus get status => _status;
  String? get token => _token;
  String? get refreshToken => _refreshToken;
  Query$Me$me? get user => _user;
  DateTime? get lastSuccessfulAuth => _lastSuccessfulAuth;

  /// Check if user is authenticated (either valid token or within offline grace period)
  bool get isAuthenticated {
    // If we have a valid token and authenticated status, user is authenticated
    if (_status == AuthStatus.authenticated && !_isTokenExpired()) {
      return true;
    }

    // Offline grace period: allow access if user authenticated recently
    // This enables offline work even when token has expired
    if (_token != null && _lastSuccessfulAuth != null) {
      final timeSinceLastAuth = DateTime.now().difference(_lastSuccessfulAuth!);
      if (timeSinceLastAuth < _offlineGracePeriod) {
        debugPrint(
          'Auth: Using offline grace period (${timeSinceLastAuth.inHours}h since last auth)',
        );
        return true;
      }
    }

    return false;
  }

  /// Check if user is within offline grace period (for UI purposes)
  bool get isInOfflineGracePeriod {
    if (_lastSuccessfulAuth == null) return false;
    final timeSinceLastAuth = DateTime.now().difference(_lastSuccessfulAuth!);
    return timeSinceLastAuth < _offlineGracePeriod && _isTokenExpired();
  }

  bool _isTokenExpired() {
    if (_token == null) return true;

    try {
      final parts = _token!.split('.');
      if (parts.length != 3) return true;

      final payload = parts[1];
      final normalized = base64Url.normalize(payload);
      final decoded = utf8.decode(base64Url.decode(normalized));
      final Map<String, dynamic> tokenData = json.decode(decoded);

      final exp = tokenData['exp'] as int?;
      if (exp == null) return true;

      final expirationDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
      final now = DateTime.now();

      debugPrint('Auth: Token expires at: $expirationDate');
      debugPrint('Auth: Current time: $now');
      debugPrint('Auth: Token expired: ${now.isAfter(expirationDate)}');

      return now.isAfter(expirationDate);
    } catch (e) {
      debugPrint('Auth: Error parsing token: $e');
      return true;
    }
  }

  GraphQLClient get client {
    if (_client == null) {
      final httpLink = HttpLink(
        Config.GRAPHQL_ENDPOINT,
        defaultHeaders: {'Content-Type': 'application/json'},
      );

      final authLink = AuthLink(
        getToken: () async => _token != null ? 'Bearer $_token' : null,
      );

      final link = authLink.concat(httpLink);

      _client = GraphQLClient(
        link: link,
        cache: GraphQLCache(),
        defaultPolicies: DefaultPolicies(
          watchQuery: Policies(fetch: FetchPolicy.networkOnly),
          query: Policies(fetch: FetchPolicy.networkOnly),
        ),
        queryRequestTimeout: Duration(seconds: 30),
      );
    }
    return _client!;
  }

  Future<void> _initialize() async {
    try {
      debugPrint('Auth: Starting initialization');
      await _loadTokensFromStorage();
      debugPrint(
        'Auth: Loaded tokens from storage - token exists: ${_token != null}',
      );

      if (_token != null) {
        debugPrint('Auth: Verifying existing token');
        await _verifyAndRefreshToken();
      } else {
        debugPrint('Auth: No token found, setting unauthenticated');
        _setStatus(AuthStatus.unauthenticated);
      }
    } catch (e) {
      debugPrint('Auth initialization error: $e');
      _setStatus(AuthStatus.unauthenticated);
    }
  }

  Future<void> _loadTokensFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('auth_token');
    _refreshToken = prefs.getString('refresh_token');

    // Load last successful auth timestamp for offline grace period
    final lastAuthTimestamp = prefs.getInt(_lastAuthKey);
    if (lastAuthTimestamp != null) {
      _lastSuccessfulAuth = DateTime.fromMillisecondsSinceEpoch(
        lastAuthTimestamp,
      );
    }

    // Load selected endpoint preference
    final endpoint = prefs.getString('selected_endpoint');
    if (endpoint != null) {
      Config.activeEndpointBase = endpoint;
    }

    // Load cached user data for offline use
    final userJson = prefs.getString(_userDataKey);
    if (userJson != null) {
      try {
        _user = Query$Me$me.fromJson(
          json.decode(userJson) as Map<String, dynamic>,
        );
        debugPrint('Auth: Loaded cached user data for ${_user?.username}');
      } catch (e) {
        debugPrint('Auth: Error loading cached user data: $e');
      }
    }
  }

  Future<void> updateEndpoint(String endpoint) async {
    Config.activeEndpointBase = endpoint;
    _client = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_endpoint', endpoint);
  }

  Future<void> _saveTokensToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    if (_token != null) {
      await prefs.setString('auth_token', _token!);
    }
    if (_refreshToken != null) {
      await prefs.setString('refresh_token', _refreshToken!);
    }
    // Save last successful auth timestamp for offline grace period
    _lastSuccessfulAuth = DateTime.now();
    await prefs.setInt(
      _lastAuthKey,
      _lastSuccessfulAuth!.millisecondsSinceEpoch,
    );
  }

  Future<void> _saveUserToStorage() async {
    if (_user == null) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userDataKey, json.encode(_user!.toJson()));
    debugPrint('Auth: Cached user data for ${_user?.username}');
  }

  Future<void> _clearTokensFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('refresh_token');
    await prefs.remove(_lastAuthKey);
    await prefs.remove(_userDataKey);
    _lastSuccessfulAuth = null;
  }

  Future<void> _saveRememberMePreference(bool rememberMe) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('remember_me', rememberMe);
  }

  Future<bool> getRememberMePreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('remember_me') ?? false;
  }

  Future<void> _saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_username', username);
  }

  Future<String?> getSavedUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('saved_username');
  }

  Future<void> _clearSavedUsername() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('saved_username');
  }

  void _setStatus(AuthStatus status) {
    if (_status != status) {
      _status = status;
      notifyListeners();
    }
  }

  Future<void> _verifyAndRefreshToken() async {
    if (_token == null) {
      _setStatus(AuthStatus.unauthenticated);
      return;
    }

    try {
      // Try to get current user info to verify token
      final result = await client.query$Me(
        Options$Query$Me(fetchPolicy: FetchPolicy.networkOnly),
      );

      if (result.hasException) {
        debugPrint('Token verification failed: ${result.exception}');
        // Token might be expired, try to refresh
        if (_refreshToken != null) {
          await _refreshTokens();
        } else {
          // Check if we're within offline grace period before failing
          if (_isWithinOfflineGracePeriod()) {
            debugPrint('Auth: Token expired but within offline grace period');
            _setStatus(AuthStatus.authenticated);
          } else {
            await _handleAuthFailure();
          }
        }
      } else {
        _user = result.parsedData?.me;
        _lastSuccessfulAuth = DateTime.now();
        _setStatus(AuthStatus.authenticated);

        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt(
          _lastAuthKey,
          _lastSuccessfulAuth!.millisecondsSinceEpoch,
        );
        await _saveUserToStorage();
      }
    } catch (e) {
      debugPrint('Token verification error: $e');
      // Network error - check if within offline grace period
      if (_isWithinOfflineGracePeriod()) {
        debugPrint('Auth: Network error but within offline grace period');
        _setStatus(AuthStatus.authenticated);
      } else {
        await _handleAuthFailure();
      }
    }
  }

  /// Check if we're within the offline grace period
  bool _isWithinOfflineGracePeriod() {
    if (_lastSuccessfulAuth == null) return false;
    final timeSinceLastAuth = DateTime.now().difference(_lastSuccessfulAuth!);
    return timeSinceLastAuth < _offlineGracePeriod;
  }

  Future<void> _refreshTokens() async {
    if (_refreshToken == null) {
      // Check offline grace period before clearing auth
      if (_isWithinOfflineGracePeriod()) {
        debugPrint('Auth: No refresh token but within offline grace period');
        _setStatus(AuthStatus.authenticated);
      } else {
        await _handleAuthFailure();
      }
      return;
    }

    try {
      final result = await client.mutate$RefreshToken(
        Options$Mutation$RefreshToken(
          variables: Variables$Mutation$RefreshToken(
            refreshToken: _refreshToken!,
          ),
        ),
      );

      if (result.hasException) {
        // Check offline grace period before clearing auth on network errors
        if (_isWithinOfflineGracePeriod()) {
          debugPrint(
            'Auth: Token refresh failed but within offline grace period',
          );
          _setStatus(AuthStatus.authenticated);
        } else {
          await _handleAuthFailure();
        }
        return;
      }

      final data = result.parsedData?.refreshToken;
      if (data != null) {
        _token = data.token;
        _refreshToken = data.refreshToken;
        await _saveTokensToStorage();

        // Reinitialize client with new token
        _client = null;

        // Verify the new token by getting user info
        final userResult = await client.query$Me();
        if (userResult.hasException) {
          // Check offline grace period before clearing auth
          if (_isWithinOfflineGracePeriod()) {
            debugPrint(
              'Auth: User info fetch failed but within offline grace period',
            );
            _setStatus(AuthStatus.authenticated);
          } else {
            await _handleAuthFailure();
          }
        } else {
          _user = userResult.parsedData?.me;
          await _saveUserToStorage();
          _setStatus(AuthStatus.authenticated);
        }
      } else {
        // Check offline grace period before clearing auth
        if (_isWithinOfflineGracePeriod()) {
          debugPrint('Auth: No refresh data but within offline grace period');
          _setStatus(AuthStatus.authenticated);
        } else {
          await _handleAuthFailure();
        }
      }
    } catch (e) {
      debugPrint('Token refresh error: $e');
      // Check offline grace period before clearing auth on network errors
      if (_isWithinOfflineGracePeriod()) {
        debugPrint(
          'Auth: Token refresh exception but within offline grace period',
        );
        _setStatus(AuthStatus.authenticated);
      } else {
        await _handleAuthFailure();
      }
    }
  }

  Future<void> _handleAuthFailure() async {
    _token = null;
    _refreshToken = null;
    _user = null;
    _client = null;
    await _clearTokensFromStorage();
    _setStatus(AuthStatus.unauthenticated);
  }

  Future<bool> signIn(
    String username,
    String password, {
    bool rememberMe = false,
  }) async {
    try {
      final result = await client.mutate$SignIn(
        Options$Mutation$SignIn(
          variables: Variables$Mutation$SignIn(
            username: username,
            password: password,
          ),
        ),
      );

      if (result.hasException) {
        debugPrint('Sign in error: ${result.exception}');
        return false;
      }

      final data = result.parsedData?.signIn;
      if (data != null) {
        _token = data.token;
        _refreshToken = data.refreshToken;

        // Save tokens and remember me preference
        await _saveTokensToStorage();
        await _saveRememberMePreference(rememberMe);
        if (rememberMe) {
          await _saveUsername(username);
        } else {
          await _clearSavedUsername();
        }

        // Reinitialize client with new token
        _client = null;

        // Get user info
        final userResult = await client.query$Me();
        if (!userResult.hasException) {
          _user = userResult.parsedData?.me;
          await _saveUserToStorage();
        }

        _setStatus(AuthStatus.authenticated);

        // Trigger offline download in background (non-blocking)
        _triggerOfflineDownload();

        return true;
      }

      return false;
    } catch (e) {
      debugPrint('Sign in error: $e');
      return false;
    }
  }

  /// Initialize offline services after successful login
  /// This runs in the background and doesn't block the login flow
  void _triggerOfflineDownload() {
    // Initialize offline services in background
    Future.microtask(() async {
      try {
        // Initialize file storage
        await OfflineFileStorageService.instance.initialize();

        // Initialize download manager
        await OfflineDownloadManager.instance.initialize();

        debugPrint('Auth: Offline services initialized');
      } catch (e) {
        debugPrint('Auth: Error initializing offline services: $e');
      }
    });
  }

  Future<bool> signOut() async {
    try {
      // Call logout mutation
      final result = await client.mutate$Logout();

      if (result.hasException) {
        debugPrint('Logout error: ${result.exception}');
      }
    } catch (e) {
      debugPrint('Sign out error: $e');
    }

    // Clear all local data regardless of server response
    // This prevents workspace cross-contamination between servers
    try {
      await SyncManager.instance.clearAll();
      await OfflineDownloadManager.instance.resetDownloadState();
      await OfflineFileStorageService.instance.clearAll();
      debugPrint('Auth: Cleared all offline data on logout');
    } catch (e) {
      debugPrint('Auth: Error clearing offline data on logout: $e');
    }

    await _handleAuthFailure();
    return true;
  }

  Future<void> deleteAccount(String password) async {
    if (!ConnectivityService.instance.isOnline) {
      throw const AccountDeletionException(
        'Connect to the internet to permanently delete your account.',
      );
    }
    if (OfflineDownloadManager.instance.isDownloading) {
      throw const AccountDeletionException(
        'Wait for the current download to finish, then try again.',
      );
    }
    try {
      // Finish in-flight uploads before deleting their server records, and
      // prevent queued work from recreating data during deletion.
      await SyncManager.instance.pauseForAccountDeletion().timeout(
        const Duration(seconds: 30),
      );
      final result = await client.mutate(
        MutationOptions(
          document: gql(r'''
            mutation DeleteAccount($password: String!) {
              deleteAccount(password: $password) { success message }
            }
          '''),
          variables: {'password': password},
          fetchPolicy: FetchPolicy.noCache,
        ),
      );
      if (result.hasException) {
        throw const AccountDeletionException(
          'Deletion could not be confirmed. Check your connection and try again. '
          'If your session has expired, sign in again first. '
          'For help, contact dpg@invarya.com.',
        );
      }
      final data = result.data?['deleteAccount'];
      if (data is! Map || data['success'] != true) {
        throw AccountDeletionException(
          data is Map && data['message'] is String
              ? data['message'] as String
              : 'Could not delete your account. Please try again.',
        );
      }

      try {
        await Future.wait<void>([
          SyncManager.instance.clearAll(),
          OfflineDownloadManager.instance.resetDownloadState(),
          OfflineFileStorageService.instance.clearAll(),
          _clearAccountPreferences(),
          _clearTemporaryFiles(),
        ]);
        _client?.cache.store.reset();
      } finally {
        // The account is gone on the server. Always discard the offline login,
        // including its 30-day grace period, even if device cleanup fails.
        await _handleAuthFailure();
      }
    } on AccountDeletionException {
      rethrow;
    } catch (_) {
      throw const AccountDeletionException(
        'Could not finish account deletion. Please try again. '
        'For help, contact dpg@invarya.com.',
      );
    } finally {
      SyncManager.instance.resumeAfterAccountDeletion();
    }
  }

  Future<void> _clearAccountPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    // Include saved form positions and per-submission language preferences,
    // which also contain account-specific submission identifiers.
    for (final key in prefs.getKeys()) {
      if (key != 'selected_endpoint') await prefs.remove(key);
    }
  }

  Future<void> _clearTemporaryFiles() async {
    final directory = await getTemporaryDirectory();
    await for (final entry in directory.list()) {
      // Camera/photo-picker originals and voice recordings can remain here
      // after their copies in offline storage have been removed.
      await entry.delete(recursive: true);
    }
  }

  Future<void> checkAuthStatus() async {
    if (_status == AuthStatus.unknown) {
      try {
        await _initialize().timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            debugPrint('Auth: Initialization timeout');
            if (_isWithinOfflineGracePeriod()) {
              debugPrint('Auth: Timeout but within offline grace period');
              _setStatus(AuthStatus.authenticated);
            } else {
              _setStatus(AuthStatus.unauthenticated);
            }
          },
        );
      } catch (e) {
        debugPrint('Auth: Check status error: $e');
        if (_isWithinOfflineGracePeriod()) {
          debugPrint(
            'Auth: Check status error but within offline grace period',
          );
          _setStatus(AuthStatus.authenticated);
        } else {
          _setStatus(AuthStatus.unauthenticated);
        }
      }
    }
  }
}
