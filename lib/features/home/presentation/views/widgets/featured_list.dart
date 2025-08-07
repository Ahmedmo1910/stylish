import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:stylish/features/home/presentation/views/widgets/featured_item.dart';

class FeaturedList extends StatefulWidget {
  const FeaturedList({super.key});

  @override
  State<FeaturedList> createState() => _FeaturedListState();
}

class _FeaturedListState extends State<FeaturedList> {
  final PageController _controller = PageController();
  double currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 343 / 189,
          child: PageView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            children: const [
              FeaturedItem(
                imagePath: 'assets/images/featured_image.png',
                offer: '50% OFF',
                text1: 'Stylish Summer Collection',
                text2: 'All colors',
              ),
              FeaturedItem(
                imagePath: 'assets/images/featured_image.png',
                offer: '30% OFF',
                text1: 'Winter Sale',
                text2: 'Limited Edition',
              ),
              FeaturedItem(
                imagePath: 'assets/images/featured_image.png',
                offer: 'Buy 1 Get 1 Free',
                text1: 'Exclusive Offers',
                text2: 'Selected Items',
              ),
            ],
          ),
        ),
        DotsIndicator(
          animate: true,
          dotsCount: 3,
          position: currentPage.toDouble(),
          decorator: DotsDecorator(
            spacing: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 8.0),
            activeColor: const Color(0xFFFFA3B3),
            color: const Color(0xFFDEDBDB),
            size: const Size.square(8.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
        ),
      ],
    );
  }
}


