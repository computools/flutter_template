import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/theme/app_colors.dart';
import 'package:flutter_template/presentation/theme/theme_extensions.dart';

class LightTheme {
  static const _colorScheme = ColorScheme.light(
    primary: AppColors.primary,
    inversePrimary: AppColors.inversePrimary,
    primaryContainer: AppColors.primaryContainer,
    onPrimary: AppColors.onPrimary,
    onPrimaryContainer: AppColors.onPrimaryContainer,
    secondary: AppColors.secondary,
    secondaryContainer: AppColors.secondaryContainer,
    onSecondary: AppColors.onSecondary,
    onSecondaryContainer: AppColors.onSecondaryContainer,
    tertiary: AppColors.tertiary,
    tertiaryContainer: AppColors.tertiaryContainer,
    onTertiary: AppColors.onTertiary,
    onTertiaryContainer: AppColors.onTertiaryContainer,
    error: AppColors.error,
    errorContainer: AppColors.errorContainer,
    onError: AppColors.onError,
    onErrorContainer: AppColors.onErrorContainer,
    background: AppColors.background,
    onBackground: AppColors.onBackground,
    surface: AppColors.surface,
    inverseSurface: AppColors.inverseSurface,
    onSurface: AppColors.onSurface,
    surfaceVariant: AppColors.surfaceVariant,
    onSurfaceVariant: AppColors.onSurfaceVariant,
    surfaceTint: AppColors.surfaceTint,
    onInverseSurface: AppColors.onInverseSurface,
    outline: AppColors.outline,
    shadow: AppColors.shadow,
    outlineVariant: AppColors.outlineVariant,
    scrim: AppColors.scrim,
  );

  static ThemeData getTheme(BuildContext context) {
    final themeData = ThemeData.from(colorScheme: _colorScheme);

    return themeData.copyWith(
      dialogBackgroundColor: _colorScheme.surface3,
      primaryColorDark: AppColors.primary,
      chipTheme: const ChipThemeData(
        padding: EdgeInsets.zero,
        checkmarkColor: AppColors.onSecondaryContainer,
        iconTheme: IconThemeData(color: AppColors.primary, size: 18.0),
      ),
      iconTheme: const IconThemeData(color: AppColors.outline),
      inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
      searchBarTheme: SearchBarThemeData(
        elevation: const MaterialStatePropertyAll(0.0),
        backgroundColor: MaterialStatePropertyAll(_colorScheme.surface3),
        textStyle: MaterialStatePropertyAll(
          context.textTheme.bodyLarge?.copyWith(color: _colorScheme.onSurface),
        ),
        hintStyle: MaterialStatePropertyAll(
          context.textTheme.bodyLarge?.copyWith(color: _colorScheme.onSurfaceVariant),
        ),
      ),
    );
  }
}
