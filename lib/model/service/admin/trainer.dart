import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:part_app/model/data_model/assignable_model.dart';
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

  Future<TrainerResponse?> getTrainersForManager(int managerId) async {
    var response =
        await _client.get(queryPath: '/managers/$managerId/trainers/');

    try {
      TrainerResponse trainerResponse = trainerResponseFromJson(
        jsonEncode(response),
      );
      return trainerResponse;
    } on Exception {
      return null;
    }
  }

  Future<TrainerResponse?> getTrainersPagination({int pageNo = 1}) async {
    var response = await _client.get(queryPath: '/admin/trainers?page=$pageNo');

    try {
      TrainerResponse trainerResponse = trainerResponseFromJson(
        jsonEncode(response),
      );
      return trainerResponse;
    } on Exception {
      return null;
    }
  }

  Future<AssignableModel?> getAssignable({int? trainerId}) async {
    var response = await _client.get(
        queryPath: trainerId != null
            ? '/trainers/$trainerId/assignable'
            : '/admin/assignable');

    try {
      AssignableModel trainerResponse = assignableModelFromJson(
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

  Future<Common?> addSalaryForManager(int? slipId, Map<String, dynamic> data,
      {required int managerId}) async {
    try {
      var response = await _client.post(
        postPath: '/managers/$managerId/salary/trainers/$slipId/payments',
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

  Future<Common?> deleteSalaryForManager(int? slipId, int? paymentId,
      {required int managerId}) async {
    try {
      var response = await _client.delete(
        queryPath:
            '/managers/$managerId/salary/trainers/$slipId/payments/$paymentId',
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

  Future<Common?> editSalaryForManager(
      Map<String, dynamic> request, int? slipId, int? paymentId,
      {required int managerId}) async {
    try {
      var response = await _client.post(
        postPath:
            '/managers/$managerId/salary/trainers/$slipId/payments/$paymentId',
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

  Future<TrainerResponse?> getActiveTrainersForManager(
      {int? branchId, active = false, required int managerId}) async {
    var response = active
        ? await _client.get(
            queryPath: branchId == null
                ? '/managers/$managerId/trainers/?active=1'
                : '/managers/$managerId/branches/$branchId/trainers/?active=1')
        : await _client.get(
            queryPath: branchId == null
                ? '/managers/$managerId/trainers/?active=0'
                : '/managers/$managerId/branches/$branchId/trainers/?active=0');

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

  Future<List<Trainer>?> searchTrainerForManager(int? branchId,
      {required String query, required int managerId}) async {
    Map<String, dynamic> response;
    if (branchId == null) {
      response = await _client.get(
          queryPath: '/managers/$managerId/trainers/search/$query');
    } else {
      response = await _client.get(
        queryPath: '/managers/$managerId/trainers/$branchId/search/$query',
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
        debugPrint(e.toString());
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }

    return null;
  }

  /// Method to get the trainer details by [ trainerId ]
  /// for the logged in admin user
  Future<Trainer?> getTrainerByIdForManager(
      {required int trainerId, required int managerId}) async {
    try {
      var response = await _client.get(
          queryPath: '/managers/$managerId/trainers/$trainerId');
      TrainerResponse trainerResponse = trainerResponseFromJson(
        jsonEncode(response),
      );

      if (trainerResponse.status == 1) {
        return trainerResponse.trainer;
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
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

  Future<Common?> createTrainerForManager(
      Map<String, dynamic> data, int managerId) async {
    try {
      var response = await _client.post(
        postPath: '/managers/$managerId/trainers',
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
      return commonFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<Common?> updateTrainerForManager(
      Map<String, dynamic> data, int trainerId,
      {required int managerId}) async {
    try {
      var response = await _client.post(
        postPath: '/managers/$managerId/trainers/$trainerId',
        data: data,
        formData: true,
      );
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

  Future<Common?> updateTrainerStatusForManager(
      {required int trainerId,
      required int status,
      required int managerId}) async {
    try {
      var map = await _client.get(
        queryPath:
            '/managers/$managerId/trainers/$trainerId/activation/$status',
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
      String queryPath;
      if (branchId == null) {
        queryPath = '/admin';
        if (trainerId != null) {
          queryPath += '/trainers/$trainerId';
        }
        if (year != null) {
          queryPath += '/salary-history/$year';
          if (month != null) {
            queryPath += '/$month';
          }
        }
      } else {
        queryPath = '/admin/salary/trainers?branch_id=$branchId';
        if (year != null) {
          queryPath += '&year=$year';
          if (month != null) {
            queryPath += '&month=$month';
          }
        }
      }
      if (searchQuery != null && searchQuery != '') {
        queryPath += '&search=$searchQuery';
      }
      queryPath += '&page=$pageNo';
      var response = await _client.get(queryPath: queryPath);
      return trainerSalarySlipFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<TrainerSalarySlip?> salaryDetailsForManager({
    int? trainerId,
    int? month,
    int? year,
    int? branchId,
    String? searchQuery = '',
    required int pageNo,
    required int managerId,
  }) async {
    try {
      String queryPath;
      if (branchId == null) {
        queryPath = '/managers/$managerId';
        if (trainerId != null) {
          queryPath += '/trainers/$trainerId';
        }
        if (year != null) {
          queryPath += '/salary-history/$year';
          if (month != null) {
            queryPath += '/$month';
          }
        }
      } else {
        queryPath = '/managers/$managerId/salary/trainers?branch_id=$branchId';
        if (year != null) {
          queryPath += '&year=$year';
          if (month != null) {
            queryPath += '&month=$month';
          }
        }
      }
      if (searchQuery != null && searchQuery != '') {
        queryPath += '&search=$searchQuery';
      }
      queryPath += '&page=$pageNo';
      var response = await _client.get(queryPath: queryPath);
      return trainerSalarySlipFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }

  Future<TrainerSalarySlip?> salaryDetailsForTrainer({
    int? trainerId,
    int? month,
    int? year,
    int? branchId,
    String? searchQuery = '',
    required int pageNo,
  }) async {
    try {
      if (branchId == null) {
        var response = await _client.get(
            queryPath: month != null
                ? '/trainers/$trainerId/salary-history/$year/$month&page=$pageNo'
                : '/trainers/$trainerId/salary-history/$year&page=$pageNo');
        return trainerSalarySlipFromJson(jsonEncode(response));
      } else {
        var response = await _client.get(
            queryPath: month != null
                ? '/salary/trainers?branch_id=$branchId&year=$year&month=$month&page=$pageNo&search=${searchQuery ?? ''}'
                : '/salary/trainers?branch_id=$branchId&year=$year&page=$pageNo&search=${searchQuery ?? ''}');
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

  Future<SalarySlip?> salaryPaymentsForManager({
    required int? trainerSlipId,
    required int managerId,
  }) async {
    try {
      var response = await _client.get(
          queryPath: '/managers/$managerId/salary/trainers/$trainerSlipId');
      return salarySlipFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }
}
