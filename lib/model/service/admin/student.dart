// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:developer';

import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/students_response.dart';
import 'package:part_app/model/service/api_client.dart';

class StudentService {
  final _client = ApiClient();

  Future<StudentResponse?> createStudent(Map<String, dynamic> request) async {
    try {
      request.removeWhere((key, value) => value == null);
      var response = await _client.post(
        postPath: '/admin/students',
        data: request,
        formData: true,
      );
      return studentResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<StudentResponse?> createStudentForTrainer({
    Map<String, dynamic>? request,
    int? trainerId,
  }) async {
    try {
      request?.removeWhere((key, value) => value == null);
      var response = await _client.post(
        postPath: '/trainers/$trainerId/students',
        data: request!,
        formData: true,
      );
      return studentResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<StudentResponse?> enrollToBatch(
      Map<String, dynamic> request, int? studentId) async {
    try {
      request.removeWhere((key, value) => value == null);
      var response = await _client.post(
          postPath: '/admin/students/$studentId/enroll', data: request);
      return studentResponseFromJson(jsonEncode(response));
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<StudentResponse?> enrollToBatchForTrainer({
    Map<String, dynamic>? request,
    int? studentId,
    int? trainerId,
  }) async {
    try {
      request?.removeWhere((key, value) => value == null);
      var response = await _client.post(
          postPath: '/trainers/$trainerId/students/$studentId/enroll',
          data: request!);
      return studentResponseFromJson(jsonEncode(response));
    } catch (e) {
      log(e.toString());
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
    String? searchQuery,
    String? activeStatus,
    int? batchId,
    int? pageNo,
  }) async {
    try {
      String path = '';

      if (batchId == null) {
        path = '/admin/students';
      } else {
        path = '/admin/batches/$batchId/students';
      }
      if (activeStatus != null) {
        path = '/admin/batches/$batchId/$activeStatus';
      }

      if (searchQuery != null) {
        path += '/search/$searchQuery';
      }

      path += '?page=$pageNo';

      var response = await _client.get(queryPath: path);
      return studentsResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<StudentsResponse?> getStudentsForTrainer({
    int? trainerId,
    String? searchQuery,
    String? activeStatus,
    int? batchId,
    int? pageNo,
  }) async {
    try {
      String path = '';

      if (batchId == null) {
        path = '/trainers/$trainerId/students';
      } else {
        path = '/trainers/$trainerId/batches/$batchId/students';
      }
      if (activeStatus != null) {
        path = '/trainers/$trainerId/batches/$batchId/$activeStatus';
      }

      if (searchQuery != null) {
        path += '/search/$searchQuery';
      }

      path += '?page=$pageNo';

      var response = await _client.get(queryPath: path);
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

  Future<StudentResponse?> studentDetailsForTrainer(
      int trainerId, int? studentId) async {
    try {
      var response = await _client.get(
          queryPath: '/trainers/$trainerId/students/$studentId');
      return studentResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<StudentsBatchResponse?> getStudentBatches(int? studentId) async {
    var response =
        await _client.get(queryPath: '/admin/students/$studentId/batches');

    return studentBatchResponseFromJson(jsonEncode(response));
  }

  Future<StudentsBatchResponse?> getStudentBatchesForTrainer(
      int? studentId, int? trainerId) async {
    var response = await _client.get(
        queryPath: '/trainers/$trainerId/students/$studentId/batches');

    return studentBatchResponseFromJson(jsonEncode(response));
  }

  Future<Common?> removeStudentBatch(int? batchId, int? studentId,
      {String? date, String? reason}) async {
    var response;
    if (date == "") {
      response = await _client.post(
        postPath: '/admin/batches/$batchId/remove/$studentId',
        data: {'reason': reason},
      );
    } else {
      response = await _client.post(
        postPath: '/admin/batches/$batchId/remove/$studentId',
        data: {'rejoining_date': date, 'reason': reason},
      );
    }

    return commonFromJson(jsonEncode(response));
  }

  Future<Common?> removeStudentBatchforTrainer(int? batchId, int? studentId,
      {String? date, String? reason, int? trainerId}) async {
    var response;
    if (date == "") {
      response = await _client.post(
        postPath: '/trainers/$trainerId/batches/$batchId/remove/$studentId',
        data: {'reason': reason},
      );
    } else {
      response = await _client.post(
        postPath: '/trainers/$trainerId/batches/$batchId/remove/$studentId',
        data: {'rejoining_date': date, 'reason': reason},
      );
    }

    return commonFromJson(jsonEncode(response));
  }
}
