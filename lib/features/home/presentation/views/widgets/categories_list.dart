import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_text_styles.dart';

class CategoriesList extends StatelessWidget {
  final String path;
  final String text;
  const CategoriesList({
    super.key,
    required this.path,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(path),
        ),
        const SizedBox(height: 4.0),
        Text(
          text,
          style: AppTextStyles.small12.copyWith(
            color: const Color(0xFF21003D),
          ),
        ),
      ],
    );
  }
}
