import 'dart:convert';

import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/manager_request.dart';
import 'package:part_app/model/data_model/manager_response.dart';
import 'package:part_app/model/service/api_client.dart';

class ManagerService {
  final _client = ApiClient();

  Future<Common?> createManager({required ManagerRequest request}) async {
    try {
      var map = await _client.post(
        postPath: '/admin/managers',
        data: request.toJson(),
      );
      return commonFromJson(jsonEncode(map));
    } catch (e) {
      return null;
    }
  }

  Future<ManagerResponse?> getManagers() async {
    try {
      var map = await _client.get(
        queryPath: '/admin/managers',
      );
      print(jsonEncode(map));

      return managerResponseFromJson(jsonEncode(map));
    } on Exception catch (e) {
      return null;
    }
  }
}
