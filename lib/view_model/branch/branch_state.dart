part of 'branch_cubit.dart';

@immutable
abstract class BranchState {}

class BranchInitial extends BranchState {}

class BranchesLoaded extends BranchState {}

class BranchNetworkError extends BranchState {}

class BranchesLoading extends BranchState {
  final bool pagination;

  BranchesLoading({this.pagination = false});
}

// Branch details  **************
class BranchLoading extends BranchState {}

class BranchLoadingFailed extends BranchState {}

class AddingBranch extends BranchState {}

class BranchAdded extends BranchState {}

class BranchLoaded extends BranchState {}

class AddingBranchFailed extends BranchState {
  final String message;

  AddingBranchFailed(this.message);
}

// update branch  **************
class UpdatingBranch extends BranchState {}

class UpdatedBranch extends BranchState {}

class UpdateBranchFailed extends BranchState {
  final String message;

  UpdateBranchFailed(this.message);
}

// Trainers

class TrainersLoading extends BranchState {
  final bool pagination;

  TrainersLoading({this.pagination = false});
}

class TrainersLoaded extends BranchState {}

class TrainersFailed extends BranchState {
  final String message;

  TrainersFailed(this.message);
}
