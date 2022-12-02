import 'dart:convert';

import 'package:part_app/model/data_model/students_response.dart';
import 'package:part_app/model/service/api_client.dart';

class StudentService {
  final _client = ApiClient();

  Future<StudentsResponse?> getStudentsByBatch(int? batchId) async {
    try {
      var response = await _client.get(
        queryPath: '/admin/batches/$batchId/students',
      );
      return studentsResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }
}
