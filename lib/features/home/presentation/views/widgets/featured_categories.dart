import 'package:flutter/material.dart';
import 'package:stylish/features/home/presentation/views/widgets/categories_list.dart';

class FeaturedCategories extends StatelessWidget {
  const FeaturedCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 400/97,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CategoriesList(path: 'assets/images/p1.png', text: 'Beauty'),
            CategoriesList(path: 'assets/images/p2.png', text: 'Fashion'),
            CategoriesList(path: 'assets/images/p3.png', text: 'Kids'),
            CategoriesList(path: 'assets/images/p4.png', text: 'Mens'),
            CategoriesList(path: 'assets/images/p5.png', text: 'Womens'),
          ],
        ),
      ),
    );
  }
}
