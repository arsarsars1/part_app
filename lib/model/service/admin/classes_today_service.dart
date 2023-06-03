import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:part_app/model/data_model/ClassesToday.dart';
import 'package:part_app/model/data_model/branch_trainer_response.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/model/service/api.dart';

class ClassesTodayService {
  final _client = ApiClient();

  Future<ClassesToday?> getClassesToday() async {
    try {
      var response = await _client.get(queryPath: '/admin/batches/daily-classes/2023-06-04');
      return classesTodayFromJson(jsonEncode(response));
    } catch (e) {
      return null;
    }
  }
}
