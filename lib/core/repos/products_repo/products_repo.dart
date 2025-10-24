import 'package:dartz/dartz.dart';
import 'package:stylish/core/entities/product_entity.dart';
import 'package:stylish/core/errors/failures.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getTrendingProducts();
}