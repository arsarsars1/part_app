part of 'leads_cubit.dart';

@immutable
abstract class LeadsState {}

class LeadsInitial extends LeadsState {}

class CreatingLead extends LeadsState {}

class CreatedLead extends LeadsState {}

class CreatedFollowUpLead extends LeadsState {}

class UpdateFollowUpLead extends LeadsState {}

class CreateLeadFailed extends LeadsState {
  final String message;

  CreateLeadFailed(this.message);
}

class FetchingLeads extends LeadsState {
  final bool pagination;
  FetchingLeads({this.pagination = false});
}

class FetchedLeads extends LeadsState {
  final bool moreItems;
  FetchedLeads({this.moreItems = false});
}

class FetchingLeadsFailed extends LeadsState {
  final String message;
  FetchingLeadsFailed(this.message);
}

class FetchingLead extends LeadsState {}

class FetchedLead extends LeadsState {}

class FetchingLeadFailed extends LeadsState {
  final String message;
  FetchingLeadFailed(this.message);
}

class FetchingLeadStatuses extends LeadsState {}

class FetchedLeadStatuses extends LeadsState {}

class FetchingLeadStatusesFailed extends LeadsState {
  final String message;
  FetchingLeadStatusesFailed(this.message);
}
