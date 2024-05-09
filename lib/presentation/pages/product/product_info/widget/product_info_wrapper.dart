import 'package:flutter/material.dart';
import 'package:flutter_template/domain/product/entities/product.dart';
import 'package:flutter_template/presentation/theme/theme_extensions.dart';
import 'package:flutter_template/presentation/ui_kit/app_shimmer.dart';
import 'package:flutter_template/presentation/utils/extensions/media_query.extensions.dart';

const double _indent4 = 4.0;
const double _indent15 = 15.0;
const double _indent35 = 35.0;

const double _borderRadius = 12.0;

class ProductInfoWrapper extends StatelessWidget {
  final Product? product;

  const ProductInfoWrapper._({
    super.key,
    this.product,
  });

  factory ProductInfoWrapper.loading([Key? key]) {
    return ProductInfoWrapper._(key: key);
  }

  factory ProductInfoWrapper.view({
    Key? key,
    required Product product,
  }) {
    return ProductInfoWrapper._(
      key: key,
      product: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: product != null ? _ProductInfo(product: product!) : const _LoadingProductInfo(),
      ),
    );
  }
}

class _ProductInfo extends StatelessWidget {
  final Product product;

  const _ProductInfo({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: _indent15),
        Text(
          product.title,
          style: context.textTheme.headlineSmall,
        ),
        Text(
          '\$${product.price}',
          style: context.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w400,
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: _indent15),
        Text(
          product.description,
          style: context.textTheme.bodyLarge,
        ),
        const SizedBox(height: _indent35),
      ],
    );
  }
}

class _LoadingProductInfo extends StatelessWidget {
  const _LoadingProductInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: _indent15),
        AppShimmer(
          child: _LoadingText(
            height: context.textTheme.headlineSmall!.fontSize!,
            width: context.screenWidth * 0.8,
          ),
        ),
        const SizedBox(height: _indent4),
        AppShimmer(
          child: _LoadingText(
            height: context.textTheme.titleLarge!.fontSize!,
            width: context.screenWidth * 0.3,
          ),
        ),
        const SizedBox(height: _indent15),
        AppShimmer(
          child: _LoadingText(
            height: context.textTheme.bodyLarge!.fontSize!,
            width: context.screenWidth * 0.9,
          ),
        ),
        const SizedBox(height: _indent4),
        AppShimmer(
          child: _LoadingText(
            height: context.textTheme.bodyLarge!.fontSize!,
            width: context.screenWidth * 0.95,
          ),
        ),
        const SizedBox(height: _indent4),
        AppShimmer(
          child: _LoadingText(
            height: context.textTheme.bodyLarge!.fontSize!,
            width: context.screenWidth * 0.85,
          ),
        ),
        const SizedBox(height: _indent35),
      ],
    );
  }
}

class _LoadingText extends StatelessWidget {
  final double height;
  final double width;

  const _LoadingText({
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
    );
  }
}
