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

//creating attendence
class CreatingAttendance extends AttendanceState {}

class CreatedAttendance extends AttendanceState {}

class AttendenceNetworkError extends AttendanceState {}

class CreateAttendanceFailed extends AttendanceState {
  final String message;

  CreateAttendanceFailed(this.message);
}

class UpdatingAttendence extends AttendanceState {}

class UpdatedAttendence extends AttendanceState {}

class UpdateAttendenceFailed extends AttendanceState {
  final String message;

  UpdateAttendenceFailed(this.message);
}

class AddedAttendance extends AttendanceState {}

class FetchingAttendanceBatch extends AttendanceState {}

class FetchedAttendanceBatch extends AttendanceState {}

class FetchAttendanceBatchFailed extends AttendanceState {
  final String message;

  FetchAttendanceBatchFailed(this.message);
}

// Students
class FetchingStudentsAttendance extends AttendanceState {
  final bool pagination;
  FetchingStudentsAttendance({this.pagination = false});
}

class StudentsAttendanceFetched extends AttendanceState {
  final bool moreItems;
  StudentsAttendanceFetched({this.moreItems = false});
}

class AttendanceNetworkError extends AttendanceState {}
