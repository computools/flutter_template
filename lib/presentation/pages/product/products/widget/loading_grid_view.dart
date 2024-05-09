import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/pages/product/products/product_grid_values.dart';
import 'package:flutter_template/presentation/theme/theme_extensions.dart';
import 'package:flutter_template/presentation/ui_kit/card/outlined_card.dart';

import 'package:shimmer/shimmer.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

const double _height = 285.0;

class LoadingGridView extends StatelessWidget {
  const LoadingGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WaterfallFlow.count(
      padding: const EdgeInsets.all(8.0),
      crossAxisCount: ProductGridValues.crossAxisCount,
      mainAxisSpacing: ProductGridValues.axisSpacing,
      crossAxisSpacing: ProductGridValues.axisSpacing,
      children: List.generate(4, (index) {
        return const LoadingCard();
      }),
    );
  }
}

class LoadingCard extends StatelessWidget {
  const LoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colorScheme.surfaceVariant,
      highlightColor: context.colorScheme.surface,
      child: const SizedBox(
        height: _height,
        child: OutlinedCard(),
      ),
    );
  }
}
