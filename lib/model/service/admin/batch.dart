import 'dart:convert';
import 'dart:developer';

import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/model/data_model/batch_request.dart';
import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/data_model/cancel_response.dart';
import 'package:part_app/model/data_model/class_link_response.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/course.dart';
import 'package:part_app/model/data_model/reschedule_response.dart';
import 'package:part_app/model/data_model/student_app_batch_response.dart';
import 'package:part_app/model/data_model/students_response.dart';
import 'package:part_app/model/data_model/user_response.dart';
import 'package:part_app/model/service/api_client.dart';

class BatchService {
  final _apiClient = ApiClient();

  Future<List<Course>?> getCourses() async {
    String? string = await Database().getUser();
    if (string != null) {
      User? user = userResponseFromJson(string).user;
      int? academyTypeId = user!.adminDetail!.academy!.academyTypeId;
      var response = await _apiClient.get(
        queryPath: '',
        baseUrl: 'https://v1.partapp.in/academy-type/$academyTypeId/courses',
      );

      return courseFromJson(jsonEncode(response));
    }
    return null;
  }

  Future<List<Course>?> getCoursesForTrainer({int? acadamyId}) async {
    var response = await _apiClient.get(
      queryPath: '',
      baseUrl: 'https://v1.partapp.in/academy-type/$acadamyId/courses',
    );

    return courseFromJson(jsonEncode(response));
  }

  Future<List<Course>?> getSubjects(int? courseId) async {
    var response = await _apiClient.get(
      queryPath: '',
      baseUrl: 'https://v1.partapp.in/course/$courseId/subjects',
    );

    return courseFromJson(jsonEncode(response));
  }

