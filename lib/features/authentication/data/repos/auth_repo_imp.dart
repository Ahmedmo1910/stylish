import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stylish/core/errors/exceptions.dart';
import 'package:stylish/core/errors/failures.dart';
import 'package:stylish/core/services/database_service.dart';
import 'package:stylish/core/services/fire_base_auth_service.dart';
import 'package:stylish/core/utils/backend_endpoint.dart';
import 'package:stylish/features/authentication/data/models/user_model.dart';
import 'package:stylish/features/authentication/domain/entites/user_entity.dart';
import 'package:stylish/features/authentication/domain/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final FireBaseAuthService fireBaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImp(
      {required this.databaseService, required this.fireBaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await fireBaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(
        uId: user.uid,
        name: name,
        email: email,
      );
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await fireBaseAuthService.deleteUser();
      }
      return left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await fireBaseAuthService.deleteUser();
      }
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

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await fireBaseAuthService.signInWithFacebook();
      return right(UserModel.fromFireBaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoIml.signInWithFacebook: ${e.toString()}');
      return left(ServerFailure('An unknown error occurred,Please try again.'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
        path: BackendEndpoint.addUserData, data: user.toMap());
  }
  /*
  ! maybe later when i have a mac to test it
  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    try {
      var user = await fireBaseAuthService.signInWithApple();
      return right(UserModel.fromFireBaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoIml.signInWithApple: ${e.toString()}');
      return left(ServerFailure('An unknown error occurred,Please try again.'));
    }
  }
  */
}
