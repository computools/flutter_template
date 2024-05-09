import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/theme/theme_extensions.dart';
import 'package:flutter_template/presentation/ui_kit/app_shimmer.dart';

const double _padding8 = 8.0;
const double _padding26 = 26.0;

const double _borderRadius = 24.0;

const double _cardHeight = 200.0;

class ProductImages extends StatelessWidget {
  final PageController? pageController;
  final List<String>? imagesUrls;

  const ProductImages._({
    super.key,
    this.pageController,
    this.imagesUrls,
  });

  factory ProductImages.loading([Key? key]) {
    return ProductImages._(key: key);
  }

  factory ProductImages.view({
    Key? key,
    required PageController? pageController,
    required List<String>? imagesUrls,
  }) {
    return ProductImages._(
      key: key,
      pageController: pageController,
      imagesUrls: imagesUrls,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (pageController == null) {
      return SliverToBoxAdapter(
        child: SizedBox(
          height: _cardHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: _padding26),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(_borderRadius),
              child: AppShimmer(
                child: Container(color: context.colorScheme.primary),
              ),
            ),
          ),
        ),
      );
    }

    return SliverToBoxAdapter(
      child: SizedBox(
        height: _cardHeight,
        child: PageView.builder(
          controller: pageController,
          itemCount: imagesUrls!.length,
          itemBuilder: (context, index) {
            final images = imagesUrls!.reversed.toList();
            final image = images[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: _padding8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(_borderRadius),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
