part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class DashboardLoading extends HomeState {}

class DashboardLoaded extends HomeState {}
