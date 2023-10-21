part of 'fee_cubit.dart';

@immutable
abstract class FeeState {}

class FeeInitial extends FeeState {}

class FetchingFee extends FeeState {
  final bool pagination;
  FetchingFee({this.pagination = false});
}

class FeeFetched extends FeeState {
  final bool moreItems;
  FeeFetched({this.moreItems = false});
}

class FeeDetailsFailed extends FeeState {
  final String message;
  FeeDetailsFailed(this.message);
}

class FeeReminderSending extends FeeState {}

class FeeReminderSent extends FeeState {
  final String message;
  FeeReminderSent(this.message);
}

class FeeReminderSentFailed extends FeeState {
  final String message;
  FeeReminderSentFailed(this.message);
}

class DeletingFees extends FeeState {}

class FeesDeleted extends FeeState {
  final String message;
  FeesDeleted(this.message);
}

class DeleteFeesFailed extends FeeState {
  final String message;
  DeleteFeesFailed(this.message);
}

class WritingOff extends FeeState {}

class WrittenOff extends FeeState {
  final String message;
  WrittenOff(this.message);
}

class WriteOffFailed extends FeeState {
  final String message;
  WriteOffFailed(this.message);
}

class EditingFee extends FeeState {}

class EdittedFee extends FeeState {
  final String message;
  EdittedFee(this.message);
}

class EditFeesFailed extends FeeState {
  final String message;
  EditFeesFailed(this.message);
}

class AddingFees extends FeeState {}

class AddedFees extends FeeState {
  final String message;
  AddedFees(this.message);
}

class AddFeesFailed extends FeeState {
  final String message;
  AddFeesFailed(this.message);
}

class GettingBatchInvoice extends FeeState {}

class GotBatchInvoice extends FeeState {}

class GetBatchInvoiceFailed extends FeeState {
  final String message;
  GetBatchInvoiceFailed(this.message);
}
