import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/core/utils/app_text_styles.dart';
import 'package:stylish/features/home/presentation/views/widgets/custom_filter_button.dart';

class FeaturedFilter extends StatelessWidget {
  const FeaturedFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'All Featured',
          style: AppTextStyles.medium18,
        ),
        const Spacer(),
        const CustomFilterButton(
          text: 'Sort',
          icon: Icon(
            Icons.swap_vert,
          ),
        ),
        const SizedBox(width: 8.0),
        CustomFilterButton(
          text: 'Filter',
          icon: SvgPicture.asset(
            'assets/icons/filter.svg',
          ),
        ),
      ],
    );
  }
}
