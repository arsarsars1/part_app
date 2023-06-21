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

class WritingOff extends FeeState {}

class WrittenOff extends FeeState {
  final String message;
  WrittenOff(this.message);
}

class WriteOffFailed extends FeeState {
  final String message;
  WriteOffFailed(this.message);
}
