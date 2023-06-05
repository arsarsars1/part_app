part of 'batch_cubit.dart';

@immutable
abstract class BatchState {}

class BatchInitial extends BatchState {}

class DaysUpdated extends BatchState {}

class GettingCourses extends BatchState {}

class CoursesUpdated extends BatchState {}

class FetchingBatches extends BatchState {
  final bool pagination;

  FetchingBatches({this.pagination = false});
}

class BatchesFetched extends BatchState {
  final bool moreItems;

  BatchesFetched({this.moreItems = false});
}

class CreatingBatch extends BatchState {}

class CreatedBatch extends BatchState {}

class CreateBatchFailed extends BatchState {
  final String message;

  CreateBatchFailed(this.message);
}

class UpdatingBatch extends BatchState {}

class UpdatedBatch extends BatchState {}

class UpdateBatchFailed extends BatchState {
  final String message;

  UpdateBatchFailed(this.message);
}

class FetchingBatch extends BatchState {}

class FetchedBatch extends BatchState {}

class RescheduledListFetched extends BatchState {}

class RescheduledListFetching extends BatchState {}

class CancelledListFetched extends BatchState {}

class CancelledListFetching extends BatchState {}

class FetchBatchFailed extends BatchState {
  final String message;

  FetchBatchFailed(this.message);
}

class ReschedulingBatch extends BatchState {}

class RescheduledBatch extends BatchState {}

class RescheduleFailed extends BatchState {
  final String message;

  RescheduleFailed(this.message);
}

// Cancel

class CancellingClassBatch extends BatchState {}

class CancelledClassBatch extends BatchState {}

class DeleteCancelledClass extends BatchState {}

class DeletedCancelledClass extends BatchState {}

class CancelledClassDeletionFailed extends BatchState {
  final String message;
  CancelledClassDeletionFailed(this.message);
}

class CancelClassFailed extends BatchState {
  final String message;

  CancelClassFailed(this.message);
}

// Students

class FetchingBatchStudents extends BatchState {}

class FetchedBatchStudents extends BatchState {}

class FetchingBatchStudentsFailed extends BatchState {}

/// add Class Link

class AddingLink extends BatchState {}

class AddedLink extends BatchState {}

class AddLinkFailed extends BatchState {
  final String message;

  AddLinkFailed(this.message);
}

/// update Class Link

class UpdatingLink extends BatchState {}

class UpdatedLink extends BatchState {}

class UpdateLinkFailed extends BatchState {
  final String message;

  UpdateLinkFailed(this.message);
}

// get class links

class FetchingLinks extends BatchState {}

class FetchedLinks extends BatchState {}

class RemovingLink extends BatchState {}

class RemovedLink extends BatchState {}

class RemoveLinkFailed extends BatchState {
  final String message;
  RemoveLinkFailed(this.message);
}

class BatchNetworkError extends BatchState {}
