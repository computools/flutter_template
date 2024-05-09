import 'package:equatable/equatable.dart';

class TokenWrapper extends Equatable {
  final String accessToken;
  final String refreshToken;

  const TokenWrapper({
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
