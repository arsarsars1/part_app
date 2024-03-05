import 'dart:convert';
import 'package:part_app/model/data_model/attendance_monthly_record.dart';
import 'package:part_app/model/data_model/attendence_add_request.dart';
import 'package:part_app/model/data_model/attendence_classes_conducted.dart';
import 'package:part_app/model/data_model/attendence_classes_of_month.dart';
import 'package:part_app/model/data_model/attendence_taken.dart';
import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/student_attendence_of_month.dart';
import 'package:part_app/model/service/api_client.dart';

class AttendanceService {
  final _apiClient = ApiClient();

  Future<BatchResponse?> getBatches({required int branchId}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/branches/$branchId/batches',
      );

      return batchResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> updateAttendence(
      {Map<String, dynamic>? request,
      int? batchId,
      int? conductedClassId,
      int? conductedClassStudentId}) async {
    try {
      var response = await _apiClient.post(
        postPath:
            '/admin/batches/$batchId/attendance/$conductedClassId/$conductedClassStudentId',
        data: request ?? {"": ""},
      );

      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<AttendenceTaken?> getAttendenceTaken(
      {required int batchId, required int conductedClassId}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/batches/$batchId/attendance/$conductedClassId',
      );

      return attendenceTakenFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> createAttendence(AttendenceAddRequest request,
      {int? batchId}) async {
    try {
      var response = await _apiClient.post(
        postPath: '/admin/batches/$batchId/attendance',
        data: request.toJson(),
        formData: true,
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<AttendenceClassDetailsesOfMonth?> getAttendeceClassesOfMonth(
      {required int? batchId, required DateTime? date}) async {
    try {
      var response = await _apiClient.get(
        queryPath:
            '/admin/batches/$batchId/monthly-classes/${date?.year}/${date?.month}',
      );

      return attendenceClassDetailsesOfMonthFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<AttendenceClassDetailsesOfMonth?> getAttendeceClassesOfMonthForTrainer(
      {required int trainerId,
      required int? batchId,
      required DateTime? date}) async {
    try {
      var response = await _apiClient.get(
        queryPath:
            '/trainers/$trainerId/batches/$batchId/monthly-classes/${date?.year}/${date?.month}',
      );

      return attendenceClassDetailsesOfMonthFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<AttendenceClassDetailsesOfMonth?> getStudentAppAttendeceClassesOfMonth(
      {required int? batchId, required DateTime? date, int? studentId}) async {
    try {
      var response = await _apiClient.get(
        queryPath:
            '/students/$studentId/batches/$batchId/monthly-classes/${date?.year}/${date?.month}',
      );

      return attendenceClassDetailsesOfMonthFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<AttendenceConductedClass?> getConductedAttendeceClassesOfMonth(
      {required int? batchId, required DateTime? date}) async {
    try {
      var response = await _apiClient.get(
        queryPath:
            '/admin/batches/$batchId/attendance/list/${date?.year}/${date?.month}',
      );

      return attendenceConductedClassFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<StudentAttendenceOfMonth?> getAttendenceOfStudentOfMonth(
      {required int? batchId,
      required int? studentDetailId,
      required DateTime? date}) async {
    try {
      var response = await _apiClient.get(
        queryPath:
            '/admin/students/$studentDetailId/batch/$batchId/attendance/${date?.year}/${date?.month}',
      );

      return studentAttendenceOfMonthFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<StudentAttendenceOfMonth?> getAttendenceOfStudentOfMonthForTrainer(
      {required int trainerId,
      required int? batchId,
      required int? studentDetailId,
      required DateTime? date}) async {
    try {
      var response = await _apiClient.get(
        queryPath:
            '/trainer/$trainerId/students/$studentDetailId/batch/$batchId/attendance/${date?.year}/${date?.month}',
      );

      return studentAttendenceOfMonthFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<StudentAttendenceOfMonth?> getStudentAppAttendenceOfStudentOfMonth(
      {required int? batchId,
      required int? studentDetailId,
      required DateTime? date}) async {
    try {
      var response = await _apiClient.get(
        queryPath:
            '/students/$studentDetailId/batches/$batchId/attendance/${date?.year}/${date?.month}',
      );

      return studentAttendenceOfMonthFromJson(jsonEncode(response));
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

  Future<AttendanceMonthlyRecord?> getStudents({
    String? searchQuery,
    String? activeStatus,
    int? batchId,
    int? pageNo,
    int? month,
    int? year,
  }) async {
    try {
      String path = '';
      if (batchId != null) {
        path = '/admin/batches/$batchId/attendance/record/$year/$month';
      }
      path += '?page=$pageNo';
      var response = await _apiClient.get(queryPath: path);
      return attendanceMonthlyRecordFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }
}
