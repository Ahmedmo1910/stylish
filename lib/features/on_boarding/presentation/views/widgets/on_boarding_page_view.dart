import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_images.dart';
import 'package:stylish/core/utils/app_text_styles.dart';
import 'page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: PageView(
        controller: pageController,
        children: [
          PageViewItem(
            image: Assets.imagesOnBoarding1,
            subtitle:
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
            title: Text(
              'Choose Products',
              style: AppTextStyles.bold24.copyWith(color: Colors.black),
            ),
          ),
          PageViewItem(
            image: Assets.imagesOnBoarding2,
            subtitle:
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
            title: Text(
              'Make Payment',
              style: AppTextStyles.bold24.copyWith(color: Colors.black),
            ),
          ),
          PageViewItem(
            image: Assets.imagesOnBoarding3,
            subtitle:
                'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
            title: Text(
              'Get Your Order',
              style: AppTextStyles.bold24.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
