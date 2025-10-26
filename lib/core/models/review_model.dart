import 'package:stylish/core/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String date;
  final String review;
  final num rating;

  ReviewModel(
      {required this.name,
      required this.image,
      required this.date,
      required this.review,
      required this.rating});

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      date: reviewEntity.date,
      review: reviewEntity.review,
      rating: reviewEntity.rating,
    );
  }
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      date: json['date'],
      review: json['review'],
      rating: json['rating'],
    );
  }
  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      image: image,
      date: date,
      review: review,
      rating: rating,
    );
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'date': date,
      'review': review,
      'rating': rating,
    };
  }
}
