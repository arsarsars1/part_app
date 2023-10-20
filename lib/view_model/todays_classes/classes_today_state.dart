part of 'classes_today_cubit.dart';

@immutable
abstract class ClassesTodayState {}

class ClassesTodayInitial extends ClassesTodayState {}

class ClassesTodayLoaded extends ClassesTodayState {}

class ClassesTodayLoading extends ClassesTodayState {}

class ClassesTodayLoadingFailed extends ClassesTodayState {
  final String message;

  ClassesTodayLoadingFailed(this.message);
}

// ClassesToday list

class FetchedTodaysClasses extends ClassesTodayState {}

class FetchingClassesToday extends ClassesTodayState {}

class SearchedClassesToday extends ClassesTodayState {}

class FailedToFetchClassesToday extends ClassesTodayState {
  final String message;

  FailedToFetchClassesToday(this.message);
}
