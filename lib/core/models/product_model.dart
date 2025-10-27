import 'package:stylish/core/entities/product_entity.dart';
import 'package:stylish/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String category;
  final num price;
  final String code;
  final String description;
  final int sellingCount;
  final String imageUrl;
  final num avgRating;
  final num ratingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.category,
    required this.price,
    required this.code,
    required this.description,
    required this.sellingCount,
    required this.imageUrl,
    required this.reviews,
    this.avgRating = 0,
    this.ratingCount = 0,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      category: json['category'],
      price: json['price'],
      code: json['code'],
      description: json['description'],
      sellingCount: json['sellingCount'],
      imageUrl: json['imageUrl'],
      reviews: json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((review) => ReviewModel.fromJson(review)))
          : [],
    );
  }
  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      category: category,
      price: price,
      code: code,
      description: description,
    imageUrl: imageUrl,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

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
