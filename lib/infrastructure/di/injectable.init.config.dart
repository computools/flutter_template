// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:flutter_template/data/auth/api/client/auth_api.client.dart'
    as _i11;
import 'package:flutter_template/data/auth/api/http_auth.repository.dart'
    as _i14;
import 'package:flutter_template/data/auth/mock/mock_auth.repository.dart'
    as _i18;
import 'package:flutter_template/data/product/api/client/product_api.client.dart'
    as _i12;
import 'package:flutter_template/data/product/api/http_product.repository.dart'
    as _i23;
import 'package:flutter_template/data/product/mock/mock_product.repository.dart'
    as _i9;
import 'package:flutter_template/domain/auth/auth.repository.dart' as _i13;
import 'package:flutter_template/domain/auth/usecase/check_is_signed_in.usecase.dart'
    as _i17;
import 'package:flutter_template/domain/auth/usecase/get_token.usecase.dart'
    as _i22;
import 'package:flutter_template/domain/auth/usecase/refresh_token.usecase.dart'
    as _i26;
import 'package:flutter_template/domain/auth/usecase/sign_in_with.usecase.dart'
    as _i16;
import 'package:flutter_template/domain/auth/usecase/sign_out.usecase.dart'
    as _i15;
import 'package:flutter_template/domain/product/product.repository.dart' as _i8;
import 'package:flutter_template/domain/product/usecase/fetch_product.usecase.dart'
    as _i19;
import 'package:flutter_template/domain/product/usecase/fetch_products.usecase.dart'
    as _i20;
import 'package:flutter_template/infrastructure/api_client/api_client.dart'
    as _i29;
import 'package:flutter_template/infrastructure/api_client/interceptors/auth_interceptor.dart'
    as _i28;
import 'package:flutter_template/infrastructure/config/config.dart' as _i4;
import 'package:flutter_template/infrastructure/utils/store_interactor.dart'
    as _i6;
import 'package:flutter_template/presentation/state_management/app_bloc_observer.dart'
    as _i7;
import 'package:flutter_template/presentation/state_management/auth/sign_in/cubit/sign_in_cubit.dart'
    as _i24;
import 'package:flutter_template/presentation/state_management/auth/sign_out/cubit/sign_out_cubit.dart'
    as _i21;
import 'package:flutter_template/presentation/state_management/product/product_info/cubit/product_info_cubit.dart'
    as _i27;
import 'package:flutter_template/presentation/state_management/product/products/bloc/products_bloc.dart'
    as _i25;
import 'package:flutter_template/presentation/ui_kit/snack_bar.dart' as _i5;
import 'package:flutter_template/routing/app_router.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _local = 'local';
const String _production = 'production';
const String _develop = 'develop';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    final dioRegisterModule = _$DioRegisterModule();
    gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.singleton<_i4.AppConfig>(() => _i4.AppConfig());
    gh.singleton<_i5.SnackBarService>(() => _i5.SnackBarService());
    await gh.singletonAsync<_i6.StoreInteractor>(
      () => storageModule.getInteractor(),
      preResolve: true,
    );
    gh.lazySingleton<_i7.AppBlocObserver>(() => const _i7.AppBlocObserver());
    gh.singleton<_i8.ProductRepository>(
      () => _i9.MockProductRepository(),
      registerFor: {_local},
    );
    gh.singleton<_i10.Dio>(
        () => dioRegisterModule.registerClient(gh<_i4.AppConfig>()));
    gh.lazySingleton<_i11.AuthApiClient>(
        () => _i11.AuthApiClient(gh<_i10.Dio>()));
    gh.lazySingleton<_i12.ProductApiClient>(
        () => _i12.ProductApiClient(gh<_i10.Dio>()));
    gh.lazySingleton<_i13.AuthRepository>(
      () => _i14.HttpAuthRepository(
        gh<_i6.StoreInteractor>(),
        gh<_i11.AuthApiClient>(),
      ),
      registerFor: {
        _production,
        _develop,
      },
    );
    gh.factory<_i15.SignOutUsecase>(
        () => _i15.SignOutUsecase(gh<_i13.AuthRepository>()));
    gh.factory<_i16.SignInWithUsecase>(
        () => _i16.SignInWithUsecase(gh<_i13.AuthRepository>()));
    gh.factory<_i17.CheckIsSignedInUsecase>(
        () => _i17.CheckIsSignedInUsecase(gh<_i13.AuthRepository>()));
    gh.lazySingleton<_i13.AuthRepository>(
      () => _i18.MockAuthRepository(gh<_i6.StoreInteractor>()),
      registerFor: {_local},
    );
    gh.factory<_i19.FetchProductUsecase>(
        () => _i19.FetchProductUsecase(gh<_i8.ProductRepository>()));
    gh.factory<_i20.FetchProductsUsecase>(
        () => _i20.FetchProductsUsecase(gh<_i8.ProductRepository>()));
    gh.factory<_i21.SignOutCubit>(() => _i21.SignOutCubit(
          gh<_i15.SignOutUsecase>(),
          gh<_i3.AppRouter>(),
        ));
    gh.factory<_i22.GetTokenUsecase>(
        () => _i22.GetTokenUsecase(gh<_i6.StoreInteractor>()));
    gh.lazySingleton<_i8.ProductRepository>(
      () => _i23.HttpProductRepository(gh<_i12.ProductApiClient>()),
      registerFor: {
        _develop,
        _production,
      },
    );
    gh.factory<_i24.SignInCubit>(() => _i24.SignInCubit(
          gh<_i16.SignInWithUsecase>(),
          gh<_i3.AppRouter>(),
        ));
    gh.factory<_i25.ProductsBloc>(
        () => _i25.ProductsBloc(gh<_i20.FetchProductsUsecase>()));
    gh.factory<_i26.RefreshTokenUsecase>(
        () => _i26.RefreshTokenUsecase(gh<_i13.AuthRepository>()));
    gh.factory<_i27.ProductInfoCubit>(
        () => _i27.ProductInfoCubit(gh<_i19.FetchProductUsecase>()));
    gh.singleton<_i28.AuthInterceptor>(() => _i28.AuthInterceptor(
          gh<_i10.Dio>(),
          gh<_i22.GetTokenUsecase>(),
          gh<_i26.RefreshTokenUsecase>(),
        ));
    gh.singletonAsync<_i10.Interceptors>(
        () => dioRegisterModule.addInterceptors(
              gh<_i10.Dio>(),
              gh<_i28.AuthInterceptor>(),
            ));
    return this;
  }
}

class _$StorageModule extends _i6.StorageModule {}

class _$DioRegisterModule extends _i29.DioRegisterModule {}
