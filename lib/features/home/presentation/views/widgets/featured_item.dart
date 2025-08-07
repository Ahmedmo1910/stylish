import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_text_styles.dart';
import 'package:stylish/features/home/presentation/views/widgets/featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  final String imagePath;
  final String offer;
  final String text1;
  final String text2;
  const FeaturedItem({
    super.key,
    required this.imagePath,
    required this.offer,
    required this.text1,
    this.text2 = 'All colors',
  });

  @override
  Widget build(BuildContext context) {
    var featuredItemWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: SizedBox(
        width: featuredItemWidth,
        child: AspectRatio(
          aspectRatio: 343 / 189,
          child: Stack(
            children: [
              Positioned(
                child: Image.asset(
                  width: double.infinity,
                  imagePath,
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
                      offer,
                      style: AppTextStyles.semiBold20.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      text1,
                      style: AppTextStyles.small12.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      text2,
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
      ),
    );
  }
}
