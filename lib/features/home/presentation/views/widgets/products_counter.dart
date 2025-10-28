import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_text_styles.dart';

class ProductsCounter extends StatelessWidget {
  final int productsLength;
  const ProductsCounter({
    super.key,
    required this.productsLength,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'All Products',
          style: AppTextStyles.medium18,
        ),
        const Spacer(),
        Text(
          '+$productsLength',
          style: AppTextStyles.regular16
              .copyWith(color: Colors.grey.shade400),
        )
      ],
    );
  }
}
