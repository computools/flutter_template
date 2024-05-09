import 'package:dio/dio.dart';
import 'package:flutter_template/data/auth/api/dto/email_sign_in_dto/email_sign_in_dto.dart';
import 'package:flutter_template/data/auth/api/dto/refresh_token_dto/refresh_token_dto.dart';
import 'package:flutter_template/data/auth/api/dto/token_wrapper_dto/token_wrapper_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'auth_api.client.g.dart';

@lazySingleton
@RestApi()
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  static const String _prefixUrl = '/api/v1/auth';

  @POST('$_prefixUrl/login')
  Future<TokenWrapperDTO> signInWithEmail(@Body() EmailSignInDTO payload);

  @POST('$_prefixUrl/refresh-token')
  Future<TokenWrapperDTO> refreshToken(@Body() RefreshTokenDTO refreshToken);
}
