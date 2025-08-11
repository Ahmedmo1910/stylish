import 'package:flutter/material.dart';
import 'package:stylish/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'active_item.dart';
import 'in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  });
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarEntity.activeImage,
            text: bottomNavigationBarEntity.name,
            isCard: bottomNavigationBarEntity.name.toLowerCase() ==
                "cart", 
          )
        : INActiveItem(
            image: bottomNavigationBarEntity.inactiveImage,
            text: bottomNavigationBarEntity.name,
            isCard: bottomNavigationBarEntity.name.toLowerCase() ==
                "cart", 
          );
  }
}
