import 'package:flutter/material.dart';
import 'package:stylish/core/widgets/search_text_field.dart';
import 'package:stylish/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:stylish/features/home/presentation/views/widgets/featured_categories.dart';
import 'package:stylish/features/home/presentation/views/widgets/featured_filter.dart';
import 'package:stylish/features/home/presentation/views/widgets/featured_list.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppBar(),
                SizedBox(height: 16.0),
                SearchTextField(),
                SizedBox(height: 16.0),
                FeaturedFilter(),
                SizedBox(height: 16.0),
                FeaturedCategories(),
                SizedBox(height: 16.0),
                FeaturedList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
