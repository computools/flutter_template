import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_template/application.dart';
import 'package:flutter_template/infrastructure/di/injectable.init.dart';
import 'package:flutter_template/presentation/state_management/app_bloc_observer.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      FlutterError.onError = (details) {
        log(details.exceptionAsString(), stackTrace: details.stack);
      };

      await configureDependencies();

      const AppBlocObserver().initialize();

      runApp(
        Provider<GetIt>(
          create: (context) => getIt,
          child: const Application(),
        ),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
