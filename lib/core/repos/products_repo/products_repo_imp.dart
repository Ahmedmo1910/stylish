import 'package:dartz/dartz.dart';
import 'package:stylish/core/entities/product_entity.dart';
import 'package:stylish/core/errors/failures.dart';
import 'package:stylish/core/repos/products_repo/products_repo.dart';

class ProductsRepoImp extends ProductsRepo{
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getTrendingProducts() {
    // TODO: implement getTrendingProducts
    throw UnimplementedError();
  }
}