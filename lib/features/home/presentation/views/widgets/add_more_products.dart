import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_colors.dart';

class AddMoreProducts extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const AddMoreProducts({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: AppColors.lightPrimaryColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Icon(icon, size: 16, color:AppColors.primaryColor),
      ),
    );
  }
}
