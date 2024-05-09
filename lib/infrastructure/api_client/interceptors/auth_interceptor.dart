import 'package:dio/dio.dart';
import 'package:flutter_template/domain/auth/usecase/get_token.usecase.dart';
import 'package:flutter_template/domain/auth/usecase/refresh_token.usecase.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthInterceptor extends InterceptorsWrapper {
  final Dio _dio;
  final GetTokenUsecase _getToken;
  final RefreshTokenUsecase _refreshToken;

  AuthInterceptor(
    this._dio,
    this._getToken,
    this._refreshToken,
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = _getToken(TokenType.access);
    if (options.headers['Authorization'] == null || accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && err.response?.data['message'] == 'Unauthorized') {
      final refreshToken = _getToken(TokenType.refresh);
      if (refreshToken != null) {
        try {
          await _refreshToken();
          final response = await _retry(_dio, err.requestOptions);
          handler.resolve(response);
        } catch (_) {
          handler.next(err);
        }
      }
    } else {
      super.onError(err, handler);
    }
  }

  Future<Response> _retry(Dio dio, RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
