import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/domain/product/entities/product.dart';
import 'package:flutter_template/presentation/pages/product/product_info/widget/product_app_bar.dart';
import 'package:flutter_template/presentation/pages/product/product_info/widget/product_images.dart';
import 'package:flutter_template/presentation/pages/product/product_info/widget/product_info_wrapper.dart';
import 'package:flutter_template/presentation/state_management/product/product_info/cubit/product_info_cubit.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class ProductInfoPage extends StatefulWidget implements AutoRouteWrapper {
  final int productId;

  const ProductInfoPage({
    super.key,
    @PathParam('id') this.productId = -1,
  });

  @override
  State<ProductInfoPage> createState() => _ProductInfoPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ProductInfoCubit>(
      create: (context) => context.read<GetIt>().get(),
      child: this,
    );
  }
}

class _ProductInfoPageState extends State<ProductInfoPage> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.easeIn,
  );
  late final PageController _pageController = PageController(viewportFraction: 0.9);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<ProductInfoCubit>();
      cubit.fetchProduct(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProductInfoCubit, ProductInfoState>(
        listener: (context, state) {
          if (state.isSuccess) {
            _animationController.forward();
          }
        },
        builder: (context, state) {
          if (state.isSuccess && state.product != null) {
            return _ProductView(
              product: state.product!,
              pageController: _pageController,
              opacity: _animation,
            );
          }
          return CustomScrollView(
            slivers: [
              ProductAppBar.loading(),
              ProductInfoWrapper.loading(),
              ProductImages.loading(),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}

class _ProductView extends StatelessWidget {
  final Product product;
  final PageController pageController;
  final Animation<double> opacity;

  const _ProductView({
    required this.product,
    required this.pageController,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacity,
      child: CustomScrollView(
        slivers: [
          if (product.imagesUrls.isNotEmpty) ...{
            ProductAppBar.imageView(imageUrl: product.imagesUrls.first),
          } else ...{
            ProductAppBar.placeholderView(),
          },
          ProductInfoWrapper.view(product: product),
          ProductImages.view(
            pageController: pageController,
            imagesUrls: product.imagesUrls,
          ),
        ],
      ),
    );
  }
}
