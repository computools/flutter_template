import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/domain/product/entities/product.dart';
import 'package:flutter_template/presentation/l10n/localizations.extensions.dart';
import 'package:flutter_template/presentation/pages/product/products/product_grid_values.dart';
import 'package:flutter_template/presentation/pages/product/products/widget/loading_grid_view.dart';
import 'package:flutter_template/presentation/pages/product/products/widget/product_card/product_card.dart';
import 'package:flutter_template/presentation/state_management/auth/sign_out/cubit/sign_out_cubit.dart';
import 'package:flutter_template/presentation/state_management/product/products/bloc/products_bloc.dart';
import 'package:flutter_template/routing/app_router.dart';
import 'package:get_it/get_it.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

const double _padding8 = 8.0;
const double _padding20 = 8.0;

@RoutePage()
class ProductsPage extends StatefulWidget implements AutoRouteWrapper {
  const ProductsPage({
    super.key,
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsBloc>(
          create: (context) => context.read<GetIt>().get(),
        ),
        BlocProvider<SignOutCubit>(
          create: (context) => context.read<GetIt>().get(),
        ),
      ],
      child: this,
    );
  }
}

class _ProductsPageState extends State<ProductsPage> {
  late ScrollController _scrollController;

  ProductsBloc get _bloc => context.read<ProductsBloc>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _bloc.add(ProductsLoad.empty());
    });
    _scrollController = ScrollController();
    _loadMore();
  }

  void _loadMore() {
    _scrollController.addListener(() {
      final triggerFetchMoreSize = 0.9 * _scrollController.position.maxScrollExtent;

      if (_scrollController.position.pixels > triggerFetchMoreSize && _bloc.state.hasMore) {
        _bloc.add(ProductsLoadMore());
      }
    });
  }

  Future<void> _onRefresh() async {
    _bloc.add(ProductsRefresh.empty());
    await _bloc.stream.firstWhere((state) => state.status == ProductsStatus.success);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.productsPage),
        actions: [
          IconButton(
            onPressed: context.read<SignOutCubit>().signOut,
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state.status != ProductsStatus.loading) {
            final itemCount = state.products.length;

            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: _ProductsGridView(
                scrollController: _scrollController,
                products: state.products,
                isLoadingMore: state.status == ProductsStatus.loadingMore,
                itemCount: itemCount,
              ),
            );
          } else if (state.status == ProductsStatus.loading) {
            return const LoadingGridView();
          }

          return const SizedBox();
        },
      ),
    );
  }
}

class _ProductsGridView extends StatelessWidget {
  final int itemCount;
  final bool isLoadingMore;
  final List<Product> products;
  final ScrollController scrollController;

  const _ProductsGridView({
    required this.products,
    required this.scrollController,
    required this.itemCount,
    required this.isLoadingMore,
  });

  @override
  Widget build(BuildContext context) {
    return WaterfallFlow.builder(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(_padding8, _padding8, _padding8, _padding20),
      gridDelegate: const SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
        crossAxisCount: ProductGridValues.crossAxisCount,
        mainAxisSpacing: ProductGridValues.axisSpacing,
        crossAxisSpacing: ProductGridValues.axisSpacing,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final product = products[index];
        final isEqualToLastItems = index == itemCount - 1 || index == itemCount - 2;

        if (isLoadingMore && isEqualToLastItems) {
          return const LoadingCard();
        }

        return ProductCard(
          product: product,
          onPressed: (productId) {
            context.router.push(ProductInfoRoute(productId: productId));
          },
        );
      },
    );
  }
}
