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
