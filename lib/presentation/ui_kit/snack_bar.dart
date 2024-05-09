import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_template/presentation/l10n/localizations.extensions.dart';
import 'package:flutter_template/presentation/l10n/error_text.extensions.dart';

import 'package:flutter_template/presentation/theme/theme_extensions.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@singleton
class SnackBarService {
  late GlobalKey<ScaffoldMessengerState> _messengerKey;

  AppLocalizations get locale => _messengerKey.currentContext!.locale;

  void _setMessengerKey(GlobalKey<ScaffoldMessengerState> key) => _messengerKey = key;

  void showErrorSnackBar(dynamic error, {SnackBarAction? action}) {
    final context = _messengerKey.currentContext;
    final errorText = context?.textByError(error);
    if (context == null || errorText == null) return;

    _messengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(
          errorText,
          style: context.textTheme.bodyLarge!.copyWith(
            color: context.colorScheme.onError,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: context.colorScheme.error,
        action: action,
      ),
    );
  }

  void showDefaultSnackBar(String message, {SnackBarAction? action}) {
    _messengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        action: action,
      ),
    );
  }
}

class SnackBarServiceWrapper extends StatefulWidget {
  final Widget child;

  const SnackBarServiceWrapper({
    super.key,
    required this.child,
  });

  @override
  State<SnackBarServiceWrapper> createState() => _SnackBarServiceWrapperState();
}

class _SnackBarServiceWrapperState extends State<SnackBarServiceWrapper> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    GetIt.I<SnackBarService>()._setMessengerKey(_messengerKey);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _messengerKey,
      child: Scaffold(
        body: widget.child,
      ),
    );
  }
}
