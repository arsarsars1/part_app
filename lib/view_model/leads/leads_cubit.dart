import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/lead_request.dart';
import 'package:part_app/model/data_model/lead_statuses.dart';
import 'package:part_app/model/data_model/leads_response.dart';
import 'package:part_app/model/service/admin/leads.dart';
import 'package:part_app/view_model/cubits.dart';

part 'leads_state.dart';

class LeadsCubit extends Cubit<LeadsState> {
  LeadsCubit() : super(LeadsInitial());

  final _api = LeadsService();

  final List<Lead> _leads = [];
  int page = 1;
  String? nextPageUrl = '';
  List<LeadStatus?>? _statuses = [];
  Lead? selectedLead, lead;

  List<Lead?> get leads => _leads;
  List<LeadStatus?>? get statuses => _statuses;

  void create(LeadRequest request) async {
    emit(CreatingLead());
    try {
      Common? common = await _api.create(request: request);
      if (common?.status == 1) {
        emit(CreatedLead());
      } else {
        emit(CreateLeadFailed(common?.message ?? 'Failed to create Lead.'));
      }
    } on Exception catch (e) {
      emit(CreateLeadFailed(e.toString()));
    }
  }

  void update(LeadRequest request, int? id) async {
    emit(CreatingLead());
    try {
      Common? common = await _api.update(request: request, id: id);
      if (common?.status == 1) {
        emit(CreatedLead());
      } else {
        emit(CreateLeadFailed(common?.message ?? 'Failed to create Lead.'));
      }
    } on Exception catch (e) {
      emit(CreateLeadFailed(e.toString()));
    }
  }

  void todayLeadsList() async {
    emit(FetchingLeads());
    try {
      _leads.clear();
      LeadsResponse? response = await _api.todayLeadsList();
      if (response?.status == 0) {
        _leads.addAll(response?.leads?.data ?? []);
        emit(FetchedLeads());
      } else {
        emit(FetchingLeadsFailed('Failed to fetch Leads.'));
      }
    } on Exception catch (e) {
      emit(FetchingLeadsFailed(e.toString()));
    }
  }

  Future<void> updateLeadFollowUpList(int? id) async {
    emit(FetchingLeads());
    try {
      _leads.clear();
      Common? response = await _api.updateFollowUp(id: id);
      if (response?.status == 0) {
        print(response?.toJson());
        // _leads.addAll(response?.leads?.data ?? []);
        // emit(FetchedLeads());
      } else {
        emit(FetchingLeadsFailed('Failed to fetch followup status.'));
      }
    } on Exception catch (e) {
      emit(FetchingLeadsFailed(e.toString()));
    }
  }

  Future getLeadsList({
    String? searchQuery,
    int? branchId,
    int? batchId,
    String? date,
    String? leadStatus,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      _leads.clear();
      emit(FetchingLeads());
    } else {
      emit(FetchingLeads(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(FetchedLeads());
      return;
    }

    try {
      LeadsResponse? response = await _api.getLeadList(
        branchId: branchId,
        batchId: batchId,
        date: date,
        leadStatus: leadStatus,
        searchQuery: searchQuery,
        pageNo: page,
      );

      if (response?.status == 0) {
        nextPageUrl = response?.leads?.nextPageUrl;
        if (nextPageUrl != null) {
          page++;
        }
        _leads.addAll(response?.leads?.data ?? []);
        emit(FetchedLeads(moreItems: nextPageUrl != null));
      }
    } catch (e) {
      log(e.toString());
      emit(FetchedLeads(moreItems: nextPageUrl != null));
    }
  }

  Future getLeadsLists({bool clean = false}) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      _leads.clear();
      emit(FetchingLeads());
    } else {
      emit(FetchingLeads(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(FetchedLeads());
      return;
    }

    try {
      LeadsResponse? response = await _api.getLeadLists(pageNo: page);

      if (response?.status == 0) {
        nextPageUrl = response?.leads?.nextPageUrl;
        if (nextPageUrl != null) {
          page++;
        }
        _leads.addAll(response?.leads?.data ?? []);
        emit(FetchedLeads(moreItems: nextPageUrl != null));
      }
    } catch (e) {
      log(e.toString());
      emit(FetchedLeads(moreItems: nextPageUrl != null));
    }
  }

  void getLeadStatuses() async {
    emit(FetchingLeadStatuses());
    try {
      _statuses?.clear();
      LeadsStatuses? response = await _api.getLeadStatuses();
      if (response?.status == 0) {
        _statuses = response?.leadStatuses ?? [];
        emit(FetchedLeadStatuses());
      } else {
        emit(FetchingLeadStatusesFailed('Failed to fetch Leads.'));
      }
    } on Exception catch (e) {
      emit(FetchingLeadStatusesFailed(e.toString()));
    }
  }

  Future getLeadById({required String id}) async {
    emit(FetchingLead());
    Lead? temp = await _api.getLeadById(id: id);

    if (temp != null) {
      lead = temp;
      emit(FetchedLead());
    } else {
      emit(FetchingLeadFailed("Error Fetching the lead"));
    }
  }

  FollowUp? checkTime(List<FollowUp> test) {
    FollowUp i;
    FollowUp? finalFollowUp;
    int temp = 0;
    for (i in test) {
      Duration balance =
          (DateTime.now()).difference(i.followUpDate ?? DateTime.now());
      if (temp < balance.inMinutes) {
        finalFollowUp = i;
      }
    }
    return finalFollowUp;
  }
}
