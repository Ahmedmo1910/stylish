import 'package:firebase_auth/firebase_auth.dart';
import 'package:stylish/features/authentication/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.uId, required super.name, required super.email});

  factory UserModel.fromFireBaseUser(User user) {
    return UserModel(
      uId: user.uid,
      name: user.displayName ?? 'No Name',
      email: user.email ?? 'No Email',
    );
  }
}
