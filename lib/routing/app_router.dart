import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/pages/auth/sign_in/sign_in_page.dart';
import 'package:flutter_template/presentation/pages/product/product_info/product_info_page.dart';
import 'package:flutter_template/presentation/pages/product/products/products_page.dart';
import 'package:injectable/injectable.dart';

part 'app_router.gr.dart';

@LazySingleton(order: -1)
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  AppRouter() : super();

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: SignInRoute.page,
      path: '/',
    ),
    AutoRoute(
      page: ProductsRoute.page,
      path: '/products',
    ),
    AutoRoute(
      page: ProductInfoRoute.page,
      path: '/products/:id',
    ),
  ];
}
