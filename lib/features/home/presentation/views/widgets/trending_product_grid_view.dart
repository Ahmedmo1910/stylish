import 'package:flutter/material.dart';
import 'package:stylish/core/entities/product_entity.dart';
import 'package:stylish/core/widgets/product_item.dart';

class TrendingProductGridView extends StatelessWidget {
  const TrendingProductGridView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 170 / 240,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (context, index) {
        return ProductItem(
          productEntity: products[index],
        );
      },
    );
  }
}
