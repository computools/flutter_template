import 'package:flutter_template/domain/product/entities/category.dart';
import 'package:flutter_template/domain/product/entities/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_dto.g.dart';

@JsonSerializable(createToJson: false)
class ProductDTO {
  final int? id;
  final String title;
  final double price;
  final CategoryDTO category;
  final String description;
  @JsonKey(name: 'images')
  final List<String> imagesUrls;

  const ProductDTO({
    this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.imagesUrls,
  });

  Product toDomain() {
    return Product(
      id: id,
      title: title,
      price: price,
      category: category.toDomain(),
      description: description,
      imagesUrls: imagesUrls,
    );
  }

  factory ProductDTO.fromJson(Map<String, dynamic> json) => _$ProductDTOFromJson(json);
}

@JsonSerializable(createToJson: false)
class CategoryDTO {
  final int? id;
  final String name;
  @JsonKey(name: 'image')
  final String imageUrl;

  const CategoryDTO({
    this.id,
    required this.name,
    required this.imageUrl,
  });

  Category toDomain() {
    return Category(
      id: id,
      name: name,
      imageUrl: imageUrl,
    );
  }

  factory CategoryDTO.fromJson(Map<String, dynamic> json) => _$CategoryDTOFromJson(json);
}
