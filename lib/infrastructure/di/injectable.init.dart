import 'package:flutter_template/infrastructure/config/env.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable.init.config.dart';

final getIt = GetIt.I;

@InjectableInit()
Future<void> configureDependencies() async {
  const environment = String.fromEnvironment('ENVIRONMENT', defaultValue: Env.local);
  getIt.init(environment: environment);
}
