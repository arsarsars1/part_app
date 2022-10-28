part of 'branch_cubit.dart';

@immutable
abstract class BranchState {}

class BranchInitial extends BranchState {}

class BranchesLoaded extends BranchState {}

class BranchesLoading extends BranchState {}

// Branch details  **************
class BranchLoading extends BranchState {}

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

class TrainersLoading extends BranchState {}

class TrainersLoaded extends BranchState {}
