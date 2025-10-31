import 'package:flutter/material.dart';
import 'package:stylish/core/widgets/custom_button.dart';
import 'package:stylish/features/home/presentation/views/widgets/cart_header.dart';
import 'package:stylish/features/home/presentation/views/widgets/cart_item_list.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Column(
            children: [
              CartHeader(),
              SizedBox(height: 16.0),
              
            ],
          ),
        ),
        const CartItemList(
           cartItems: [],
         ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            child: MainButton(
              text: 'Proceed to Payment',
              hasCircularBorder: true,
              onTap: () {},
            ),
          ),
        )
      ],
    );
  }
}
