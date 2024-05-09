import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';

sealed class AuthPayload extends Equatable {}

class EmailSignIn extends AuthPayload {
  static bool _validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  final String email;
  final String password;

  EmailSignIn(this.email, this.password) : assert(_validateEmail(email));

  @override
  List<Object?> get props => [email, password];
}
