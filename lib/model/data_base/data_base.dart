import 'package:hive_flutter/hive_flutter.dart';

class Database {
  Future init() async {
    // Create a box collection
    await Hive.openBox(userBox);
  }

  static const userBox = 'userBox';
  static const token = 'token';
}
