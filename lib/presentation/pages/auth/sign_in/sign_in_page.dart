import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/presentation/l10n/localizations.extensions.dart';
import 'package:flutter_template/presentation/pages/auth/sign_in/widget/email_field.dart';
import 'package:flutter_template/presentation/pages/auth/sign_in/widget/password_field.dart';
import 'package:flutter_template/presentation/state_management/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:reactive_forms/reactive_forms.dart';

enum SignInFormKeys { email, password }

@RoutePage()
class SignInPage extends StatefulWidget implements AutoRouteWrapper {
  const SignInPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (context) => context.read<GetIt>().get(),
      child: this,
    );
  }

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _form = FormGroup({
    SignInFormKeys.email.name: FormControl<String>(
      value: 'john@mail.com',
      validators: [
        Validators.required,
        Validators.email,
      ],
    ),
    SignInFormKeys.password.name: FormControl<String>(
      value: 'changeme',
      validators: [Validators.required],
    ),
  });

  Future<void> _onSignIn() async {
    _removeFocus();

    final signInCubit = context.read<SignInCubit>();
    await signInCubit.signIn(
      email: _form.control(SignInFormKeys.email.name).value as String,
      password: _form.control(SignInFormKeys.password.name).value as String,
    );
  }

  void _removeFocus() => _form.unfocus();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _removeFocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.locale.signInScreen),
        ),
        body: _SignInFormWrapper(
          formGroup: _form,
          children: [
            EmailField(
              formControlName: SignInFormKeys.email.name,
              onSubmitted: (_) => _form.focus(SignInFormKeys.password.name),
            ),
            const Divider(color: Colors.transparent),
            PasswordField(
              formControlName: SignInFormKeys.password.name,
            ),
            const Divider(),
            ReactiveFormConsumer(
              builder: (context, form, _) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: form.valid ? _onSignIn : null,
                    child: Text(context.locale.signInButton.toUpperCase()),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SignInFormWrapper extends StatelessWidget {
  final FormGroup formGroup;
  final List<Widget> children;

  const _SignInFormWrapper({
    required this.formGroup,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return DividerTheme(
      data: const DividerThemeData(color: Colors.transparent),
      child: ReactiveForm(
        formGroup: formGroup,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}
