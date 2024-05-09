import 'package:json_annotation/json_annotation.dart';

part 'product_filter_dto.g.dart';

@JsonSerializable()
class ProductFilterDTO {
  int limit;
  int offset;

  ProductFilterDTO(
    this.limit,
    this.offset,
  );

  factory ProductFilterDTO.fromJson(Map<String, dynamic> json) => _$ProductFilterDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductFilterDTOToJson(this);

  @override
  String toString() {
    return 'ProductFilterDTO{limit: $limit, offset: $offset}';
  }
}
