import 'dart:io';
import 'package:stylish/core/entities/review_entity.dart';

class ProductModel {
  final String name;
  final String category;
  final num price;
  final String code;
  final String description;
  final int sellingCount;
  String? imageUrl;
  final File imageFile;
  final num avgRating;
  final num ratingCount;
  final List<ReviewEntity> reviews;

  ProductModel({
    required this.name,
    required this.category,
    required this.price,
    required this.code,
    required this.description,
    required this.sellingCount,
    this.imageUrl,
    required this.imageFile,
    required this.reviews,
    this.avgRating = 0,
    this.ratingCount = 0,
  });


  toJson() {
    return {
      'name': name,
      'category': category,
      'price': price,
      'code': code,
      'description': description,
      'sellingCount': sellingCount,
      'imageUrl': imageUrl,
      'reviews': reviews
    };
  }
}
