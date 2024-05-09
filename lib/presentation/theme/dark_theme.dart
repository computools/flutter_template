import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/theme/app_colors.dart';
import 'package:flutter_template/presentation/theme/theme_extensions.dart';

class DarkTheme {
  static const _colorScheme = ColorScheme.dark(
    primary: AppColors.darkPrimary,
    inversePrimary: AppColors.darkInversePrimary,
    primaryContainer: AppColors.darkPrimaryContainer,
    onPrimary: AppColors.darkOnPrimary,
    onPrimaryContainer: AppColors.darkOnPrimaryContainer,
    secondary: AppColors.darkSecondary,
    secondaryContainer: AppColors.darkSecondaryContainer,
    onSecondary: AppColors.darkOnSecondary,
    onSecondaryContainer: AppColors.darkOnSecondaryContainer,
    tertiary: AppColors.darkTertiary,
    tertiaryContainer: AppColors.darkTertiaryContainer,
    onTertiary: AppColors.darkOnTertiary,
    onTertiaryContainer: AppColors.darkOnTertiaryContainer,
    error: AppColors.darkError,
    errorContainer: AppColors.darkErrorContainer,
    onError: AppColors.darkOnError,
    onErrorContainer: AppColors.darkOnErrorContainer,
    background: AppColors.darkBackground,
    onBackground: AppColors.darkOnBackground,
    surface: AppColors.darkSurface,
    inverseSurface: AppColors.darkInverseSurface,
    onSurface: AppColors.darkOnSurface,
    onInverseSurface: AppColors.darkOnInverseSurface,
    surfaceVariant: AppColors.darkSurfaceVariant,
    onSurfaceVariant: AppColors.darkOnSurfaceVariant,
    surfaceTint: AppColors.darkSurfaceTint,
    outline: AppColors.darkOutline,
    shadow: AppColors.shadow,
  );

  static ThemeData getTheme(BuildContext context) {
    final themeData = ThemeData.from(colorScheme: _colorScheme);

    return themeData.copyWith(
      dialogBackgroundColor: _colorScheme.surface3,
      primaryColorDark: AppColors.darkPrimary,
      chipTheme: const ChipThemeData(
        padding: EdgeInsets.zero,
        checkmarkColor: AppColors.darkOnSecondaryContainer,
        iconTheme: IconThemeData(color: AppColors.darkPrimary, size: 18.0),
      ),
      iconTheme: const IconThemeData(color: AppColors.darkOnSurfaceVariant),
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
