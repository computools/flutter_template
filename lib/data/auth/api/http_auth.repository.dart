import 'package:dio/dio.dart';
import 'package:flutter_template/data/auth/api/client/auth_api.client.dart';
import 'package:flutter_template/data/auth/api/dto/email_sign_in_dto/email_sign_in_dto.dart';
import 'package:flutter_template/data/auth/api/dto/refresh_token_dto/refresh_token_dto.dart';
import 'package:flutter_template/data/auth/api/dto/token_wrapper_dto/token_wrapper_dto.dart';
import 'package:flutter_template/domain/auth/auth.repository.dart';
import 'package:flutter_template/domain/auth/auth_exception.dart';
import 'package:flutter_template/domain/auth/entities/auth_payload.dart';
import 'package:flutter_template/infrastructure/config/env.dart';
import 'package:flutter_template/infrastructure/utils/store_interactor.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository, env: [Env.prod, Env.dev])
class HttpAuthRepository implements AuthRepository {
  final StoreInteractor _storeInteractor;
  final AuthApiClient _authApiClient;

  HttpAuthRepository(
    this._storeInteractor,
    this._authApiClient,
  );

  @override
  Future<void> signInWith(AuthPayload payload) async {
    try {
      if (payload is EmailSignIn) {
        await _signInWithEmail(payload);
      } else {
        throw UnimplementedError();
      }
    } on DioException catch (error) {
      if (error.response!.statusCode == 401) {
        throw WrongSignInCredentials();
      }
      rethrow;
    }
  }

  Future<void> _signInWithEmail(EmailSignIn payload) async {
    final emailSignInDto = EmailSignInDTO(
      email: payload.email,
      password: payload.password,
    );
    final dto = await _authApiClient.signInWithEmail(emailSignInDto);
    await _setTokens(dto);
  }

  @override
  Future<void> refreshToken() async {
    final refreshToken = _storeInteractor.getRefreshToken();

    try {
      if (refreshToken != null) {
        final requestBody = RefreshTokenDTO(refreshToken);
        final dto = await _authApiClient.refreshToken(requestBody);
        await _setTokens(dto);
      }
    } on DioException catch (error) {
      if (error.response!.statusCode == 401) {
        await _storeInteractor.clearStorage();
        throw ExpiredToken();
      }
      rethrow;
    }
  }

  @override
  bool isSignedIn() {
    final token = _storeInteractor.getAccessToken();
    return token != null;
  }

  @override
  Future<void> signOut() async {
    await _storeInteractor.clearStorage();
  }

  Future<void> _setTokens(TokenWrapperDTO dto) async {
    await _storeInteractor.setAccessToken(dto.accessToken);
    await _storeInteractor.setRefreshToken(dto.refreshToken);
  }
}
