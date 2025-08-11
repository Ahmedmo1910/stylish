import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/core/utils/app_text_styles.dart';

class INActiveItem extends StatelessWidget {
  const INActiveItem({
    super.key,
    required this.image,
    required this.isCard,
    this.text = '',
  });
  final String image;
  final String text;
  final bool
      isCard; // Assuming this is a default value, as it was not used in the original code
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isCard
            ? Container(
                width: 53.85,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(
                    image,
                  ),
                ),
              )
            : SvgPicture.asset(
                image,
              ),
        const SizedBox(height: 2),
        isCard
            ? const Text('', style: AppTextStyles.regular12)
            : Text(
                text,
                style: AppTextStyles.regular12.copyWith(
                  color: Colors.black,
                ),
              ),
      ],
    );
  }
}
