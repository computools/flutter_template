import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/localizations.dart';

import 'package:flutter_template/infrastructure/di/injectable.init.dart';
import 'package:flutter_template/presentation/theme/dark_theme.dart';
import 'package:flutter_template/presentation/theme/light_theme.dart';
import 'package:flutter_template/presentation/ui_kit/snack_bar.dart';
import 'package:flutter_template/routing/app_router.dart';

class Application extends StatelessWidget {
  const Application({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();

    return Builder(
      builder: (context) {
        return MaterialApp.router(
          theme: LightTheme.getTheme(context),
          darkTheme: DarkTheme.getTheme(context),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          routerDelegate: router.delegate(),
          routeInformationProvider: router.routeInfoProvider(),
          routeInformationParser: router.defaultRouteParser(),
          builder: _builder,
        );
      },
    );
  }

  Widget _builder(BuildContext context, Widget? child) {
    return SnackBarServiceWrapper(
      child: child ?? const SizedBox.shrink(),
    );
  }
}
