import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class OutlinedCardTheme extends ThemeExtension<OutlinedCardTheme> {
  final Clip? clipBehavior;
  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final EdgeInsetsGeometry? margin;
  final ShapeBorder? shape;

  const OutlinedCardTheme({
    this.clipBehavior,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.margin,
    this.shape,
  });

  @override
  OutlinedCardTheme copyWith({
    Clip? clipBehavior,
    Color? color,
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    EdgeInsetsGeometry? margin,
    ShapeBorder? shape,
  }) {
    return OutlinedCardTheme(
      clipBehavior: clipBehavior ?? this.clipBehavior,
      color: color ?? this.color,
      shadowColor: shadowColor ?? this.shadowColor,
      surfaceTintColor: surfaceTintColor ?? this.surfaceTintColor,
      elevation: elevation ?? this.elevation,
      margin: margin ?? this.margin,
      shape: shape ?? this.shape,
    );
  }

  @override
  ThemeExtension<OutlinedCardTheme> lerp(ThemeExtension<OutlinedCardTheme>? other, double t) {
    if (other is! OutlinedCardTheme) {
      return this;
    }

    return OutlinedCardTheme(
      clipBehavior: t < 0.5 ? clipBehavior : other.clipBehavior,
      color: Color.lerp(color, other.color, t),
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t),
      surfaceTintColor: Color.lerp(surfaceTintColor, other.surfaceTintColor, t),
      elevation: lerpDouble(elevation, other.elevation, t),
      margin: EdgeInsetsGeometry.lerp(margin, other.margin, t),
      shape: ShapeBorder.lerp(shape, other.shape, t),
    );
  }

  @override
  int get hashCode => Object.hash(
        clipBehavior,
        color,
        shadowColor,
        surfaceTintColor,
        elevation,
        margin,
        shape,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is CardTheme &&
        other.clipBehavior == clipBehavior &&
        other.color == color &&
        other.shadowColor == shadowColor &&
        other.surfaceTintColor == surfaceTintColor &&
        other.elevation == elevation &&
        other.margin == margin &&
        other.shape == shape;
  }

  @override
  String toString() {
    return 'OutlinedCardTheme{clipBehavior: $clipBehavior, color: $color, shadowColor: $shadowColor, surfaceTintColor: $surfaceTintColor, elevation: $elevation, margin: $margin, shape: $shape}';
  }
}
