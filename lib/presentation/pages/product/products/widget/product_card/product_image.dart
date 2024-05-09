part of 'product_card.dart';

const double _imageHeight = 200.0;
const double _borderRadius = 12.0;

class _ProductImage extends StatelessWidget {
  final String? image;

  const _ProductImage({
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final background =
        image != null ? NetworkImage(image!) : AssetImage(Assets.images.noImagePlaceholder.path);
    return Ink(
      height: _imageHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: context.colorScheme.surfaceVariant),
        borderRadius: BorderRadius.circular(_borderRadius),
        image: DecorationImage(
          image: background as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
