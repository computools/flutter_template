import 'package:dio/dio.dart';
import 'package:flutter_template/data/product/api/dto/product_dto/product_dto.dart';
import 'package:flutter_template/data/product/api/dto/product_filter_dto/product_filter_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'product_api.client.g.dart';

@lazySingleton
@RestApi()
abstract class ProductApiClient {
  @factoryMethod
  factory ProductApiClient(Dio dio) = _ProductApiClient;

  static const String _productsUrl = '/api/v1/products';

  @GET(_productsUrl)
  Future<List<ProductDTO>> fetchProducts(@Queries() ProductFilterDTO filter);

  @GET('$_productsUrl/{id}')
  Future<ProductDTO> fetchProduct(@Path() int id);
}
