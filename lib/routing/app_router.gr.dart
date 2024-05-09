// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ProductInfoRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductInfoRouteArgs>(
          orElse: () => ProductInfoRouteArgs(
                  productId: pathParams.getInt(
                'id',
                -1,
              )));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ProductInfoPage(
          key: args.key,
          productId: args.productId,
        )),
      );
    },
    ProductsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ProductsPage()),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SignInPage()),
      );
    },
  };
}

/// generated route for
/// [ProductInfoPage]
class ProductInfoRoute extends PageRouteInfo<ProductInfoRouteArgs> {
  ProductInfoRoute({
    Key? key,
    int productId = -1,
    List<PageRouteInfo>? children,
  }) : super(
          ProductInfoRoute.name,
          args: ProductInfoRouteArgs(
            key: key,
            productId: productId,
          ),
          rawPathParams: {'id': productId},
          initialChildren: children,
        );

  static const String name = 'ProductInfoRoute';

  static const PageInfo<ProductInfoRouteArgs> page =
      PageInfo<ProductInfoRouteArgs>(name);
}

class ProductInfoRouteArgs {
  const ProductInfoRouteArgs({
    this.key,
    this.productId = -1,
  });

  final Key? key;

  final int productId;

  @override
  String toString() {
    return 'ProductInfoRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [ProductsPage]
class ProductsRoute extends PageRouteInfo<void> {
  const ProductsRoute({List<PageRouteInfo>? children})
      : super(
          ProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
