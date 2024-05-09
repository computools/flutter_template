import 'package:flutter_template/infrastructure/utils/store_interactor.dart';
import 'package:injectable/injectable.dart';

enum TokenType { access, refresh }

@injectable
class GetTokenUsecase {
  final StoreInteractor _storeInteractor;

  const GetTokenUsecase(
    this._storeInteractor,
  );

  String? call(TokenType type) {
    switch (type) {
      case TokenType.access:
        return _storeInteractor.getAccessToken();
      case TokenType.refresh:
        return _storeInteractor.getRefreshToken();
    }
  }
}
