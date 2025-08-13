import 'dart:convert';

import 'package:stylish/constants.dart';
import 'package:stylish/core/services/shared_preferences_singleton.dart';
import 'package:stylish/features/authentication/data/models/user_model.dart';
import 'package:stylish/features/authentication/domain/entites/user_entity.dart';

UserEntity getUser() {
  var jsonString = prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
