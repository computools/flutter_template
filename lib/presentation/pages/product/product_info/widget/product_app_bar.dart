import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/theme/theme_extensions.dart';
import 'package:flutter_template/presentation/ui_kit/app_shimmer.dart';
import 'package:flutter_template/presentation/utils/assets/assets.gen.dart';

const double _borderRadius = 24.0;

enum BackgroundType { image, placeholder, shimmer }

class ProductAppBar extends StatelessWidget {
  final String? imageUrl;
  final BackgroundType type;

  const ProductAppBar._({
    super.key,
    this.imageUrl,
    required this.type,
  });

  factory ProductAppBar.loading([Key? key]) {
    return ProductAppBar._(
      key: key,
      type: BackgroundType.shimmer,
    );
  }

  factory ProductAppBar.imageView({
    Key? key,
    required String imageUrl,
  }) {
    return ProductAppBar._(
      key: key,
      imageUrl: imageUrl,
      type: BackgroundType.image,
    );
  }

  factory ProductAppBar.placeholderView({Key? key}) {
    return ProductAppBar._(
      key: key,
      type: BackgroundType.placeholder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      snap: true,
      floating: true,
      stretch: true,
      automaticallyImplyLeading: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.3,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: _Background(
          imageUrl: imageUrl,
          type: type,
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  final String? imageUrl;
  final BackgroundType type;

  const _Background({
    required this.imageUrl,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null && type == BackgroundType.image) {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(_borderRadius),
          bottomRight: Radius.circular(_borderRadius),
        ),
        child: Image.network(
          imageUrl!,
          fit: BoxFit.cover,
        ),
      );
    } else if (type == BackgroundType.placeholder) {
      return ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(_borderRadius),
          bottomRight: Radius.circular(_borderRadius),
        ),
        child: Image.asset(
          Assets.images.noImagePlaceholder.path,
          fit: BoxFit.cover,
        ),
      );
    }

    return AppShimmer(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(_borderRadius),
          bottomRight: Radius.circular(_borderRadius),
        ),
        child: Container(color: context.colorScheme.onPrimary),
      ),
    );
  }
}
