import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/theme/extended_wdget_theme/outlined_card_theme.dart';
import 'package:flutter_template/presentation/theme/theme_extensions.dart';

class OutlinedCard extends StatelessWidget {
  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool borderOnForeground;
  final Clip? clipBehavior;
  final EdgeInsetsGeometry? margin;
  final bool semanticContainer;
  final Widget? child;

  const OutlinedCard({
    super.key,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.shape,
    this.borderOnForeground = true,
    this.clipBehavior,
    this.margin,
    this.semanticContainer = true,
    this.child,
  }) : assert(elevation == null || elevation >= 0.0);

  @override
  Widget build(BuildContext context) {
    final OutlinedCardTheme? theme = context.theme.extension<OutlinedCardTheme>();
    final style = _CardDefaultsStyle(context);

    return Card(
      color: color ?? theme?.color ?? style.color,
      shadowColor: shadowColor ?? theme?.shadowColor ?? style.shadowColor,
      surfaceTintColor: surfaceTintColor ?? theme?.surfaceTintColor ?? style.surfaceTintColor,
      elevation: elevation ?? theme?.elevation ?? style.elevation,
      shape: shape ?? theme?.shape ?? style.shape,
      borderOnForeground: borderOnForeground,
      clipBehavior: clipBehavior ?? theme?.clipBehavior ?? style.clipBehavior,
      margin: margin ?? theme?.margin ?? style.margin,
      semanticContainer: semanticContainer,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: child,
      ),
    );
  }
}

class _CardDefaultsStyle extends CardTheme {
  _CardDefaultsStyle(this.context)
      : super(
          clipBehavior: Clip.none,
          elevation: 0.0,
          margin: const EdgeInsets.all(4.0),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: _getBorderColor(context),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
            ),
          ),
        );

  final BuildContext context;
  static Color _getBorderColor(BuildContext context) => Theme.of(context).colorScheme.outline;

  @override
  Color? get color => Theme.of(context).colorScheme.surface;

  @override
  Color? get shadowColor => Theme.of(context).colorScheme.shadow;

  @override
  Color? get surfaceTintColor => Theme.of(context).colorScheme.surfaceTint;
}
