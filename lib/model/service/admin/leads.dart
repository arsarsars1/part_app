import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:part_app/model/data_model/chart_data_model.dart';
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

  Future<Common?> createForManager(
      {required LeadRequest request, required int managerId}) async {
    try {
      var response = await _apiClient.post(
        postPath: '/managers/$managerId/leads',
        data: request.toJson().removeNulls(),
      );
      Common common = commonFromJson(jsonEncode(response));
      return common;
    } catch (e) {
      return null;
    }
  }

  Future<Common?> createTrainerLead(
      {required LeadRequest request, int? idTrainer}) async {
    try {
      var response = await _apiClient.post(
        postPath: '/trainers/$idTrainer/leads',
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

  Future<Common?> updateForManager(
      {required LeadRequest request, int? id, required int managerId}) async {
    try {
      var response = await _apiClient.post(
        postPath: '/managers/$managerId/leads/$id',
        data: request.toJson().removeNulls(),
      );
      Common common = commonFromJson(jsonEncode(response));
      return common;
    } catch (e) {
      return null;
    }
  }

  Future<LeadsResponse?> updateTrainerLead(
      {int? trainerId, required LeadRequest request, int? id}) async {
    try {
      var response = await _apiClient.post(
        postPath: '/trainers/$trainerId/leads/$id',
        data: request.toJson().removeNulls(),
      );
      LeadsResponse common = leadsResponseFromJson(jsonEncode(response));
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

  Future<Common?> updateFollowUpForManager(
      {required LeadRequest request,
      int? leadId,
      int? id,
      required int managerId}) async {
    try {
      String path;
      if (id != null) {
        path = '/managers/$managerId/leads/$leadId/follow-ups/$id';
      } else {
        path = '/managers/$managerId/leads/$leadId/follow-ups';
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

  Future<Common?> updateTrainerFollowUp(
      {int? trainerId,
      required LeadRequest request,
      int? leadId,
      int? id}) async {
    try {
      String path;
      if (id != null) {
        path = '/trainers/$trainerId/leads/$leadId/follow-ups/$id';
      } else {
        path = '/trainers/$trainerId/leads/$leadId/follow-ups';
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

  Future<LeadsResponse?> todayLeadsListForManager(
      {required int managerId}) async {
    try {
      var response = await _apiClient.get(
        queryPath:
            '/managers/$managerId/leads/?follow_up_date=${DateTime.now().toServerYMD()}',
      );
      LeadsResponse leadsResponse = leadsResponseFromJson(jsonEncode(response));
      return leadsResponse;
    } catch (e) {
      return null;
    }
  }

  Future<LeadsResponse?> todayTrainerLeadsList(int? trainerId) async {
    try {
      var response = await _apiClient.get(
        queryPath:
            '/trainers/$trainerId/leads/?follow_up_date=${DateTime.now().toServerYMD()}',
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

  Future<Lead?> getLeadByIdForManager(
      {required String id, required int managerId}) async {
    try {
      var response =
          await _apiClient.get(queryPath: '/managers/$managerId/leads/$id');
      return Lead.fromJson(response["lead"]);
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<ChartDataModel?> getChartData({int? trainerId}) async {
    try {
      var response = await _apiClient.get(
          queryPath: trainerId != null
              ? "/trainers/$trainerId/leads/chart-data"
              : '/admin/leads/chart-data');
      return chartDataModelFromJson(jsonEncode(response));
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<ChartDataModel?> getChartDataForManager({int? managerId}) async {
    try {
      var response = await _apiClient.get(
          queryPath: '/managers/$managerId/leads/chart-data');
      return chartDataModelFromJson(jsonEncode(response));
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<Lead?> getTrainerLeadById(
      {required int trainerId, required String id}) async {
    try {
      var response =
          await _apiClient.get(queryPath: '/trainers/$trainerId/leads/$id');
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
      String path = '/admin/leads/?page=$pageNo';

      if (branchId != null) {
        path += '&branch_id=$branchId';
      }
      if (batchId != null) {
        path += '&batch_id=$batchId';
      }
      if (leadStatus != null) {
        path += '&lead_status=$leadStatus';
      }
      if (date != null) {
        path += '&follow_up_date=$date';
      }
      if (searchQuery != null && searchQuery.isNotEmpty) {
        path += '&search=$searchQuery';
      }

      var response = await _apiClient.get(queryPath: path);
      return leadsResponseFromJson(jsonEncode(response));
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<LeadsResponse?> getLeadListForManager(
      {int? branchId,
      int? batchId,
      String? date,
      String? leadStatus,
      String? searchQuery,
      required int pageNo,
      required int managerId}) async {
    try {
      String path = '/managers/$managerId/leads/?page=$pageNo';

      if (branchId != null) {
        path += '&branch_id=$branchId';
      }
      if (batchId != null) {
        path += '&batch_id=$batchId';
      }
      if (leadStatus != null) {
        path += '&lead_status=$leadStatus';
      }
      if (date != null) {
        path += '&follow_up_date=$date';
      }
      if (searchQuery != null && searchQuery.isNotEmpty) {
        path += '&search=$searchQuery';
      }

      var response = await _apiClient.get(queryPath: path);
      return leadsResponseFromJson(jsonEncode(response));
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<LeadsResponse?> getTrainerLeadList(
      {required int trainerId,
      int? branchId,
      int? batchId,
      String? date,
      String? leadStatus,
      String? searchQuery,
      required int pageNo}) async {
    try {
      String path = '/trainers/$trainerId/leads/?page=$pageNo';

      if (branchId != null) {
        path += '&branch_id=$branchId';
      }
      if (batchId != null) {
        path += '&batch_id=$batchId';
      }
      if (leadStatus != null) {
        path += '&lead_status=$leadStatus';
      }
      if (date != null) {
        path += '&follow_up_date=$date';
      }
      if (searchQuery != null && searchQuery.isNotEmpty) {
        path += '&search=$searchQuery';
      }

      var response = await _apiClient.get(queryPath: path);
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

  Future<LeadsResponse?> getLeadListsForManager(
      {required int pageNo, required int managerId}) async {
    try {
      var response = await _apiClient.get(
          queryPath: '/managers/$managerId/leads/?page=$pageNo');
      return leadsResponseFromJson(jsonEncode(response));
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<LeadsResponse?> getTrainerLeadLists(
      {required int pageNo, required int trainerId}) async {
    try {
      var response = await _apiClient.get(
          queryPath: '/trainers/$trainerId/leads/?page=$pageNo');
      return leadsResponseFromJson(jsonEncode(response));
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<LeadsStatuses?> getLeadStatuses({int? trainerId}) async {
    try {
      var response = await _apiClient.get(
        queryPath: trainerId != null
            ? "/trainers/$trainerId/lead-status"
            : '/admin/lead-status',
      );
      LeadsStatuses leadsResponse = leadsStatusesFromJson(jsonEncode(response));
      return leadsResponse;
    } catch (e) {
      return null;
    }
  }

  Future<LeadsStatuses?> getLeadStatusesForManager({int? managerId}) async {
    try {
      var response = await _apiClient.get(
        queryPath: "/managers/$managerId/lead-status",
      );
      LeadsStatuses leadsResponse = leadsStatusesFromJson(jsonEncode(response));
      return leadsResponse;
    } catch (e) {
      return null;
    }
  }
}
