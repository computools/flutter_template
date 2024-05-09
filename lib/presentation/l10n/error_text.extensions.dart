import 'package:flutter/material.dart';
// import 'package:flutter_template/domain/auth/auth_exception.dart';

import 'package:flutter_template/presentation/l10n/localizations.extensions.dart';


extension ErrorTextExtension on BuildContext {
  String? textByError(dynamic error) {
    // if (error is AuthException) {
    //   return switch (error) {
    //     WrongSignInCredentials() => locale.wrongSignInData,
    //     ExpiredToken() => locale.expiredTokenException,
    //   };
    // }

    return locale.unknownErrorInfoException(error.toString());
  }
}
