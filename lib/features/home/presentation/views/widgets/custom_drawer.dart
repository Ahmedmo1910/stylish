import 'package:flutter/material.dart';
import 'package:stylish/core/helper_functions/get_user.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [Text(getUser().name)],
      ),
    );
  }
}
