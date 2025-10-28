import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/cubits/products_cubit/products_cubit.dart';
import 'package:stylish/core/widgets/search_text_field.dart';
import 'package:stylish/features/home/presentation/views/widgets/products_counter.dart';
import 'package:stylish/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';

class ProductsScreenBody extends StatefulWidget {
  const ProductsScreenBody({super.key});

  @override
  State<ProductsScreenBody> createState() => _ProductsScreenBodyState();
}

class _ProductsScreenBodyState extends State<ProductsScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 16.0),
                const SearchTextField(),
                const SizedBox(height: 16.0),
                ProductsCounter(
                    productsLength:
                        context.read<ProductsCubit>().productsLength),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
          const ProductsGridViewBlocBuilder()
        ],
      ),
    );
  }
}
