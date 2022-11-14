import 'dart:convert';

import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/model/data_model/course.dart';
import 'package:part_app/model/data_model/user_response.dart';
import 'package:part_app/model/service/api_client.dart';

class BatchService {
  final _apiClient = ApiClient();

  Future<List<Course>?> getCourses() async {
    String? string = await Database().getUser();
    if (string != null) {
      User? user = userResponseFromJson(string).user;
      int academyId = user!.adminDetail!.academy!.id;
      var response = await _apiClient.get(
        queryPath: 'https://dev.partapp.in/academy-type/$academyId/courses',
      );

      return courseFromJson(jsonEncode(response));
    }
    return null;
  }
}
