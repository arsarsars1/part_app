part of 'membership_cubit.dart';

@immutable
abstract class MembershipState {}

class MembershipInitial extends MembershipState {}

class MembershipLoaded extends MembershipState {}

class MembershipLoading extends MembershipState {}
