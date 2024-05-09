import 'package:flutter/material.dart';
import 'package:flutter_template/domain/product/entities/product.dart';
import 'package:flutter_template/presentation/theme/theme_extensions.dart';
import 'package:flutter_template/presentation/ui_kit/card/outlined_card.dart';
import 'package:flutter_template/presentation/utils/assets/assets.gen.dart';

part 'product_image.dart';
part 'product_info_tile.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Function(int productId)? onPressed;

  const ProductCard({
    super.key,
    required this.product,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedCard(
      child: Material(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed != null ? () => _onPressed() : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _ProductImage(image: product.imagesUrls.isNotEmpty ? product.imagesUrls.first : null),
              _ProductInfoTile(product: product),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed() {
    if (product.id != null) {
      onPressed!(product.id!);
    }
  }
}
