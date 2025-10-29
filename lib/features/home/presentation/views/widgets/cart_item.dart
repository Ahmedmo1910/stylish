import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_text_styles.dart';
import 'package:stylish/features/home/presentation/views/widgets/add_more_products.dart';
import 'package:stylish/features/home/presentation/views/widgets/cart_price.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
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
                    imageUrl:
                        'https://firebasestorage.googleapis.com/v0/b/stylish-10120.firebasestorage.app/o/images%2FIMG-20250621-WA0043.jpg..jpg?alt=media&token=fd125943-d0ef-406c-9bac-b905d1259f61',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12.0),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Men’s Casual Wear", style: AppTextStyles.semiBold14),
                    CartPrice(
                        priceAfterDiscount: '20.00',
                        priceBeforeDiscount: '25.00',
                        discount: '5'),
                    SizedBox(height: 18.0),
                    Text('4.8 ⭐⭐⭐⭐⭐')
                  ],
                ),
                const SizedBox(width: 12.0),
                Column(
                  children: [
                    AddMoreProducts(
                      icon: Icons.add,
                      onTap: () {
                        print('add');
                      },
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.0),
                        child: Text('1', style: AppTextStyles.semiBold14)),
                    AddMoreProducts(
                        icon: Icons.remove,
                        onTap: () {
                          print('remove');
                        }),
                  ],
                ),
              ],
            ),
            const Divider(),
            const Row(
              children: [
                Text("Total Order (1)   :", style: AppTextStyles.semiBold14),
                Spacer(),
                Text("\$20.00", style: AppTextStyles.semiBold14),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
