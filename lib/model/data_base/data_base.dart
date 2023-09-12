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
  static const previousStartTime = 'startTime';
  static const previousEndTime = 'endTime';

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
    await Hive.box(Database.userBox).put(token, user.token);
  }

  Future setPreviousClassStartTime(String startDate) async {
    await Hive.box(Database.userBox).put(
      Database.previousStartTime,
      startDate,
    );
  }

  Future<String?> getPreviousClassStartTime() async {
    String? startDate = await Hive.box(userBox).get(previousStartTime);
    return startDate;
  }

  Future setPreviousClassEndTime(String endDate) async {
    await Hive.box(Database.userBox).put(
      Database.previousEndTime,
      endDate,
    );
  }

  Future<String?> getPreviousClassEndTime() async {
    String? endDate = await Hive.box(userBox).get(previousEndTime);
    return endDate;
  }
}
