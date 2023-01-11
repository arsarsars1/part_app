part of 'student_cubit.dart';

@immutable
abstract class StudentState {}

class StudentInitial extends StudentState {}

class CreatingStudent extends StudentState {}

class CreatedStudent extends StudentState {}

class CreateStudentFailed extends StudentState {
  final String message;

  CreateStudentFailed(this.message);
}

class UpdatingStudent extends StudentState {}

class UpdatedStudent extends StudentState {}

class UpdateStudentFailed extends StudentState {
  final String message;

  UpdateStudentFailed(this.message);
}

class FetchingStudents extends StudentState {
  final bool pagination;

  FetchingStudents({this.pagination = false});
}

class StudentsFetched extends StudentState {
  final bool moreItems;

  StudentsFetched({this.moreItems = false});
}

// student details

class StudentDetailsFetched extends StudentState {}

class StudentDetailsFetching extends StudentState {}

class StudentDetailsFailed extends StudentState {
  final String message;

  StudentDetailsFailed(this.message);
}

class StudentBatchesFetched extends StudentState {}

class StudentBatchesFetching extends StudentState {}

class StudentBatchesFailed extends StudentState {
  final String message;

  StudentBatchesFailed(this.message);
}

class RemovingStudent extends StudentState {}

class RemovedStudent extends StudentState {}

class RemoveStudentFailed extends StudentState {
  final String message;

  RemoveStudentFailed(this.message);
}
