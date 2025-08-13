import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:stylish/features/home/presentation/views/widgets/home_screen_body.dart';

import 'widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: SvgPicture.asset('assets/icons/appBarLogo.svg'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.asset('assets/images/profile_image.png'),
          )
        ],
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      backgroundColor: const Color(0xFFFDFDFD),
      body: const HomeScreenBody(),
    );
  }
}
