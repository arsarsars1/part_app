import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:part_app/model/data_model/user_response.dart';

class Database {
  Future init() async {
    // Create a box collection
    await Hive.openBox(userBox);
  }

  static const userBox = 'userBox';
  static const token = 'token';
  static const userData = 'userData';

  String? getToken() {
    String? tempToken = Hive.box(userBox).get(token);
    return tempToken;
  }

  Future<String?> getUser() async {
    String? user = await Hive.box(userBox).get(userData);
    return user;
  }

  Future clearForLogout() async {
    await Hive.box(userBox).clear();
  }

  Future setUser(UserResponse user) async {
    await Hive.box(Database.userBox).put(
      Database.userData,
      jsonEncode(user),
    );
  }

  Future setToken(UserResponse user) async {
    await Hive.box(Database.userBox).put(Database.userData, user.token);
  }
}
