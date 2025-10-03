import 'package:flutter/material.dart';
import 'package:stylish/core/helper_functions/get_user.dart';
import 'package:stylish/core/utils/app_text_styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.center,
                colors: [
                  Color(0xFFF83758),
                  Color(0xFFF8BCC6),
                ],
              ),
            ),
            accountName: Text(
              getUser().name,
              style: AppTextStyles.bold18,
            ),
            accountEmail: Text(
              getUser().email,
              style: AppTextStyles.regular14,
            ),

            
          )
        ],
      ),
    );
  }
}
