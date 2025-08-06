import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_text_styles.dart';
import 'package:stylish/features/home/presentation/views/widgets/featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var featuredItemWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: featuredItemWidth,
      child: AspectRatio(
        aspectRatio: 343 / 189,
        child: Stack(
          children: [
            Positioned(
              child: Image.asset(
                width: double.infinity,
                'assets/images/featured_image.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              top: 35,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '50-40% OFF',
                    style: AppTextStyles.semiBold20.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Now in (product)',
                    style: AppTextStyles.small12.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'All colors',
                    style: AppTextStyles.small12.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const FeaturedItemButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
