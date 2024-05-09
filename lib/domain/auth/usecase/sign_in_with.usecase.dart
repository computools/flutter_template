import 'package:flutter_template/domain/auth/auth.repository.dart';
import 'package:flutter_template/domain/auth/entities/auth_payload.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInWithUsecase {
  final AuthRepository _repository;

  const SignInWithUsecase(this._repository);

  Future<void> call(AuthPayload payload) async {
    return _repository.signInWith(payload);
  }
}
