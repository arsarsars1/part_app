part of 'membership_cubit.dart';

@immutable
abstract class MembershipState {}

class MembershipInitial extends MembershipState {}

class MembershipLoaded extends MembershipState {}

class MembershipLoading extends MembershipState {}

class SalesOTPSent extends MembershipState {
  final bool resend;

  SalesOTPSent(this.resend);
}

class SalesOTPFailed extends MembershipState {
  final String message;

  SalesOTPFailed(this.message);
}

class SalesOTPSending extends MembershipState {}

class CreatingMembership extends MembershipState {}

class MembershipSuccess extends MembershipState {}

class MembershipFailed extends MembershipState {
  final String? error;

  MembershipFailed(this.error);
}

class MembershipCreating extends MembershipState {}
