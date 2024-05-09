import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/domain/product/entities/product.dart';
import 'package:flutter_template/domain/product/usecase/fetch_product.usecase.dart';
import 'package:injectable/injectable.dart';

part 'product_info_state.dart';

@injectable
class ProductInfoCubit extends Cubit<ProductInfoState> {
  final FetchProductUsecase _fetchProductUsecase;

  ProductInfoCubit(this._fetchProductUsecase) : super(const ProductInfoState());

  Future<void> fetchProduct(int id) async {
    emit(state.copyWith(
      status: ProductInfoStatus.loading,
    ));

    try {
      final product = await _fetchProductUsecase(id);
      if (!isClosed) {
        emit(state.copyWith(
          status: ProductInfoStatus.success,
          product: product,
        ));
      }
    } catch (error) {
      if (!isClosed) {
        emit(state.copyWith(
          status: ProductInfoStatus.failure,
        ));
      }
      rethrow;
    }
  }
}
