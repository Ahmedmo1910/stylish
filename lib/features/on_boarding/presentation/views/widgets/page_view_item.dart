import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_text_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.subtitle,
    required this.title,
    this.onSkip,
  });

  final String image;
  final String subtitle;
  final Widget title;

  final VoidCallback? onSkip;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: size.width * 0.8,
                height: size.height * 0.35,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),
              title,
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.medium14.copyWith(
                    color: const Color(0xFFA8A8A9),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
