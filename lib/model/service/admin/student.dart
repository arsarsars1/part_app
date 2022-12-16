import 'dart:convert';

import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/students_response.dart';
import 'package:part_app/model/service/api_client.dart';

class StudentService {
  final _client = ApiClient();

  Future<StudentResponse?> createStudent(Map<String, dynamic> request) async {
    try {
      request.removeWhere((key, value) => value == null);
      var response =
          await _client.post(postPath: '/admin/students', data: request);
      return studentResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<StudentResponse?> updateStudent(
      Map<String, dynamic> request, int? id) async {
    try {
      request.removeWhere((key, value) => value == null);
      var response = await _client.post(
        postPath: '/admin/students/$id',
        data: request,
        formData: true,
      );
      return studentResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> updateStatus(
      {required int status, required int? studentId}) async {
    var response = await _client.get(
        queryPath: '/admin/students/$studentId/activation/$status');

    return commonFromJson(jsonEncode(response));
  }

  Future<StudentsResponse?> getStudents({
    String? status,
    String? searchQuery,
    int? branchId,
    int? batchId,
  }) async {
    try {
      var response = await _client.get(queryPath: '/admin/students');
      return studentsResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<StudentResponse?> studentDetails(int? studentId) async {
    try {
      var response = await _client.get(queryPath: '/admin/students/$studentId');
      return studentResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }
}
