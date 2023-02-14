import 'dart:convert';

import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/lead_request.dart';
import 'package:part_app/model/data_model/leads_response.dart';
import 'package:part_app/model/service/api_client.dart';

class LeadsService {
  final _apiClient = ApiClient();

  Future<Common?> create({required LeadRequest request}) async {
    try {
      var response = await _apiClient.post(
        postPath: '/admin/leads',
        data: request.toJson(),
      );
      Common common = commonFromJson(jsonEncode(response));
      return common;
    } catch (e) {
      return null;
    }
  }

  Future<LeadsResponse?> list() async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/leads',
      );
      LeadsResponse leadsResponse = leadsResponseFromJson(jsonEncode(response));
      return leadsResponse;
    } catch (e) {
      return null;
    }
  }
}
