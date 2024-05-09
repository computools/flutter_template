import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/theme/app_colors.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;
}

extension ColorSchemeExtension on ColorScheme {
  static const _surface = AppColors.surface;
  static const _darkSurface = AppColors.darkSurface;

  static const _darkPrimary = AppColors.darkPrimary;
  static const _primary = AppColors.primary;

  static final Color _surface1 = ElevationOverlay.colorWithOverlay(_surface, _primary, 5.0);
  static final Color _darkSurface1 =
      ElevationOverlay.colorWithOverlay(_darkSurface, _darkPrimary, 5.0);

  Color get surface1 => brightness == Brightness.light ? _surface1 : _darkSurface1;

  static final Color _surface2 = ElevationOverlay.colorWithOverlay(_surface, _primary, 8.0);
  static final Color _darkSurface2 =
      ElevationOverlay.colorWithOverlay(_darkSurface, _darkPrimary, 8.0);

  Color get surface2 => brightness == Brightness.light ? _surface2 : _darkSurface2;

  static final Color _surface3 = ElevationOverlay.colorWithOverlay(_surface, _primary, 11.0);
  static final Color _darkSurface3 =
      ElevationOverlay.colorWithOverlay(_darkSurface, _darkPrimary, 11.0);

  Color get surface3 => brightness == Brightness.light ? _surface3 : _darkSurface3;

  static final Color _surface4 = ElevationOverlay.colorWithOverlay(_surface, _primary, 12.0);
  static final Color _darkSurface4 =
      ElevationOverlay.colorWithOverlay(_darkSurface, _darkPrimary, 12.0);

  Color get surface4 => brightness == Brightness.light ? _surface4 : _darkSurface4;

  static final Color _surface5 = ElevationOverlay.colorWithOverlay(_surface, _primary, 14.0);
  static final Color _darkSurface5 =
      ElevationOverlay.colorWithOverlay(_darkSurface, _darkPrimary, 14.0);

  Color get surface5 => brightness == Brightness.light ? _surface5 : _darkSurface5;
}
