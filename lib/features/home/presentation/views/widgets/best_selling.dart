import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_text_styles.dart';
import 'package:stylish/features/home/presentation/views/widgets/featured_item_button.dart';
import 'package:stylish/features/trending_products/presentation/view/trending_product_screen.dart';

class BestSelling extends StatelessWidget {
  const BestSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFF4392F9),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Text(
            'Trending Products',
            style: AppTextStyles.regular16.copyWith(
              color: const Color(0xFFFFFFFF),
            ),
          ),
          const Spacer(),
          FeaturedItemButton(
            onTap: () {
              Navigator.pushNamed(context, TrendingProductScreen.routeName);
            },
            text: 'View All',
            width: 0.27,
          ),
        ],
      ),
    );
  }
}
