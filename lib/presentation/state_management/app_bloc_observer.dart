import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/infrastructure/di/injectable.init.dart';
import 'package:flutter_template/presentation/ui_kit/snack_bar.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  void initialize() => Bloc.observer = this;

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');

    getIt<SnackBarService>().showErrorSnackBar(error);

    super.onError(bloc, error, stackTrace);
  }
}
