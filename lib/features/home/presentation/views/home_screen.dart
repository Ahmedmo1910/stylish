import 'package:flutter/material.dart';
import 'package:stylish/features/home/presentation/views/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: HomeScreenBody(),
      ),
    );
  }
}
