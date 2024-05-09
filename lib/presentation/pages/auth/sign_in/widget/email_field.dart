import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/l10n/localizations.extensions.dart';

import 'package:reactive_forms/reactive_forms.dart';

enum EmailValidationMessageKeys { required }

class EmailField extends StatelessWidget {
  final String formControlName;
  final ReactiveFormFieldCallback? onSubmitted;

  const EmailField({
    super.key,
    required this.formControlName,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: formControlName,
      decoration: InputDecoration(hintText: context.locale.username),
      textInputAction: TextInputAction.go,
      onSubmitted: onSubmitted,
      validationMessages: {
        EmailValidationMessageKeys.required.name: (error) {
          return context.locale.requiredField(context.locale.username);
        },
      },
    );
  }
}
