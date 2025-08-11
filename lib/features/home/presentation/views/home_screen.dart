import 'package:flutter/material.dart';
import 'package:stylish/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:stylish/features/home/presentation/views/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      backgroundColor: Color(0xFFFDFDFD),
      body: SafeArea(
        child: HomeScreenBody(),
      ),
    );
  }
}
