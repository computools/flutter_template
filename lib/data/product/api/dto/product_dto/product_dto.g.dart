// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) => ProductDTO(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      category: CategoryDTO.fromJson(json['category'] as Map<String, dynamic>),
      description: json['description'] as String,
      imagesUrls:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

CategoryDTO _$CategoryDTOFromJson(Map<String, dynamic> json) => CategoryDTO(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      imageUrl: json['image'] as String,
    );
