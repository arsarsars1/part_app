import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:part_app/model/data_model/chart_data_model.dart';
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
  ChartDataModel? chartDataModel;
  FollowUp? selectedFollowUp;

  List<Lead?> get leads => _leads;
  List<LeadStatus?>? get statuses => _statuses;

  Future<void> create(LeadRequest request) async {
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

  Future<void> createForManager(
    LeadRequest request, {
    required int managerId,
  }) async {
    emit(CreatingLead());
    try {
      Common? common =
          await _api.createForManager(request: request, managerId: managerId);
      if (common?.status == 1) {
        emit(CreatedLead());
      } else {
        emit(CreateLeadFailed(common?.message ?? 'Failed to create Lead.'));
      }
    } on Exception catch (e) {
      emit(CreateLeadFailed(e.toString()));
    }
  }

  Future<void> createTrainerLead(LeadRequest request, {int? idTrainer}) async {
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

  Future<void> update(LeadRequest request, int? id) async {
    emit(CreatingLead());
    try {
      Common? common = await _api.update(request: request, id: id);
      if (common?.status == 1) {
        await getLeadById(id: "${selectedLead?.id}");
        emit(UpdatedLead());
      } else {
        emit(CreateLeadFailed('Failed to update Lead.'));
      }
    } on Exception catch (e) {
      emit(CreateLeadFailed(e.toString()));
    }
  }

  Future<void> updateForManager(LeadRequest request, int? id,
      {required int managerId}) async {
    emit(CreatingLead());
    try {
      Common? common = await _api.updateForManager(
          request: request, id: id, managerId: managerId);
      if (common?.status == 1) {
        await getLeadById(id: "${selectedLead?.id}");
        emit(UpdatedLead());
      } else {
        emit(CreateLeadFailed('Failed to update Lead.'));
      }
    } on Exception catch (e) {
      emit(CreateLeadFailed(e.toString()));
    }
  }

  Future<void> updateTrainerLead(
      LeadRequest request, int? id, int? trainerId) async {
    emit(CreatingLead());
    try {
      LeadsResponse? common = await _api.updateTrainerLead(
          trainerId: trainerId, request: request, id: id);
      if (common?.status == 1) {
        await getTrainerLeadById(
            id: "${selectedLead?.id}", trainerId: trainerId ?? 0);
        emit(UpdatedLead());
      } else {
        emit(CreateLeadFailed('Failed to update Lead.'));
      }
    } on Exception catch (e) {
      emit(CreateLeadFailed(e.toString()));
    }
  }

  Future<void> todayLeadsList() async {
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

  Future<void> todayLeadsListForManager({required int managerId}) async {
    emit(FetchingLeads());
    try {
      _leads.clear();
      LeadsResponse? response =
          await _api.todayLeadsListForManager(managerId: managerId);
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

  Future<void> todayTrainerLeadsList(int? trainerId) async {
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
      Common? response =
          await _api.updateFollowUp(request: request, leadId: leadId, id: id);
      if (response != null && response.status == 1) {
        if (selectedLead != null) {
          await getLeadById(id: "${selectedLead?.id}");
        }
        if (id != null) {
          emit(UpdateFollowUpLead());
        } else {
          emit(CreatedFollowUpLead());
        }
      } else {
        emit(FetchingLeadsFailed(
            response?.message ?? 'Failed to update the follow up'));
      }
    } on Exception catch (e) {
      emit(FetchingLeadsFailed(e.toString()));
    }
  }

  Future<void> addUpdateLeadFollowUpListForManager(
      LeadRequest request, int? leadId, int? id,
      {required int managerId}) async {
    emit(FetchingLeads());
    try {
      Common? response = await _api.updateFollowUpForManager(
          request: request, leadId: leadId, id: id, managerId: managerId);
      if (response != null && response.status == 1) {
        if (selectedLead != null) {
          await getLeadByIdForManager(
              id: "${selectedLead?.id}", managerId: managerId);
        }
        if (id != null) {
          emit(UpdateFollowUpLead());
        } else {
          emit(CreatedFollowUpLead());
        }
      } else {
        emit(FetchingLeadsFailed(
            response?.message ?? 'Failed to update the follow up'));
      }
    } on Exception catch (e) {
      emit(FetchingLeadsFailed(e.toString()));
    }
  }

  Future<void> addTrainerUpdateLeadFollowUpList(
      LeadRequest request, int? leadId, int? id, int trainerId) async {
    emit(FetchingLeads());
    try {
      Common? response = await _api.updateTrainerFollowUp(
          trainerId: trainerId, request: request, leadId: leadId, id: id);
      if (response != null && response.status == 1) {
        if (selectedLead != null) {
          await getTrainerLeadById(
              id: "${selectedLead?.id}", trainerId: trainerId);
        }
        if (id != null) {
          emit(UpdateFollowUpLead());
        } else {
          emit(CreatedFollowUpLead());
        }
      } else {
        emit(FetchingLeadsFailed(
            response?.message ?? 'Failed to update the follow up'));
      }
    } on Exception catch (e) {
      emit(FetchingLeadsFailed(e.toString()));
    }
  }

  Future<void> getLeadsList({
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

  Future<void> getLeadsListForManager({
    String? searchQuery,
    int? branchId,
    int? batchId,
    String? date,
    String? leadStatus,
    bool clean = false,
    required int managerId,
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
      LeadsResponse? response = await _api.getLeadListForManager(
        managerId: managerId,
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

  Future getLeadsListsForManager(
      {bool clean = false, required int managerId}) async {
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
          await _api.getLeadListsForManager(pageNo: page, managerId: managerId);

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

  Future<void> getLeadStatuses({int? trainerId}) async {
    emit(FetchingLeadStatuses());
    try {
      _statuses?.clear();
      LeadsStatuses? response =
          await _api.getLeadStatuses(trainerId: trainerId);
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

  Future<void> getLeadStatusesForManager({required int managerId}) async {
    emit(FetchingLeadStatuses());
    try {
      _statuses?.clear();
      LeadsStatuses? response =
          await _api.getLeadStatusesForManager(managerId: managerId);
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

  Future getLeadByIdForManager(
      {required String id, required int managerId}) async {
    emit(FetchingLead());
    Lead? temp = await _api.getLeadByIdForManager(id: id, managerId: managerId);

    if (temp != null) {
      lead = temp;
      emit(FetchedLead());
    } else {
      emit(FetchingLeadFailed("Error Fetching the lead"));
    }
  }

  Future getChartData({int? trainerId}) async {
    chartDataModel = null;
    emit(FetchingLead());
    ChartDataModel? response = await _api.getChartData(trainerId: trainerId);

    if (response?.status == 1) {
      chartDataModel = response;
      emit(FetchedLead());
    } else {
      chartDataModel = null;
      emit(FetchingLeadFailed("Error Fetching the lead"));
    }
  }

  Future getChartDataForManager({int? managerId}) async {
    chartDataModel = null;
    emit(FetchingLead());
    ChartDataModel? response =
        await _api.getChartDataForManager(managerId: managerId);

    if (response?.status == 1) {
      chartDataModel = response;
      emit(FetchedLead());
    } else {
      chartDataModel = null;
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
      if (temp > balance.inMinutes) {
        finalFollowUp = i;
      }
    }
    return finalFollowUp;
  }

  String checkTimeForColor(List<FollowUp> test) {
    FollowUp i;
    var today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    DateTime testDay;
    String status = '';
    for (i in test) {
      testDay = DateTime(
          (i.followUpDate ?? DateTime.now()).year,
          (i.followUpDate ?? DateTime.now()).month,
          (i.followUpDate ?? DateTime.now()).day);
      if (today.isAtSameMomentAs(testDay)) {
        status = 'Today';
      }
      if (today.isBefore(testDay)) {
        status = 'Upcoming';
      }
      if (today.isAfter(testDay)) {
        status = 'Past';
      }
    }
    return status;
  }
}
