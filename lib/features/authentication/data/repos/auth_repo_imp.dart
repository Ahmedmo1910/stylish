import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:stylish/core/errors/exceptions.dart';
import 'package:stylish/core/errors/failures.dart';
import 'package:stylish/core/services/fire_base_auth_service.dart';
import 'package:stylish/features/authentication/data/models/user_model.dart';
import 'package:stylish/features/authentication/domain/entites/user_entity.dart';
import 'package:stylish/features/authentication/domain/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final FireBaseAuthService fireBaseAuthService;
  AuthRepoImp({required this.fireBaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await fireBaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFireBaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoIml.createUserWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure('An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await fireBaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFireBaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoIml.signInWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure('An unknown error occurred: $e'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await fireBaseAuthService.signInWithGoogle();
      return right(UserModel.fromFireBaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoIml.signInWithGoogle: ${e.toString()}');
      return left(ServerFailure('An unknown error occurred,Please try again.'));
    }
  }
}
