import 'package:flutter/material.dart';
import 'package:stylish/features/on_boarding/presentation/views/widgets/on_boarding_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  static const String routeName = 'onBoardingScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: OnBoardingBody()),
    );
  }
}