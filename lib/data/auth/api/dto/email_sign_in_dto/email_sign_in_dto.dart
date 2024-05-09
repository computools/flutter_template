import 'package:json_annotation/json_annotation.dart';

part 'email_sign_in_dto.g.dart';

@JsonSerializable(createFactory: false)
class EmailSignInDTO {
  final String email;
  final String password;

  EmailSignInDTO({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$EmailSignInDTOToJson(this);
}
