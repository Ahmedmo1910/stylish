import 'package:flutter/material.dart';
import 'package:stylish/features/home/domain/entities/cart_item_entity.dart';
import 'package:stylish/features/home/presentation/views/widgets/cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key , required this.cartItems});
final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) => 
       CartItem(
         cartItemEntity: cartItems[index],
       ),
    );
  }
}