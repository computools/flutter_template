import 'package:flutter_template/domain/auth/auth.repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RefreshTokenUsecase {
  final AuthRepository _authRepository;

  const RefreshTokenUsecase(this._authRepository);

  Future<void> call() async {
    return _authRepository.refreshToken();
  }
}
