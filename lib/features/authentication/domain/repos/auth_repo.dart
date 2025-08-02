import 'package:dartz/dartz.dart';
import 'package:stylish/core/errors/failures.dart';
import 'package:stylish/features/authentication/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future addUserData({required UserEntity user});
  //!Future<Either<Failure, UserEntity>> signInWithApple(); maybe later when i have a mac to test it
}
