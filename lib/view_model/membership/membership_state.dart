part of 'membership_cubit.dart';

@immutable
abstract class MembershipState {}

class MembershipInitial extends MembershipState {}

class MembershipLoaded extends MembershipState {}

class MembershipLoading extends MembershipState {}

class SalesOTPSent extends MembershipState {}

class SalesOTPSending extends MembershipState {}

class MembershipSuccess extends MembershipState {}

class MembershipFailed extends MembershipState {
  final String? error;

  MembershipFailed(this.error);
}

class MembershipCreating extends MembershipState {}
