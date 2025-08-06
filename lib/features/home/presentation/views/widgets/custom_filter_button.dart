import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_text_styles.dart';

class CustomFilterButton extends StatelessWidget {
  final String text;
  final Widget icon;
  const CustomFilterButton({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        //padding: EdgeInsets.all(8.0),
        width: 67,
        height: 24,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppTextStyles.small14.copyWith(
                color: Colors.black,
              ),
            ),
            icon
          ],
        ),
      ),
    );
  }
}
