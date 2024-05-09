import 'package:injectable/injectable.dart';

import 'package:flutter_template/infrastructure/config/env.dart';

enum Environment { local, development, production }

@singleton
class AppConfig {
  static Environment environmentFromEnv() {
    const stringEnv = String.fromEnvironment('ENVIRONMENT', defaultValue: Env.local);

    switch (stringEnv) {
      case Env.prod:
        return Environment.production;
      case Env.dev:
        return Environment.development;
      default:
        return Environment.local;
    }
  }

  final Environment environment;
  final String baseUrl = const String.fromEnvironment('BASE_URL');

  AppConfig() : environment = environmentFromEnv();
}
