import 'package:flutter/foundation.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/lead_request.dart';
import 'package:part_app/model/data_model/leads_response.dart';
import 'package:part_app/model/service/admin/leads.dart';
import 'package:part_app/view_model/cubits.dart';

part 'leads_state.dart';

class LeadsCubit extends Cubit<LeadsState> {
  LeadsCubit() : super(LeadsInitial());

  final _api = LeadsService();

  final List<Lead> _leads = [];

  List<Lead> get leads => _leads;

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

  void todayList() async {
    emit(FetchingLeads());
    try {
      _leads.clear();
      LeadsResponse? response = await _api.list();
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
}
