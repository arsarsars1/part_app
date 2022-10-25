part of 'branch_cubit.dart';

@immutable
abstract class BranchState {}

class BranchInitial extends BranchState {}

class BranchesLoaded extends BranchState {}

class BranchesLoading extends BranchState {}

class AddingBranch extends BranchState {}

class BranchAdded extends BranchState {}

class AddingBranchFailed extends BranchState {
  final String message;

  AddingBranchFailed(this.message);
}
