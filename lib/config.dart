class Config {
  /// Server to connect to. Set at build time, for example:
  /// --dart-define=NAARI_API_BASE=https://naari.example.org
  static const String endpointDefault = String.fromEnvironment(
    'NAARI_API_BASE',
    defaultValue: 'http://localhost:8000',
  );

  static String activeEndpointBase = endpointDefault;

  static String get workspaceName => 'NAARI';

  // GraphQL endpoint for survey operations
  static String get GRAPHQL_ENDPOINT => '$activeEndpointBase/graphql/';

  // Environment-specific configurations
  static bool get isProduction => const bool.fromEnvironment('dart.vm.product');

  // Timeout configurations
  static const Duration defaultTimeout = Duration(seconds: 30);
  static const Duration uploadTimeout = Duration(minutes: 2);
}
