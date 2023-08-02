import 'dart:convert';
import 'dart:developer';

import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/lead_request.dart';
import 'package:part_app/model/data_model/lead_statuses.dart';
import 'package:part_app/model/data_model/leads_response.dart';
import 'package:part_app/model/extensions.dart';
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

  Future<LeadsResponse?> todayLeadsList() async {
    try {
      var response = await _apiClient.get(
        queryPath:
            '/admin/leads/?follow_up_date=${DateTime.now().toServerYMD()}',
      );
      LeadsResponse leadsResponse = leadsResponseFromJson(jsonEncode(response));
      return leadsResponse;
    } catch (e) {
      return null;
    }
  }

  Future<LeadsResponse?> getLeadList({
    int? branchId,
    int? batchId,
    String? date,
    String? leadStatus,
    String? searchQuery,
    required int pageNo,
  }) async {
    try {
      var response = await _apiClient.get(
          queryPath: date == null
              ? searchQuery == '' || searchQuery == null
                  ? '/admin/leads/?branch_id=$branchId&batch_id=$batchId&lead_status=$leadStatus&page=$pageNo'
                  : '/admin/leads/?branch_id=$branchId&batch_id=$batchId&lead_status=$leadStatus&search=$searchQuery&page=$pageNo'
              : searchQuery == '' || searchQuery == null
                  ? '/admin/leads/?branch_id=$branchId&batch_id=$batchId&lead_status=$leadStatus&follow_up_date=$date&page=$pageNo'
                  : '/admin/leads/?branch_id=$branchId&batch_id=$batchId&lead_status=$leadStatus&search=$searchQuery&follow_up_date=$date&page=$pageNo');
      return leadsResponseFromJson(jsonEncode(response));
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<LeadsStatuses?> getLeadStatuses() async {
    try {
      var response = await _apiClient.get(
        queryPath: '/admin/lead-status',
      );
      LeadsStatuses leadsResponse = leadsStatusesFromJson(jsonEncode(response));
      return leadsResponse;
    } catch (e) {
      return null;
    }
  }
}
