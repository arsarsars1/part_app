import 'dart:convert';
import 'package:part_app/model/data_model/classes_today.dart';
import 'package:part_app/model/service/api.dart';

class ClassesTodayService {
  final _client = ApiClient();

  Future<ClassesToday?> getClassesToday({required String date}) async {
    try {
      var response =
          await _client.get(queryPath: '/admin/batches/daily-classes/$date');
      return classesTodayFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<ClassesToday?> getClassesTodayForManager(
      {required String date, required int managerId}) async {
    try {
      var response = await _client.get(
          queryPath: '/managers/$managerId/batches/daily-classes/$date');
      return classesTodayFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }
}
