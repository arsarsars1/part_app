import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:part_app/model/data_model/branch_trainer_response.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/salary_slip.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/model/data_model/trainer_salary_slip.dart';
import 'package:part_app/model/service/api.dart';

class TrainerService {
  final _client = ApiClient();

  Future<TrainerResponse?> getTrainers() async {
    var response = await _client.get(queryPath: '/admin/trainers/');

    try {
      TrainerResponse trainerResponse = trainerResponseFromJson(
        jsonEncode(response),
      );
      return trainerResponse;
    } on Exception {
      return null;
    }
  }

  Future<Common?> addSalary(int? slipId, Map<String, dynamic> data) async {
    try {
      var response = await _client.post(
        postPath: '/admin/salary/trainers/$slipId/payments',
        data: data,
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> addAdvanceFees(Map<String, dynamic> data) async {
    try {
      var response = await _client.post(
        postPath: '/admin/salary/trainers/advance-payment',
        data: data,
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> closeOffFees(
      Map<String, dynamic> request, int? slipId) async {
    try {
      var response = await _client.post(
        postPath: '/admin/salary/trainers/$slipId/write-off',
        data: request,
      );

      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> deleteSalary(int? slipId, int? paymentId) async {
    try {
      var response = await _client.delete(
        queryPath: '/admin/salary/trainers/$slipId/payments/$paymentId',
      );

      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> editSalary(
      Map<String, dynamic> request, int? slipId, int? paymentId) async {
    try {
      var response = await _client.post(
        postPath: '/admin/salary/trainers/$slipId/payments/$paymentId',
        data: request,
      );

      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<TrainerResponse?> getActiveTrainers(
      {int? branchId, active = false}) async {
    var response = active
        ? await _client.get(
            queryPath: branchId == null
                ? '/admin/trainers/?active=1'
                : '/admin/branches/$branchId/trainers/?active=1')
        : await _client.get(
            queryPath: branchId == null
                ? '/admin/trainers/?active=0'
                : '/admin/branches/$branchId/trainers/?active=0');

    try {
      TrainerResponse trainerResponse =
          trainerResponseFromJson(jsonEncode(response));
      return trainerResponse;
    } on Exception {
      return null;
    }
  }

  Future<TrainerResponse?> getRestOfTheTrainers({String? path = ""}) async {
    var response = await _client.get(queryPath: '/admin/trainers?$path');

    try {
      TrainerResponse trainerResponse = trainerResponseFromJson(
        jsonEncode(response),
      );
      return trainerResponse;
    } on Exception {
      return null;
    }
  }

  Future<List<Trainer>?> searchTrainer(int? branchId,
      {required String query}) async {
    Map<String, dynamic> response;
    if (branchId == null) {
      response = await _client.get(queryPath: '/admin/trainers/search/$query');
    } else {
      response = await _client.get(
        queryPath: '/admin/trainers/$branchId/search/$query',
      );
    }

    try {
      BranchTrainerResponse trainerResponse = branchTrainerResponseFromJson(
        jsonEncode(response),
      );
      return trainerResponse.trainers;
    } on Exception {
      return null;
    }
  }

  /// Method to get the trainer details by [ trainerId ]
  /// for the logged in admin user
  Future<Trainer?> getTrainerById({required int trainerId}) async {
    try {
      var response = await _client.get(queryPath: '/admin/trainers/$trainerId');
      TrainerResponse trainerResponse = trainerResponseFromJson(
        jsonEncode(response),
      );

      if (trainerResponse.status == 1) {
        return trainerResponse.trainer;
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return null;
  }

  Future<Common?> createTrainer(Map<String, dynamic> data) async {
    try {
      var response = await _client.post(
        postPath: '/admin/trainers',
        data: data,
        formData: true,
      );
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> updateTrainer(
    Map<String, dynamic> data,
    int trainerId,
  ) async {
    try {
      var response = await _client.post(
        postPath: '/admin/trainers/$trainerId',
        data: data,
        formData: true,
      );
      print(response.toString());
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> updateTrainerStatus(
      {required int trainerId, required int status}) async {
    try {
      var map = await _client.get(
        queryPath: '/admin/trainers/$trainerId/activation/$status',
      );

      return commonFromJson(jsonEncode(map));
    } on Exception {
      return null;
    }
  }

  Future<TrainerSalarySlip?> salaryDetails({
    int? trainerId,
    int? month,
    int? year,
    int? branchId,
    String? searchQuery = '',
    required int pageNo,
  }) async {
    try {
      log(branchId.toString());
      if (branchId == null) {
        var response = await _client.get(
            queryPath: month != null
                ? '/admin/trainers/$trainerId/salary-history/$year/$month&page=$pageNo'
                : '/admin/trainers/$trainerId/salary-history/$year&page=$pageNo');
        return trainerSalarySlipFromJson(jsonEncode(response));
      } else {
        var response = await _client.get(
            queryPath: month != null
                ? '/admin/salary/trainers?branch_id=$branchId&year=$year&month=$month&page=$pageNo'
                : '/admin/salary/trainers?branch_id=$branchId&year=$year&page=$pageNo');
        return trainerSalarySlipFromJson(jsonEncode(response));
      }
    } catch (e) {
      return null;
    }
  }

  Future<SalarySlip?> salaryPayments({
    required int? trainerSlipId,
  }) async {
    try {
      var response =
          await _client.get(queryPath: '/admin/salary/trainers/$trainerSlipId');
      return salarySlipFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }
}
