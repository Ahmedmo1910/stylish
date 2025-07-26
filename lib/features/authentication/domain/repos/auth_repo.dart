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
}
