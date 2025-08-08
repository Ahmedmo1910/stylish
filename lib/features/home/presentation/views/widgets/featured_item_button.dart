import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/core/utils/app_text_styles.dart';

class FeaturedItemButton extends StatelessWidget {
  final String text;
  final double width;
  const FeaturedItemButton({
    super.key,
    required this.text,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * width,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppTextStyles.medium12.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 6.0),
            SvgPicture.asset(
              'assets/icons/arrow.svg',
            ),
          ],
        ),
      ),
    );
  }
}
