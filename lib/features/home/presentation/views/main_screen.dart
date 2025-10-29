import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish/features/home/presentation/views/cart_screen.dart';
import 'package:stylish/features/home/presentation/views/products_screen.dart';
import 'package:stylish/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:stylish/features/home/presentation/views/widgets/home_screen.dart';
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
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      backgroundColor: const Color(0xFFFDFDFD),
      body: IndexedStack(
        index: currentIndex,
        children: [
          const HomeScreen(),
          Container(),
          const CartScreen(),
          const ProductsScreen(),
          Container(),
        ],
      ),
    );
  }
}
