import 'package:flutter/material.dart';
import 'package:stylish/core/widgets/build_app_bar.dart';
import 'widgets/trending_products_view_body.dart';

class TrendingProductScreen extends StatelessWidget {
  const TrendingProductScreen({super.key});
  static const String routeName = 'trendingProductScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Trending Products'),
      body: const SafeArea(
        child: TrendingProductsViewBody(),
      ),
    );
  }
}
