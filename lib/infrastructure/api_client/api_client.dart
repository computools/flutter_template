import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_template/infrastructure/api_client/interceptors/auth_interceptor.dart';
import 'package:flutter_template/infrastructure/config/config.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioRegisterModule {
  @singleton
  Dio registerClient(AppConfig config) {
    final options = BaseOptions(baseUrl: config.baseUrl);
    final dio = Dio(options);

    return dio..transformer = BackgroundTransformer();
  }

  @singleton
  Future<Interceptors> addInterceptors(
    Dio dio,
    AuthInterceptor authInterceptor,
  ) async {
    return dio.interceptors..add(authInterceptor);
  }
}
