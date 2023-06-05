import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:part_app/model/data_model/branch_trainer_response.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
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
    } on Exception catch (e) {
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
      TrainerResponse trainerResponse = trainerResponseFromJson(
        jsonEncode(response),
      );
      return trainerResponse;
    } on Exception catch (e) {
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
    } on Exception catch (e) {
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
    } on Exception catch (e) {
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
    } on DioError catch (e) {
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
    } on Exception catch (e) {
      return null;
    }
  }
}
