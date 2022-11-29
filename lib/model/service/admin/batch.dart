import 'dart:convert';

import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/model/data_model/batch_request.dart';
import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/course.dart';
import 'package:part_app/model/data_model/reschedule_response.dart';
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
        baseUrl: 'https://dev.partapp.in/academy-type/$academyTypeId/courses',
      );

      return courseFromJson(jsonEncode(response));
    }
    return null;
  }

  Future<List<Course>?> getSubjects(int? courseId) async {
    var response = await _apiClient.get(
      queryPath: '',
      baseUrl: 'https://dev.partapp.in/course/$courseId/subjects',
    );

    return courseFromJson(jsonEncode(response));
  }

  Future<Common?> createBatch(BatchRequest request) async {
    try {
      var response = await _apiClient.post(
        postPath: '/admin/batches',
        data: request.toJson(),
        formData: true,
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> updateBatch(BatchRequest request, int? batchId) async {
    var data = request.toJson();
    data.removeWhere((key, value) => value == null);
    try {
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

  Future<RescheduleResponse?> rescheduledClasses(int? batchId) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/batches/$batchId/rescheduled-classes',
      );

      return rescheduleResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }
}
