import 'package:flutter_template/domain/product/entities/product.dart';
import 'package:flutter_template/domain/product/entities/product_filter.dart';

abstract interface class ProductRepository {
  Future<List<Product>> fetchProducts(ProductFilter filter);

  Future<Product> fetchProduct(int id);
}
