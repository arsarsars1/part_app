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
  FollowUp? selectedFollowUp;

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

  void createTrainerLead(LeadRequest request, {int? idTrainer}) async {
    emit(CreatingLead());
    try {
      Common? common =
          await _api.createTrainerLead(request: request, idTrainer: idTrainer);
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
        selectedLead = Lead.fromJson(common!.toJson());
        emit(UpdatedLead());
      } else {
        emit(CreateLeadFailed('Failed to update Lead.'));
      }
    } on Exception catch (e) {
      emit(CreateLeadFailed(e.toString()));
    }
  }

  void updateTrainerLead(LeadRequest request, int? id, int? trainerId) async {
    emit(CreatingLead());
    try {
      LeadsResponse? common = await _api.updateTrainerLead(
          trainerId: trainerId, request: request, id: id);
      if (common?.status == 1) {
        selectedLead = common!.lead;
        lead = selectedLead;
        emit(UpdatedLead());
      } else {
        emit(CreateLeadFailed('Failed to update Lead.'));
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
      if (response?.status == 1) {
        _leads.addAll(response?.leads?.data ?? []);
        emit(FetchedLeads());
      } else {
        emit(FetchingLeadsFailed('Failed to fetch Leads.'));
      }
    } on Exception catch (e) {
      emit(FetchingLeadsFailed(e.toString()));
    }
  }

  void todayTrainerLeadsList(int? trainerId) async {
    emit(FetchingLeads());
    try {
      _leads.clear();
      LeadsResponse? response = await _api.todayTrainerLeadsList(trainerId);
      if (response?.status == 1) {
        _leads.addAll(response?.leads?.data ?? []);
        emit(FetchedLeads());
      } else {
        emit(FetchingLeadsFailed('Failed to fetch Leads.'));
      }
    } on Exception catch (e) {
      emit(FetchingLeadsFailed(e.toString()));
    }
  }

  Future<void> addUpdateLeadFollowUpList(
      LeadRequest request, int? leadId, int? id) async {
    emit(FetchingLeads());
    try {
      _leads.clear();
      Common? response =
          await _api.updateFollowUp(request: request, leadId: leadId, id: id);
      if (response != null && response.status == 1) {
        selectedFollowUp = FollowUp.fromJson(response.toJson());
        if (id != null && selectedLead != null && selectedFollowUp != null) {
          await getLeadById(id: "${selectedLead?.id}");
          emit(UpdateFollowUpLead());
        } else {
          await getLeadById(id: "${selectedLead?.id}");
          emit(CreatedFollowUpLead());
        }
      } else {
        emit(FetchingLeadsFailed('Failed to fetch followup status.'));
      }
    } on Exception catch (e) {
      emit(FetchingLeadsFailed(e.toString()));
    }
  }

  Future<void> addTrainerUpdateLeadFollowUpList(
      LeadRequest request, int? leadId, int? id, int trainerId) async {
    emit(FetchingLeads());
    try {
      _leads.clear();
      Common? response = await _api.updateTrainerFollowUp(
          trainerId: trainerId, request: request, leadId: leadId, id: id);
      if (response != null && response.status == 1) {
        selectedFollowUp = FollowUp.fromJson(response.toJson());
        if (id != null && selectedLead != null && selectedFollowUp != null) {
          await getTrainerLeadById(
              id: "${selectedLead?.id}", trainerId: trainerId);
          emit(UpdateFollowUpLead());
        } else {
          await getTrainerLeadById(
              id: "${selectedLead?.id}", trainerId: trainerId);
          emit(CreatedFollowUpLead());
        }
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

      if (response?.status == 1) {
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

  Future getTrainerLeadList({
    required int trainerId,
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
      LeadsResponse? response = await _api.getTrainerLeadList(
        trainerId: trainerId,
        branchId: branchId,
        batchId: batchId,
        date: date,
        leadStatus: leadStatus,
        searchQuery: searchQuery,
        pageNo: page,
      );

      if (response?.status == 1) {
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

      if (response?.status == 1) {
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

  Future getTrainerLeadsLists(
      {bool clean = false, required int trainerId}) async {
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
      LeadsResponse? response =
          await _api.getTrainerLeadLists(trainerId: trainerId, pageNo: page);

      if (response?.status == 1) {
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
      if (response?.status == 1) {
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

  Future getTrainerLeadById(
      {required int trainerId, required String id}) async {
    emit(FetchingLead());
    Lead? temp = await _api.getTrainerLeadById(id: id, trainerId: trainerId);

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
