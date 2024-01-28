//dev
enum Environment { staging, production }

extension on Environment {
  String get baseUrl => switch (this) {
        Environment.staging => 'http://stage.api.shypes.com/',
        Environment.production => 'https://api.shypes.com/'
      };

  bool get isStaging => switch (this) {
        Environment.staging => true,
        Environment.production => false
      };
}

class EnvironmentConfig {
  static Environment environment = Environment.production;
  static String get baseUrl => environment.baseUrl;
  static bool get isStaging => environment.isStaging;
}
