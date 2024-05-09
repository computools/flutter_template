import 'package:flutter_template/domain/auth/entities/auth_payload.dart';

abstract interface class AuthRepository {
  Future<void> signInWith(AuthPayload payload);

  Future<void> refreshToken();

  bool isSignedIn();

  Future<void> signOut();
}
