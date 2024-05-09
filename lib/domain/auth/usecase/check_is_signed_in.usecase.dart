import 'package:flutter_template/domain/auth/auth.repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckIsSignedInUsecase {
  final AuthRepository _repository;

  const CheckIsSignedInUsecase(this._repository);

  bool call() {
    return _repository.isSignedIn();
  }
}
