import 'package:flutter/material.dart';
import 'package:stylish/core/widgets/product_item.dart';

class TrendingProductGridView extends StatelessWidget {
  const TrendingProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 170 / 258,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (context, index) {
        return const ProductItem();
      },
    );
  }
}
