import 'package:flutter_template/domain/product/entities/category.dart';
import 'package:flutter_template/domain/product/entities/product.dart';
import 'package:flutter_template/domain/product/entities/product_filter.dart';
import 'package:flutter_template/domain/product/product.repository.dart';
import 'package:flutter_template/infrastructure/config/env.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ProductRepository, env: [Env.local])
class MockProductRepository implements ProductRepository {
  MockProductRepository();

  @override
  Future<List<Product>> fetchProducts(ProductFilter filter) async {
    await Future.delayed(const Duration(seconds: 2));

    final products = _getProducts();

    return products;
  }

  @override
  Future<Product> fetchProduct(int id) async {
    await Future.delayed(const Duration(seconds: 2));

    final products = _getProducts();
    final specificProduct = products.firstWhere((product) => product.id == id);

    return specificProduct;
  }

  List<Product> _getProducts() {
    return List.generate(
      10,
      (index) => Product(
        id: index,
        title: 'Product Title $index',
        category: const Category(
          id: 1,
          name: 'Category 1',
          imageUrl: '',
        ),
        description: 'Product description $index',
        imagesUrls: const [],
        price: index * 100,
      ),
    );
  }
}
