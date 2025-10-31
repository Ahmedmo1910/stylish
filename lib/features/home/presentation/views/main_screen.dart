import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:stylish/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:stylish/features/home/presentation/views/widgets/main_screen_body_bloc_listener.dart';
import 'widgets/custom_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String routeName = 'mainScreen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
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
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        backgroundColor: const Color(0xFFFDFDFD),
        body: MainScreenBodyBlocListener(currentIndex: currentIndex),
      ),
    );
  }
}



