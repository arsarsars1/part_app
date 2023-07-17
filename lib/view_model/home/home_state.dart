part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class DashboardLoading extends HomeState {}

class DashboardLoaded extends HomeState {}

class GettingCalenderEvents extends HomeState {
  final bool pagination;
  GettingCalenderEvents({this.pagination = false});
}

class GotCalenderEvents extends HomeState {}

class GetCalenderEventsFailed extends HomeState {
  final String message;
  GetCalenderEventsFailed(this.message);
}
