import 'package:flutter_template/data/product/api/client/product_api.client.dart';
import 'package:flutter_template/data/product/api/dto/product_filter_dto/product_filter_dto.dart';
import 'package:flutter_template/domain/product/entities/product.dart';
import 'package:flutter_template/domain/product/entities/product_filter.dart';
import 'package:flutter_template/domain/product/product.repository.dart';
import 'package:flutter_template/infrastructure/config/env.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRepository, env: [Env.dev, Env.prod])
class HttpProductRepository implements ProductRepository {
  final ProductApiClient _productApiClient;

  HttpProductRepository(
    this._productApiClient,
  );

  @override
  Future<List<Product>> fetchProducts(ProductFilter filter) async {
    final productFilterDTO = ProductFilterDTO(filter.limit, filter.offset);
    try {
      final productsDTO = await _productApiClient.fetchProducts(productFilterDTO);
      return productsDTO.map((dto) => dto.toDomain()).toList();
    } catch (error) {
      throw UnimplementedError();
    }
  }

  @override
  Future<Product> fetchProduct(int id) async {
    try {
      final productDTO = await _productApiClient.fetchProduct(id);

      return productDTO.toDomain();
    } catch (error) {
      throw UnimplementedError();
    }
  }
}
