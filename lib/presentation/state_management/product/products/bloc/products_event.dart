part of 'products_bloc.dart';

sealed class ProductsEvent {}

class ProductsLoad extends ProductsEvent {
  final ProductFilter filter;

  ProductsLoad(this.filter);

  factory ProductsLoad.empty() => ProductsLoad(ProductFilter());
}

class ProductsLoadMore extends ProductsEvent {}

class ProductsRefresh extends ProductsEvent {
  final ProductFilter filter;

  ProductsRefresh(this.filter);

  factory ProductsRefresh.empty() => ProductsRefresh(ProductFilter());
}
