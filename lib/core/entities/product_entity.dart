import 'dart:io';
import 'package:stylish/core/entities/review_entity.dart';


class ProductEntity {
  final String name;
  final String category;
  final num price;
  final String code;
  final String description;
  String? imageUrl;
  final File imageFile;
  final num avgRating;
  final num ratingCount;
  final List<ReviewEntity> reviews;

  ProductEntity(
      {required this.name,
      required this.category,
      required this.price,
      required this.code,
      required this.description,
      this.imageUrl,
      required this.imageFile,
      required this.reviews,
      this.avgRating = 0,
      this.ratingCount = 0
      });
}
