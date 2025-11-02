import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:stylish/core/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:stylish/core/utils/app_text_styles.dart';
import 'package:stylish/features/home/domain/entities/cart_item_entity.dart';
import 'package:stylish/features/home/presentation/views/widgets/add_more_products.dart';
import 'package:stylish/features/home/presentation/views/widgets/cart_price.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return GestureDetector(
          onLongPress: () =>
              context.read<CartCubit>().deleteCartItem(cartItemEntity),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: CachedNetworkImage(
                          width: 125,
                          height: 130,
                          imageUrl: cartItemEntity.productEntity.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartItemEntity.productEntity.name,
                              style: AppTextStyles.semiBold14),
                          CartPrice(
                              priceAfterDiscount: '20.00',
                              priceBeforeDiscount:
                                  cartItemEntity.productEntity.price.toString(),
                              discount: '5'),
                          const SizedBox(height: 18.0),
                          const Text('4.8 ⭐⭐⭐⭐⭐')
                        ],
                      ),
                      const SizedBox(width: 12.0),
                      Column(
                        children: [
                          AddMoreProducts(
                            icon: Icons.add,
                            onTap: () {
                              cartItemEntity.increaseCount();
                              context
                                  .read<CartItemCubit>()
                                  .updateCartItem(cartItemEntity);
                            },
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.0),
                              child: Text(cartItemEntity.count.toString(),
                                  style: AppTextStyles.semiBold14)),
                          AddMoreProducts(
                              icon: Icons.remove,
                              onTap: () {
                                cartItemEntity.decreaseCount();
                                context
                                    .read<CartItemCubit>()
                                    .updateCartItem(cartItemEntity);
                              }),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Text("Total Order (${cartItemEntity.count})   :",
                          style: AppTextStyles.semiBold14),
                      const Spacer(),
                      Text(cartItemEntity.calculateTotalPrice().toString(),
                          style: AppTextStyles.semiBold14),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
