import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
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
        data: request.toJson().removeNulls(),
      );
      Common common = commonFromJson(jsonEncode(response));
      return common;
    } catch (e) {
      return null;
    }
  }

  Future<Common?> update({required LeadRequest request, int? id}) async {
    try {
      var response = await _apiClient.post(
        postPath: '/admin/leads/$id',
        data: request.toJson().removeNulls(),
      );
      Common common = commonFromJson(jsonEncode(response));
      return common;
    } catch (e) {
      return null;
    }
  }

  Future<Common?> updateFollowUp(
      {required LeadRequest request, int? leadId, int? id}) async {
    try {
      String path;
      if (id != null) {
        path = '/admin/leads/$leadId/follow-ups/$id';
      } else {
        path = '/admin/leads/$leadId/follow-ups';
      }
      var response = await _apiClient.post(
        postPath: path,
        data: updateLeadStatus(request.toJson()).removeNulls(),
      );
      Common common = commonFromJson(jsonEncode(response));
      return common;
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic> updateLeadStatus(Map<String, dynamic> json) {
    if (json.containsKey('lead_status')) {
      json['follow_up_status'] = json.remove('lead_status');
    }
    return json;
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

  Future<Lead?> getLeadById({required String id}) async {
    try {
      var response = await _apiClient.get(queryPath: '/admin/leads/$id');
      return Lead.fromJson(response["lead"]);
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<LeadsResponse?> getLeadList(
      {int? branchId,
      int? batchId,
      String? date,
      String? leadStatus,
      String? searchQuery,
      required int pageNo}) async {
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

  Future<LeadsResponse?> getLeadLists({required int pageNo}) async {
    try {
      var response =
          await _apiClient.get(queryPath: '/admin/leads/?page=$pageNo');
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
