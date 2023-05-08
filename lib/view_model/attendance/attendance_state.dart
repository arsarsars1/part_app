part of 'attendance_cubit.dart';

@immutable
abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}

class FetchingAttendanceBatches extends AttendanceState {
  final bool pagination;

  FetchingAttendanceBatches({this.pagination = false});
}

class AttendanceBatchesFetched extends AttendanceState {
  final bool moreItems;

  AttendanceBatchesFetched({this.moreItems = false});
}

class FetchingAttendanceBatch extends AttendanceState {}

class FetchedAttendanceBatch extends AttendanceState {}

class FetchAttendanceBatchFailed extends AttendanceState {
  final String message;

  FetchAttendanceBatchFailed(this.message);
}

/*class FetchingAttendanceStudents extends AttendanceState {}

class FetchedAttendanceStudents extends AttendanceState {}

class FetchingAttendanceStudentsFailed extends AttendanceState {}*/


class AttendanceNetworkError extends AttendanceState {}
