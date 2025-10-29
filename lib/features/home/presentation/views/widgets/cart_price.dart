import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_text_styles.dart';

class CartPrice extends StatelessWidget {
  final String priceAfterDiscount;
  final String priceBeforeDiscount;
  final String discount;
  const CartPrice({
    super.key,
    required this.priceAfterDiscount,
    required this.priceBeforeDiscount,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 84,
          height: 29,
          decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                width: 0.5,
                color: const Color(0xFFCACACA),
              )),
          child: Center(
            child: Text(
              '\$$priceAfterDiscount',
              style: AppTextStyles.semiBold14,
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        Column(mainAxisSize: MainAxisSize.min, children: [
          Text('upto $discount% off  ',
              style: AppTextStyles.regular12
                  .copyWith(color: const Color(0xFFEB3030))),
          Text('\$$priceBeforeDiscount',
              style: AppTextStyles.medium14.copyWith(
                  color: const Color(0xFFA7A7A7),
                  decoration: TextDecoration.lineThrough)),
        ])
      ],
    );
  }
}