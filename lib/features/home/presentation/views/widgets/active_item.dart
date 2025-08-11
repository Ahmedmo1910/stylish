import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/core/utils/app_text_styles.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({
    super.key,
    required this.image,
    required this.text,
    required this.isCard,
  });

  final String image;
  final String text;
  final bool isCard;

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
                  color: const Color(0xFFEB3030),
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
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              )
            : SvgPicture.asset(
                image,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFEB3030),
                  BlendMode.srcIn,
                ),
              ),
        const SizedBox(height: 2),
        isCard
            ? const Text('', style: AppTextStyles.regular12)
            : Text(
                text,
                style: AppTextStyles.regular12.copyWith(
                  color: const Color(0xFFEB3030),
                ),
              ),
      ],
    );
  }
}
