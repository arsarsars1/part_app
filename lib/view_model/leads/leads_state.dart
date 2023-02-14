part of 'leads_cubit.dart';

@immutable
abstract class LeadsState {}

class LeadsInitial extends LeadsState {}

class CreatingLead extends LeadsState {}

class CreatedLead extends LeadsState {}

class CreateLeadFailed extends LeadsState {
  final String message;

  CreateLeadFailed(this.message);
}

class FetchingLeads extends LeadsState {}

class FetchedLeads extends LeadsState {}

class FetchingLeadsFailed extends LeadsState {
  final String message;

  FetchingLeadsFailed(this.message);
}
