import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stylish/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:stylish/core/entities/product_entity.dart';
import 'package:stylish/core/utils/app_text_styles.dart';
import 'package:stylish/core/widgets/custom_product_image.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productEntity});

  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomProductImage(
                  productEntity: productEntity,
                  imageUrl: productEntity.imageUrl,
                ),
                ListTile(
                  minTileHeight: 56.0,
                  minVerticalPadding: 4.0,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                  horizontalTitleGap: -12.0,
                  title: Text(
                    productEntity.name,
                    style: AppTextStyles.regular12,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    productEntity.description,
                    style: AppTextStyles.small10,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  trailing: IconButton(
                    onPressed: () {
                    context.read<CartCubit>().addToCart(productEntity);
                    },
                    icon: SvgPicture.asset('assets/icons/cart.svg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'price after discount',
                        style: AppTextStyles.regular12,
                      ),
                      RichText(
                        text: TextSpan(
                          text: '\$${productEntity.price}',
                          style: AppTextStyles.small12.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: const Color(0xFFBBBBBB),
                          ),
                          children: [
                            TextSpan(
                              text: ' 50% off',
                              style: AppTextStyles.small10.copyWith(
                                decoration: TextDecoration.none,
                                color: const Color(0xFFFE735C),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                print('Favorite button pressed');
              },
              icon: SvgPicture.asset('assets/icons/heart.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
