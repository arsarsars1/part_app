part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class DashboardLoading extends HomeState {}

class DashboardLoaded extends HomeState {}

class DashboardLoadingFailed extends HomeState {
  final String message;
  DashboardLoadingFailed(this.message);
}

class GettingCalenderEvents extends HomeState {
  final bool pagination;
  GettingCalenderEvents({this.pagination = false});
}

class GotCalenderEvents extends HomeState {}

class GetCalenderEventsFailed extends HomeState {
  final String message;
  GetCalenderEventsFailed(this.message);
}

class GettingNotifications extends HomeState {
  final bool pagination;
  GettingNotifications({this.pagination = false});
}

class GotNotifications extends HomeState {}

class GetNotificationsFailed extends HomeState {
  final String message;
  GetNotificationsFailed(this.message);
}

class ReadingNotification extends HomeState {}

class ReadNotification extends HomeState {
  final String message;
  ReadNotification(this.message);
}

class ReadNotificationFailed extends HomeState {
  final String message;
  ReadNotificationFailed(this.message);
}

class DeletingNotification extends HomeState {}

class DeletedNotification extends HomeState {
  final String message;
  DeletedNotification(this.message);
}

class DeleteNotificationFailed extends HomeState {
  final String message;
  DeleteNotificationFailed(this.message);
}

class FetchingFAQ extends HomeState {}

class FetchedFAQ extends HomeState {}

class FetchFAQFailed extends HomeState {
  final String message;
  FetchFAQFailed(this.message);
}
