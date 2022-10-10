import 'dart:convert';

import 'package:part_app/model/data_model/dashboard.dart';
import 'package:part_app/model/service/api_client.dart';

class DashboardService {
  final _apiClient = ApiClient();

  Future<Dashboard> getDashboard() async {
    try {
      var response = await _apiClient.get(queryPath: '/admin/dashboard');
      Dashboard dashboard = dashboardFromJson(json.encode(response));
      return dashboard;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
