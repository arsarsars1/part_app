part of 'batch_cubit.dart';

@immutable
abstract class BatchState {}

class BatchInitial extends BatchState {}

class DaysUpdated extends BatchState {}

class GettingCourses extends BatchState {}

class CoursesUpdated extends BatchState {}

class BatchesFetched extends BatchState {}

class CreatingBatch extends BatchState {}

class CreatedBatch extends BatchState {}

class CreateBatchFailed extends BatchState {
  final String message;

  CreateBatchFailed(this.message);
}

class FetchingBatch extends BatchState {}

class FetchedBatch extends BatchState {}

class FetchBatchFailed extends BatchState {
  final String message;

  FetchBatchFailed(this.message);
}
