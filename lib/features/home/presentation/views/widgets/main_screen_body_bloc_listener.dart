import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:stylish/features/home/presentation/views/widgets/main_screen_body.dart';

class MainScreenBodyBlocListener extends StatelessWidget {
  const MainScreenBodyBlocListener({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is CartProductAdded) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Product added to cart!'),
            ));
          }
        },
        child: MainScreenBody(currentIndex: currentIndex));
  }
}
