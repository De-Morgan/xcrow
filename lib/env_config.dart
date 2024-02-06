//dev
enum Environment { staging, production }

extension on Environment {
  String get baseUrl => switch (this) {
        Environment.staging => 'https://paytal.microuserng.com/api/',
        Environment.production => 'https://paytal.microuserng.com/api/'
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
