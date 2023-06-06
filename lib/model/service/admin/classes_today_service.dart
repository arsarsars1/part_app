import 'dart:convert';
import 'package:part_app/model/data_model/ClassesToday.dart';
import 'package:part_app/model/service/api.dart';

class ClassesTodayService {
  final _client = ApiClient();

  Future<ClassesToday?> getClassesToday({required String date}) async {
    try {
      var response = await _client.get(queryPath: '/admin/batches/daily-classes/$date');
      return classesTodayFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }
}
