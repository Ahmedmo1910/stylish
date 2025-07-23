import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_colors.dart';

class SocialLoginButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;

  const SocialLoginButton({
    super.key,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.lightPrimaryColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.primaryColor, 
            width: 1,
          ),
        ),
        child: Image.asset(
          iconPath,
          width: 32,
          height: 32,
          colorBlendMode: BlendMode.overlay,
        ),
      ),
    );
  }
}
