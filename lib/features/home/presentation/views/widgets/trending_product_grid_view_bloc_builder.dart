import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stylish/core/cubits/products_cubit/products_cubit.dart';
import 'package:stylish/core/helper_functions/get_dummy_product.dart';
import 'package:stylish/core/widgets/custom_error_widget.dart';
import 'package:stylish/features/home/presentation/views/widgets/trending_product_grid_view.dart';

class TrendingProductGridViewBlocBuilder extends StatelessWidget {
  const TrendingProductGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsFailure) {
          return SliverToBoxAdapter(
              child: CustomErrorWidget(text: state.errorMessage));
        } else if (state is ProductsLoading) {
          return Skeletonizer.sliver(
              enabled: true,
              child: TrendingProductGridView(products: getDummyProducts()));
        } else if (state is ProductsSuccess) {
          return TrendingProductGridView(
            products: state.products,
          );
        } else {
          const CustomErrorWidget(text: 'Something went wrong');
        }
        return const CustomErrorWidget(text: 'Something went wrong');
      },
    );
  }
}
