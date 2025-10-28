import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/cubits/products_cubit/products_cubit.dart';
import 'package:stylish/core/widgets/search_text_field.dart';
import 'package:stylish/features/home/presentation/views/widgets/best_selling.dart';
import 'package:stylish/features/home/presentation/views/widgets/featured_categories.dart';
import 'package:stylish/features/home/presentation/views/widgets/featured_filter.dart';
import 'package:stylish/features/home/presentation/views/widgets/featured_list.dart';
import 'package:stylish/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  void initState() {
   context.read<ProductsCubit>().getTrendingProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 16.0),
                SearchTextField(),
                SizedBox(height: 16.0),
                FeaturedFilter(),
                SizedBox(height: 16.0),
                FeaturedCategories(),
                SizedBox(height: 16.0),
                FeaturedList(),
                SizedBox(height: 16.0),
                BestSelling(),
                SizedBox(height: 16.0),
              ],
            ),
          ),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}

