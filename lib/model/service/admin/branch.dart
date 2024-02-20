import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/model/data_model/class_response.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/model/service/api_client.dart';

class BranchService {
  final _apiClient = ApiClient();

  Future<Common?> create({
    required String stateId,
    required String branchName,
    required String countryId,
    required String districtId,
    required String location,
    required String address,
    required String pinCode,
  }) async {
    try {
      var response = await _apiClient.post(
        postPath: '/admin/branches',
        data: {
          'state_id': stateId,
          'branch_name': branchName,
          'country_id': countryId,
          'district_id': districtId,
          'location': location,
          'address': address,
          'pincode': pinCode,
        },
      );
      Common common = commonFromJson(jsonEncode(response));
      return common;
    } catch (e) {
      return null;
    }
  }

  Future<Common?> update({
    required String stateId,
    required String branchName,
    required String countryId,
    required String districtId,
    required String location,
    required String address,
    required String pinCode,
    required int? branchId,
    required int? isActive,
  }) async {
    try {
      var response = await _apiClient.post(
        postPath: '/admin/branches/$branchId',
        data: {
          'state_id': stateId,
          'branch_name': branchName,
          'country_id': countryId,
          'district_id': districtId,
          'location': location,
          'address': address,
          'pincode': pinCode,
          'is_active': isActive,
        },
      );
      Common common = commonFromJson(jsonEncode(response));
      return common;
    } catch (e) {
      return null;
    }
  }

  Future<List<Branch>?> getBranches() async {
    try {
      var response = await _apiClient.get(queryPath: '/admin/branches');
      BranchResponse branchResponse =
          branchResponseFromJson(jsonEncode(response));
      if (branchResponse.status == 1 && branchResponse.branches != null) {
        var list = branchResponse.branches;
        return list;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<Branch>?> getBranchesForTrainer({int? trainerId}) async {
    try {
      var response = await _apiClient.get(queryPath: '/trainers/$trainerId/branches');
      BranchResponse branchResponse =
          branchResponseFromJson(jsonEncode(response));
      if (branchResponse.status == 1 && branchResponse.branches != null) {
        var list = branchResponse.branches;
        return list;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<List<Branch>?> getStudentAppBranches({int? studentId}) async {
    try {
      var response =
          await _apiClient.get(queryPath: '/students/$studentId/branches');
      BranchResponse branchResponse =
          branchResponseFromJson(jsonEncode(response));
      if (branchResponse.status == 1 && branchResponse.branches != null) {
        var list = branchResponse.branches;
        return list;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<Branch?> getBranchById({required String id}) async {
    try {
      var response = await _apiClient.get(queryPath: '/admin/branches/$id');
      BranchResponse branchResponse =
          branchResponseFromJson(jsonEncode(response));
      if (branchResponse.status == 1 && branchResponse.branch != null) {
        return branchResponse.branch;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  @Deprecated('This feature is removed and the same is moved to update API')
  Future changeBranchStatus(
      {required int status, required int branchId}) async {
    await _apiClient.get(
      queryPath: '/admin/branches/$branchId/activation/$status',
    );
  }

  Future<TrainerResponse?> getTrainers(
      {required String branchId, int pageNo = 1}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/branches/$branchId/trainers?page=$pageNo',
      );
      return trainerResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<TrainerResponse?> getBatchTrainers(
      {required String batchId, int pageNo = 1}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/batches/$batchId/trainers?page=$pageNo',
      );
      return trainerResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<ClassResponse?> getBatchClasses(
      {required String batchId,
      required String brabchId,
      required String date,
      int pageNo = 1}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/batches/$batchId/daily-classes/$date',
      );
      return classResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<ClassResponse?> getBranchClasses(
      {required String branchId, required String date, int pageNo = 1}) async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/branches/$branchId/daily-classes/$date',
      );
      return classResponseFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }
}
