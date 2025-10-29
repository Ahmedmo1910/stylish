import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_colors.dart';
import 'package:stylish/core/utils/app_text_styles.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColors.lightPrimaryColor),
      child: Center(
        child: Text(
          'You have 5 items in your cart',
          style:
              AppTextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
