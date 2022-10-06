import 'package:hive/hive.dart';

class Database {
  Future init() async {
    // Create a box collection
    await Hive.openBox(userBox);
  }

  static const userBox = 'userBox';
  static const userKey = 'userKey';
}
