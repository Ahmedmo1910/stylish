import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_text_styles.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(
      title,
      style: AppTextStyles.medium18,
    ),
    centerTitle: true,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
