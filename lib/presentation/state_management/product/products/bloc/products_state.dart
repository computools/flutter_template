part of 'products_bloc.dart';

enum ProductsStatus { initial, loading, loadingMore, refreshing, success, failure }

final class ProductsState extends Equatable {
  final ProductsStatus status;
  final List<Product> products;

  final int offset;
  final int limit;

  final bool hasMore;

  const ProductsState._({
    required this.status,
    required this.products,
    required this.offset,
    required this.limit,
    required this.hasMore,
  });

  factory ProductsState.initial() {
    final filter = ProductFilter();

    return ProductsState._(
      status: ProductsStatus.initial,
      products: const [],
      offset: filter.offset,
      limit: filter.limit,
      hasMore: true,
    );
  }

  ProductsState copyWith({
    ProductsStatus? status,
    List<Product>? products,
    int? offset,
    int? limit,
    bool? hasMore,
  }) {
    return ProductsState._(
      status: status ?? this.status,
      products: products ?? this.products,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  List<Object?> get props => [status, products, offset, limit, hasMore];
}
