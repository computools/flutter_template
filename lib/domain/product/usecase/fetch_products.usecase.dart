import 'package:flutter_template/domain/product/entities/product.dart';
import 'package:flutter_template/domain/product/product.repository.dart';
import 'package:flutter_template/domain/product/entities/product_filter.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchProductsUsecase {
  final ProductRepository _repository;

  const FetchProductsUsecase(this._repository);

  Future<List<Product>> call(ProductFilter productFilter) async {
    return _repository.fetchProducts(productFilter);
  }
}
