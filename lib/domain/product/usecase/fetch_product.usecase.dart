import 'package:flutter_template/domain/product/entities/product.dart';
import 'package:flutter_template/domain/product/product.repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchProductUsecase {
  final ProductRepository _repository;

  const FetchProductUsecase(this._repository);

  Future<Product> call(int id) async {
    return _repository.fetchProduct(id);
  }
}
