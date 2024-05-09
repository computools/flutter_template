import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/domain/product/entities/product.dart';
import 'package:flutter_template/domain/product/entities/product_filter.dart';
import 'package:flutter_template/domain/product/usecase/fetch_products.usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

part 'products_event.dart';
part 'products_state.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  static ProductsBloc create() {
    return GetIt.instance<ProductsBloc>();
  }

  final FetchProductsUsecase _fetchProductsUsecase;

  ProductsBloc(
    this._fetchProductsUsecase,
  ) : super(ProductsState.initial()) {
    on<ProductsLoad>(_loadList);
    on<ProductsLoadMore>(_loadMore);
    on<ProductsRefresh>(_refresh);
  }

  Future<void> _loadList(ProductsLoad event, Emitter<ProductsState> emit) async {
    emit(
      state.copyWith(
        status: ProductsStatus.loading,
        limit: event.filter.limit,
        offset: event.filter.offset,
      ),
    );

    try {
      final products = await _fetchProductsUsecase(event.filter);
      if (!isClosed) {
        emit(
          state.copyWith(
            status: ProductsStatus.initial,
            products: products,
            hasMore: products.isNotEmpty,
          ),
        );
      }
    } catch (error) {
      if (!isClosed) {
        emit(state.copyWith(
          status: ProductsStatus.failure,
        ));
      }
      rethrow;
    }
  }

  Future<void> _loadMore(ProductsLoadMore event, Emitter<ProductsState> emit) async {
    if (state.status == ProductsStatus.loadingMore || !state.hasMore) return;

    emit(
      state.copyWith(
        status: ProductsStatus.loadingMore,
        offset: state.offset + state.limit,
      ),
    );

    try {
      final filter = ProductFilter();
      final products = await _fetchProductsUsecase(filter.copyWith(offset: state.offset));
      final moreProducts = [...state.products, ...products];
      if (!isClosed) {
        emit(
          state.copyWith(
            status: ProductsStatus.success,
            products: moreProducts,
            hasMore: products.isNotEmpty,
          ),
        );
      }
    } catch (error) {
      if (!isClosed) {
        emit(
          state.copyWith(
            status: ProductsStatus.failure,
            offset: state.offset - state.limit,
          ),
        );
      }
      rethrow;
    }
  }

  Future<void> _refresh(ProductsRefresh event, Emitter<ProductsState> emit) async {
    if (state.status == ProductsStatus.refreshing) return;

    emit(
      state.copyWith(
        status: ProductsStatus.refreshing,
        products: state.products,
        offset: 0,
      ),
    );

    try {
      final products = await _fetchProductsUsecase(event.filter);
      if (!isClosed) {
        emit(
          state.copyWith(
            status: ProductsStatus.success,
            products: products,
            hasMore: products.isNotEmpty,
          ),
        );
      }
    } catch (error) {
      if (!isClosed) {
        emit(state.copyWith(status: ProductsStatus.failure));
      }
      rethrow;
    }
  }
}
