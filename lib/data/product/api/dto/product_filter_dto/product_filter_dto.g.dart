// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductFilterDTO _$ProductFilterDTOFromJson(Map<String, dynamic> json) =>
    ProductFilterDTO(
      (json['limit'] as num).toInt(),
      (json['offset'] as num).toInt(),
    );

Map<String, dynamic> _$ProductFilterDTOToJson(ProductFilterDTO instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
    };
