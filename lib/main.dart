import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:naari_survey/pages/report_page.dart';
import 'package:naari_survey/pages/settings_page.dart';
import 'package:naari_survey/pages/change_password_page.dart';

import 'models/survey_mode.dart';
import 'pages/demo_survey_page.dart';
import 'pages/delete_account_page.dart';
import 'pages/privacy_policy_page.dart';
import 'pages/forgot_password_page.dart';
import 'pages/home_page.dart';
import 'pages/environment_selection_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/splash_page.dart';
import 'pages/submission_detail_page.dart';
import 'pages/survey_detail_page.dart';
import 'pages/survey_form_page.dart';
import 'pages/sync_activity_page.dart';
import 'services/auth_service.dart';
import 'services/connectivity_service.dart';
import 'services/offline_download_manager.dart';
import 'services/offline_storage_service.dart';
import 'services/sync_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();

  // Initialize offline support services
  await _initializeOfflineServices();

  runApp(const WeiaApp());
}

/// Initialize offline support services
Future<void> _initializeOfflineServices() async {
  try {
    // Initialize connectivity monitoring
    ConnectivityService.instance;

    // Initialize local database
    await OfflineStorageService.instance.database;

    // Initialize sync manager
    SyncManager.instance;

    // Initialize download manager to restore last download state
    await OfflineDownloadManager.instance.initialize();

    debugPrint('Offline services initialized successfully');
  } catch (e) {
    debugPrint('Error initializing offline services: $e');
  }
}

class WeiaApp extends StatelessWidget {
  const WeiaApp({super.key});

  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final authService = AuthService.instance;
      final isAuthenticated = authService.isAuthenticated;
      final isAuthUnknown = authService.status == AuthStatus.unknown;

      if (state.matchedLocation == '/privacy-policy') return null;

      // Show splash/loading while checking auth
      if (isAuthUnknown) {
        return '/splash';
      }

      // Redirect to home if authenticated and trying to access login or environment selection
      if (isAuthenticated &&
          (state.matchedLocation == '/' || state.matchedLocation == '/login')) {
        return '/home/dashboard';
      }

      // Redirect to environment selection if not authenticated and trying to access protected routes
      if (!isAuthenticated && state.matchedLocation.startsWith('/home')) {
        return '/';
      }

      return null; // No redirect needed
    },
    routes: [
      GoRoute(
        path: '/privacy-policy',
        builder: (context, state) => const PrivacyPolicyPage(),
      ),
      GoRoute(
        path: '/home/settings/delete-account',
        builder: (context, state) => const DeleteAccountPage(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const EnvironmentSelectionPage(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
      GoRoute(
        path: '/survey/:surveyId',
        builder: (context, state) {
          return SurveyDetailPage(surveyId: state.pathParameters['surveyId']!);
        },
      ),
      GoRoute(
        path: '/survey/:surveyId/form',
        builder: (context, state) {
          final params = state.uri.queryParameters;
          return SurveyFormPage(
            surveyId: state.pathParameters['surveyId']!,
            language: params['language']!,
            mode: SurveyMode.fromString(params['mode']) ?? SurveyMode.manual,
            responseId: params['responseId'],
          );
        },
      ),
      GoRoute(
        path: '/submission/:submissionId',
        builder: (context, state) {
          return SubmissionDetailPage(
            submissionId: state.pathParameters['submissionId']!,
          );
        },
      ),
      GoRoute(
        path: '/demo/survey',
        builder: (context, state) => const DemoSurveyPage(),
      ),
      GoRoute(
        path: '/home/sync-activity',
        builder: (context, state) => const SyncActivityPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            HomePage(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home/dashboard',
                builder: (context, state) => const DashboardPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home/report',
                builder: (context, state) => ReportPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home/settings',
                builder: (context, state) => const SettingsPage(),
                routes: [
                  GoRoute(
                    path: 'change-password',
                    builder: (context, state) => const ChangePasswordPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    refreshListenable: AuthService.instance,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NAARI Survey',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        textTheme: GoogleFonts.spaceGroteskTextTheme(),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.spaceGroteskTextTheme(
          ThemeData.dark().textTheme,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', ''), Locale('hi', '')],
      routerConfig: _router,
    );
  }
}
