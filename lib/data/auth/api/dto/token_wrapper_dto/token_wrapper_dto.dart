import 'package:json_annotation/json_annotation.dart';

part 'token_wrapper_dto.g.dart';

@JsonSerializable(createToJson: false)
class TokenWrapperDTO {
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  TokenWrapperDTO(
    this.accessToken,
    this.refreshToken,
  );

  factory TokenWrapperDTO.fromJson(Map<String, dynamic> json) => _$TokenWrapperDTOFromJson(json);

  @override
  String toString() {
    return 'TokenWrapperDTO{accessToken: $accessToken, refreshToken: $refreshToken}';
  }
}
