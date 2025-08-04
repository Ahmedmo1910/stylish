import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_text_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'assets/images/profile_image.png',
      ),
      trailing: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: const ShapeDecoration(
          color: Color(0xFFF2F2F2),
          shape: OvalBorder(),
        ),
        child: const ImageIcon(
          AssetImage('assets/icons/menu.png'),
          color: Colors.black,
        ),
      ),
      title: const Text('Hello', style: AppTextStyles.medium24),
      subtitle: Text(
        'Welcome back, User',
        style: AppTextStyles.small16.copyWith(
          color: Colors.black54,
        ),
      ),
    );
  }
}
