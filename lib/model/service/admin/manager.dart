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

  Future<ManagerResponse?> getManagerById({required int managerId}) async {
    try {
      var map = await _client.get(
        queryPath: '/admin/managers/$managerId',
      );

      return managerResponseFromJson(jsonEncode(map));
    } on Exception catch (e) {
      return null;
    }
  }

  Future<Common?> activateManager(
      {required int managerId, required int status}) async {
    try {
      var map = await _client.get(
        queryPath: '/admin/managers/$managerId/activation/$status',
      );

      return commonFromJson(jsonEncode(map));
    } on Exception catch (e) {
      return null;
    }
  }

  Future<Common?> updateManager(
      {required Map<String, dynamic> data, required String branchId}) async {
    try {
      var response = await _client.post(
        postPath: '/admin/managers/$branchId',
        data: data,
      );
    } catch (e) {
      print(e);
    }
  }
}
