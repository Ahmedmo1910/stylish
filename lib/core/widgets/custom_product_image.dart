import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stylish/core/entities/product_entity.dart';

class CustomProductImage extends StatelessWidget {
  const CustomProductImage({
    super.key,
    required this.productEntity,
    required this.imageUrl,
  });

  final ProductEntity productEntity;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(6.0),
        topRight: Radius.circular(6.0),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        placeholder: (context, url) => Skeletonizer(
            child: Container(color: Colors.grey, width: 100, height: 100)),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
