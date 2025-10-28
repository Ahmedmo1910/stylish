import 'package:flutter/material.dart';
import 'package:stylish/features/home/domain/entities/bottom_navigation_bar_entity.dart';
import 'navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 76,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 50,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: bottomNavigationBarItem.asMap().entries.map((item) {
          var index = item.key;
          var entity = item.value;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTap(index),
              child: NavigationBarItem(
                isSelected: currentIndex == index,
                bottomNavigationBarEntity: entity,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
