import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/l10n/localizations.extensions.dart';

import 'package:reactive_forms/reactive_forms.dart';

enum _ValidationType { required }

class PasswordField extends StatefulWidget {
  final String formControlName;

  const PasswordField({
    super.key,
    required this.formControlName,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  String get _formControlName => widget.formControlName;

  void toggleObscure() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final iconData = obscureText ? Icons.visibility : Icons.visibility_off;

    return ReactiveTextField(
      formControlName: _formControlName,
      decoration: InputDecoration(
        hintText: context.locale.password,
        suffixIcon: IconButton(
          icon: Icon(iconData),
          onPressed: toggleObscure,
        ),
      ),
      validationMessages: {
        _ValidationType.required.name: (error) {
          return context.locale.requiredField(context.locale.password);
        },
      },
      obscureText: obscureText,
    );
  }
}
