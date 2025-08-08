import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/core/utils/app_text_styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/onBoarding1.png',
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                    title: const Text(
                      'product name',
                      style: AppTextStyles.regular12,
                    ),
                    subtitle: const Text(
                      'product category',
                      style: AppTextStyles.small10,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        print('Cart button pressed');
                      },
                      icon: SvgPicture.asset('assets/icons/cart.svg'),
                    ),
                  ),
                  const Text(
                    'price after discount',
                    style: AppTextStyles.regular12,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'price before discount',
                      style: AppTextStyles.small12.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: const Color(0xFFBBBBBB),
                      ),
                      children: [
                        TextSpan(
                          text: ' 50% off',
                          style: AppTextStyles.small10.copyWith(
                            color: const Color(0xFFFE735C),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                print('Favorite button pressed');
              },
              icon: SvgPicture.asset('assets/icons/heart.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
