import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/theme/theme_extensions.dart';

import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  final Widget child;

  const AppShimmer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colorScheme.surfaceVariant,
      highlightColor: context.colorScheme.surface,
      child: child,
    );
  }
}
