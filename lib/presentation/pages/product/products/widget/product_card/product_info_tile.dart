part of 'product_card.dart';

class _ProductInfoTile extends StatelessWidget {
  final Product product;

  const _ProductInfoTile({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleMedium,
          ),
          Text(
            '\$${product.price.round()}',
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w400,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