  Future<BatchResponse?> createBatch(BatchRequest request) async {
    try {
      var response = await _apiClient.post(
        postPath: '/admin/batches',
        data: request.toJson(),
        formData: true,
      );
      return batchResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<BatchResponse?> createBatchForTrainer(
      int trainerId, BatchRequest request) async {
    try {
      var response = await _apiClient.post(
        postPath: '/trainers/$trainerId/batches',
        data: request.toJson(),
        formData: true,
      );
      return batchResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> updateBatch(BatchRequest request, int? batchId) async {
    // List<int?>? tempData = request.trainers;
    // List<Map<String, dynamic>> data = [];
    // tempData?.forEach((element) {
    //   data.add({"trainer[]": element});
    // });
    var data = request.toJson();
    data.removeWhere((key, value) => value == null);
    // if (data.containsKey('trainers[]')) {
    //   var items = data['trainers[]'];
    //   if (items.isEmpty) {
    //     data.remove('trainers[]');
    //     data.putIfAbsent('trainers[]', () => '');
    //   } else {
    //     data.remove('trainers[]');
    //     final gasGiants = <String, dynamic>{'trainers': items};
    //     data.addEntries(gasGiants.entries);
    //   }
    // }

    try {
      log(data.toString());
      var response = await _apiClient.post(
        postPath: '/admin/batches/$batchId',
        data: data,
        formData: true,
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<BatchResponse?> getBatches() async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/batches/',
      );

      return batchResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  /// this method will handle four different apis based on
  /// [ branchId ] , [ status ] , [ search ]
  Future<BatchResponse?> getBatchesByStatus({
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

      var response = await _apiClient.get(
        queryPath: path,
      );

      return batchResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  /// this method will handle four different apis based on
  /// [ branchId ] , [ status ] , [ search ]
  Future<BatchResponse?> getBatchesByStatusForTrainer({
    int? trainerId,
    int? branchId,
    String status = 'ongoing',
    String? search,
    required int page,
    bool branchSearch = false,
  }) async {
    try {
      String path = branchId == null
          ? '/trainers/$trainerId/batches/batch-status/$status'
          : '/trainers/$trainerId/branches/$branchId/batches/batch-status/$status';

      if (branchSearch) {
        path =
            '/trainers/$trainerId/branches/$branchId/batches/batch-status/ongoing';
      }

      /// append the search text if search query is not null
      if (search != null) {
        path += '/search/$search';
      }

      path += '?page=$page';

      var response = await _apiClient.get(
        queryPath: path,
      );

      return batchResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<StudentAppBatchResponse?> getStudentAppBatchesByStatus({
    int? studentId,
    int? branchId,
    String status = 'ongoing',
    String? search,
    required int page,
    bool branchSearch = false,
  }) async {
    try {
      String path = branchId == null
          ? '/students/$studentId/batches'
          : '/students/$studentId/branches/$branchId/batches';

      if (branchSearch) {
        path = '/students/$studentId/branches/$branchId/batches';
      }

      /// append the search text if search query is not null
      if (search != null) {
        path += '/search/$search';
      }

      path += '?page=$page';

      var response = await _apiClient.get(
        queryPath: path,
      );

      return studentAppBatchResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<BatchResponse?> getStudentBatchesByStatus({
    int? studentId,
    String status = 'ongoing',
    String? search,
    required int page,
    bool studentSearch = false,
  }) async {
    try {
      String path = studentId == null
          ? '/admin/batches/batch-status/$status'
          : '/admin/students/$studentId/batches/batch-status/$status';

      if (studentSearch) {
        path = '/admin/students/$studentId/batches';
      }

      /// append the search text if search query is not null
      if (search != null) {
        path += '/search/$search';
      }

      path += '?page=$page';

      var response = await _apiClient.get(
        queryPath: path,
      );

      return batchResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<BatchResponse?> getBatchesByBranch(
      {required int page, required int? branchId}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/branches/$branchId/batches?page=$page',
      );

      return batchResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<BatchResponse?> getBatchesByBranchForTrainer(
      {required int page,
      required int? branchId,
      required int trainerId}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/trainers/$trainerId/branches/$branchId/batches?page=$page',
      );

      return batchResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<BatchResponse?> getBatch({required String id}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/batches/$id',
      );

      return batchResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<BatchResponse?> getBatchForTrainer(
      {required int trainerId, required String id}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/trainers/$trainerId/batches/$id',
      );

      return batchResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<List<Batch>?> getTrainerBatches(int? trainerId) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/trainers/$trainerId/batches',
      );

      var map = response['batches'] as List;

      var items = map.map((e) => Batch.fromJson(e));
      return items.toList();
    } catch (e) {
      return null;
    }
  }

  Future<Common?> rescheduleClass(Map<String, dynamic> request,
      [int? batchId]) async {
    try {
      var response = await _apiClient.post(
        postPath: '/admin/batches/$batchId/reschedule-class',
        data: request,
      );

      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> rescheduleClassForTrainer(
      Map<String, dynamic> request, int trainerId,
      [int? batchId]) async {
    try {
      var response = await _apiClient.post(
        postPath: '/trainers/$trainerId/batches/$batchId/reschedule-class',
        data: request,
      );

      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> cancelClass(Map<String, dynamic> request,
      [int? batchId]) async {
    try {
      var response = await _apiClient.post(
        postPath: '/admin/batches/$batchId/cancel-class',
        data: request,
      );

      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> cancelClassForTrainer(
      Map<String, dynamic> request, int trainerId,
      [int? batchId]) async {
    try {
      var response = await _apiClient.post(
        postPath: '/trainers/$trainerId/batches/$batchId/cancel-class',
        data: request,
      );

      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> deactivateClass(
      {required int? batchId, required int? classId}) async {
    try {
      var response = await _apiClient.delete(
        queryPath: '/admin/batches/$batchId/rescheduled-classes/$classId',
      );

      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> deactivateClassForTrainer(
      {required int trainerId,
      required int? batchId,
      required int? classId}) async {
    try {
      var response = await _apiClient.delete(
        queryPath:
            '/trainers/$trainerId/batches/$batchId/rescheduled-classes/$classId',
      );

      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<RescheduleResponse?> rescheduledClasses(int? batchId,
      {int? year, int? month}) async {
    String query = 'year=${year ?? DateTime.now().year}'
        '&month=${month ?? DateTime.now().month}';

    try {
      var response = await _apiClient.get(
        queryPath: '/admin/batches/$batchId/rescheduled-classes?$query',
      );

      return rescheduleResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<RescheduleResponse?> rescheduledClassesForTrainer(int? batchId,
      {required int trainerId, int? year, int? month}) async {
    String query = 'year=${year ?? DateTime.now().year}'
        '&month=${month ?? DateTime.now().month}';

    try {
      var response = await _apiClient.get(
        queryPath:
            '/trainers/$trainerId/batches/$batchId/rescheduled-classes?$query',
      );

      return rescheduleResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> deleteClassCancellation(
      {required int? batchId, required int? classId}) async {
    try {
      var response = await _apiClient.delete(
        queryPath: '/admin/batches/$batchId/cancelled-classes/$classId',
      );

      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<CancelResponse?> cancelledClasses(int? batchId,
      {int? year, int? month}) async {
    String query = 'year=${year ?? DateTime.now().year}'
        '&month=${month ?? DateTime.now().month}';

    try {
      var response = await _apiClient.get(
        queryPath: '/admin/batches/$batchId/cancelled-classes?$query',
      );

      return cancelResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<CancelResponse?> cancelledClassesForTrainer(
      int? batchId, int trainerId,
      {int? year, int? month}) async {
    String query = 'year=${year ?? DateTime.now().year}'
        '&month=${month ?? DateTime.now().month}';

    try {
      var response = await _apiClient.get(
        queryPath:
            '/trainers/$trainerId/batches/$batchId/cancelled-classes?$query',
      );

      return cancelResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<StudentsResponse?> getStudentsByBatch(int? batchId) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/batches/$batchId/students',
      );
      return studentsResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> addClassLink(int? batchId, Map<String, dynamic> data) async {
    try {
      var response = await _apiClient.post(
        postPath: '/admin/batches/$batchId/class-link',
        data: data,
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> updateClassLink(
      int? batchId, int? classId, Map<String, dynamic> data) async {
    try {
      var response = await _apiClient.post(
        postPath: '/admin/batches/class-link/$classId',
        data: data,
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> removeClassLink(int? batchId, int? linkId) async {
    try {
      var response = await _apiClient.delete(
          queryPath: '/admin/batches/$batchId/class-link/$linkId/');
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<ClassLinkResponse?> getClassLink(
      int? batchId, DateTime? dateTime) async {
    try {
      var response = await _apiClient.get(
        queryPath:
            '/admin/batches/$batchId/class-link/date/${dateTime?.year}-${dateTime?.month}-${dateTime?.day}',
      );
      // log(response.toString());
      return classLinkResponseFromJson(json.encode(response));
      // return ClassLinkResponse.fromJson(response);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
