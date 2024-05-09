import 'package:flutter_template/domain/auth/auth.repository.dart';
import 'package:flutter_template/domain/auth/entities/auth_payload.dart';
import 'package:flutter_template/infrastructure/config/env.dart';
import 'package:flutter_template/infrastructure/utils/store_interactor.dart';
import 'package:injectable/injectable.dart';

const String _ACCESS_TOKEN = 'accessToken';
const String _REFRESH_TOKEN = 'refreshToken';

@LazySingleton(as: AuthRepository, env: [Env.local])
class MockAuthRepository implements AuthRepository {
  MockAuthRepository(
    this._storeInteractor,
  );

  final StoreInteractor _storeInteractor;

  @override
  Future<void> signInWith(AuthPayload payload) async {
    if (payload is EmailSignIn) {
      await _signInWithEmail(payload);
    } else {
      throw UnimplementedError();
    }
  }

  Future<void> _signInWithEmail(EmailSignIn payload) async {
    await Future.delayed(const Duration(seconds: 2));
    await _setTokens();
  }

  @override
  Future<void> refreshToken() async {
    await _setTokens();
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

  Future<void> _setTokens() async {
    await _storeInteractor.setAccessToken(_ACCESS_TOKEN);
    await _storeInteractor.setRefreshToken(_REFRESH_TOKEN);
  }
}
