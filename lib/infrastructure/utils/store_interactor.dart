import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum StoreInteractorKeys {
  authToken('AUTH_TOKEN'),
  refreshToken('REFRESH_TOKEN');

  const StoreInteractorKeys(this.name);

  final String name;
}

class StoreInteractor {
  final SharedPreferences _sharedPreferences;

  static Future<StoreInteractor> create() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    return StoreInteractor._(sharedPreferences);
  }

  StoreInteractor._(this._sharedPreferences);

  String? getAccessToken() {
    return _sharedPreferences.getString(StoreInteractorKeys.authToken.name);
  }

  String? getRefreshToken() {
    return _sharedPreferences.getString(StoreInteractorKeys.refreshToken.name);
  }

  Future<void> setAccessToken(String token) async {
    await _sharedPreferences.setString(StoreInteractorKeys.authToken.name, token);
  }

  Future<void> setRefreshToken(String token) async {
    await _sharedPreferences.setString(StoreInteractorKeys.refreshToken.name, token);
  }

  Future<void> clearStorage() async {
    final keys = _sharedPreferences.getKeys();
    for (final key in keys) {
      await _sharedPreferences.remove(key);
    }
  }
}

@module
abstract class StorageModule {
  @preResolve
  @singleton
  Future<StoreInteractor> getInteractor() => StoreInteractor.create();
}
