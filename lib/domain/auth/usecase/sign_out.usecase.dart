import 'package:flutter_template/domain/auth/auth.repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignOutUsecase {
  final AuthRepository _repository;

  const SignOutUsecase(this._repository);

  Future<void> call() async {
    return _repository.signOut();
  }
}
