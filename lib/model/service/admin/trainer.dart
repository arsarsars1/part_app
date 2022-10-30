import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/model/service/api.dart';

class TrainerService {
  final _client = ApiClient();

  Future getTrainers() async {
    var response = await _client.get(queryPath: '/admin/trainers/');
    log(jsonEncode(response));
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
}
