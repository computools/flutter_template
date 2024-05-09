import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/localizations.dart';

extension AppLocalizationsExtension on BuildContext {
  AppLocalizations get locale => AppLocalizations.of(this)!;
}
