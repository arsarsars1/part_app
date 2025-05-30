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

  Future<StudentResponse?> createStudentForManager({
    Map<String, dynamic>? request,
    int? managerId,
  }) async {
    try {
      request?.removeWhere((key, value) => value == null);
      var response = await _client.post(
        postPath: '/managers/$managerId/students',
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

  Future<StudentResponse?> enrollToBatchForStudent(
      Map<String, dynamic> request, String token) async {
    try {
      request.removeWhere((key, value) => value == null);
      var response = await _client.post(
          postPath: '/students/join-batch/$token', data: request);
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

  Future<StudentResponse?> enrollToBatchForManager({
    Map<String, dynamic>? request,
    int? studentId,
    int? managerId,
  }) async {
    try {
      request?.removeWhere((key, value) => value == null);
      var response = await _client.post(
          postPath: '/managers/$managerId/students/$studentId/enroll',
          data: request!);
      return studentResponseFromJson(jsonEncode(response));
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<StudentResponse?> updateStudent(Map<String, dynamic> request, int? id,
      {int? trainerId}) async {
    try {
      request.removeWhere((key, value) => value == null);
      var response = await _client.post(
        postPath: trainerId != null
            ? '/trainers/$trainerId/students/$id'
            : '/admin/students/$id',
        data: request,
        formData: true,
      );
      return studentResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<StudentResponse?> updateStudentForTrainer(
      Map<String, dynamic> request, int? id, int trainerId) async {
    try {
      request.removeWhere((key, value) => value == null);
      var response = await _client.post(
        postPath: '/trainers/$trainerId/students/$id',
        data: request,
        formData: true,
      );
      return studentResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<StudentResponse?> updateStudentForManager(
      Map<String, dynamic> request, int? id, int managerId) async {
    try {
      request.removeWhere((key, value) => value == null);
      var response = await _client.post(
        postPath: '/managers/$managerId/students/$id',
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

  /// this method will handle four different apis based on
  /// [ branchId ] , [ status ] , [ search ]
  Future<StudentsResponse?> getStudentByBatches({
    int? branchId,
    String status = 'ongoing',
    String? search,
    required int page,
    bool branchSearch = false,
  }) async {
    try {
      String path = branchId == null
          ? '/admin/batches/batch-status/$status'
          : '/admin/branches/$branchId/batches/batch-status/$status';

      if (branchSearch) {
        path = '/admin/branches/$branchId/batches';
      }

      /// append the search text if search query is not null
      if (search != null) {
        path += '/search/$search';
      }

      path += '?page=$page';

      var response = await _client.get(
        queryPath: path,
      );

      return studentsResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<StudentsResponse?> getStudents({
    String? searchQuery,
    String? activeStatus,
    int? batchId,
    int? branchId,
    int? pageNo,
  }) async {
    try {
      String path = '';
      if (batchId != null && activeStatus != null && searchQuery != null) {
        path = '/admin/batches/$batchId/students/search/$searchQuery';
      } else if (branchId != null && searchQuery != null) {
        path = '/admin/students/search/$searchQuery?branch_id=$branchId';
      } else if (batchId != null && activeStatus != null) {
        path = '/admin/batches/$batchId/students'; //batch-status/$activeStatus
      } else if (batchId != null) {
        path = '/admin/batches/$batchId/students';
      } else if (searchQuery != null) {
        path = '/admin/students/search/$searchQuery';
      } else if (branchId != null) {
        path = '/admin/branches/$branchId/students';
      } else {
        path = '/admin/students';
      }

      // Append page number to all paths
      path += '?page=$pageNo';

      var response = await _client.get(queryPath: path);
      return studentsResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<StudentsResponse?> getBatchStudents({
    String? searchQuery,
    String? activeStatus,
    int? batchId,
    int? pageNo,
  }) async {
    try {
      String path = '';
      if (activeStatus != null) {
        path = '/admin/batches/$batchId/inactive-students';
      } else {
        path = '/admin/batches/$batchId/students';
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

  Future<StudentsResponse?> getStudentsForTrainer(
      {int? trainerId,
      String? searchQuery,
      String? activeStatus,
      int? batchId,
      int? branchId,
      int? pageNo}) async {
    try {
      String path = '';

      if (trainerId != null && activeStatus != null && batchId != null) {
        path = "/trainers/$trainerId/batches/$batchId/$activeStatus";
      } else if (branchId != null && batchId == null) {
        path = '/trainers/$trainerId/branches/$branchId/students';
      } else if (batchId != null) {
        path = '/trainers/$trainerId/batches/$batchId/students';
      } else {
        path = '/trainers/$trainerId/students';
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

  Future<StudentsResponse?> getStudentsForManager(
      {int? managerId,
      String? searchQuery,
      String? activeStatus,
      int? batchId,
      int? branchId,
      int? pageNo}) async {
    try {
      String path = '';

      if (branchId != null && activeStatus != null && batchId == null) {
        path =
            '/managers/$managerId/branches/$branchId/students/batch-status/$activeStatus';
      } else if (branchId != null && batchId == null) {
        path = '/managers/$managerId/branches/$branchId/students';
      } else if (batchId != null) {
        path = '/managers/$managerId/batches/$batchId/students';
      } else {
        path = '/managers/$managerId/students';
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

  Future<StudentResponse?> studentDetailsForManager(
      int managerId, int? studentId) async {
    try {
      var response = await _client.get(
          queryPath: '/managers/$managerId/students/$studentId');
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

  Future<StudentsBatchResponse?> getStudentBatchesForManager(
      int? studentId, int? managerId) async {
    var response = await _client.get(
        queryPath: '/managers/$managerId/students/$studentId/batches');

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

  Future<Common?> removeStudentBatchforManager(int? batchId, int? studentId,
      {String? date, String? reason, int? managerId}) async {
    var response;
    if (date == "") {
      response = await _client.post(
        postPath: '/managers/$managerId/batches/$batchId/remove/$studentId',
        data: {'reason': reason},
      );
    } else {
      response = await _client.post(
        postPath: '/managers/$managerId/batches/$batchId/remove/$studentId',
        data: {'rejoining_date': date, 'reason': reason},
      );
    }

    return commonFromJson(jsonEncode(response));
  }
}
