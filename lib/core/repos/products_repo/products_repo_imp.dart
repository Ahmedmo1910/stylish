import 'package:dartz/dartz.dart';
import 'package:stylish/core/entities/product_entity.dart';
import 'package:stylish/core/errors/failures.dart';
import 'package:stylish/core/models/product_model.dart';
import 'package:stylish/core/repos/products_repo/products_repo.dart';
import 'package:stylish/core/services/database_service.dart';
import 'package:stylish/core/utils/backend_endpoint.dart';

class ProductsRepoImp extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImp(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoint.getProducts) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      return Right(products);
    } catch (e) {
      return left(ServerFailure('failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getTrendingProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoint.getProducts,
          query: {
            'limit': 10,
            'orderBy': 'sellingCount',
            'descending': true,
          }) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      return Right(products);
    } catch (e) {
      return left(ServerFailure('failed to get products'));
    }
  }
}
