import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_images.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Assets.imagesSplashScreen,
      ),
    );
  }
}
