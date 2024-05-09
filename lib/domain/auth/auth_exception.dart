sealed class AuthException implements Exception {}

final class WrongSignInCredentials implements AuthException {
  @override
  String toString() {
    return 'Wrong sign in credentials';
  }
}

final class ExpiredToken implements AuthException {
  @override
  String toString() {
    return 'Expired token';
  }
}
