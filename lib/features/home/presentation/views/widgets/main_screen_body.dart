import 'package:flutter/material.dart';
import 'package:stylish/features/home/presentation/views/cart_screen.dart';
import 'package:stylish/features/home/presentation/views/products_screen.dart';
import 'package:stylish/features/home/presentation/views/widgets/home_screen.dart';

class MainScreenBody extends StatelessWidget {
  const MainScreenBody({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentIndex,
      children: [
        const HomeScreen(),
        Container(),
        const CartScreen(),
        const ProductsScreen(),
        Container(),
      ],
    );
  }
}
