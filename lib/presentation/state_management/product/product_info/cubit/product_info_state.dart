part of 'product_info_cubit.dart';

enum ProductInfoStatus { initial, loading, success, failure }

final class ProductInfoState extends Equatable {
  final ProductInfoStatus status;
  final Product? product;

  const ProductInfoState({
    this.status = ProductInfoStatus.initial,
    this.product,
  });

  bool get isLoading => status == ProductInfoStatus.loading;
  bool get isSuccess => status == ProductInfoStatus.success;

  ProductInfoState copyWith({
    ProductInfoStatus? status,
    Product? product,
  }) {
    return ProductInfoState(
      status: status ?? this.status,
      product: product ?? this.product,
    );
  }

  @override
  List<Object?> get props => [status, product];
}
