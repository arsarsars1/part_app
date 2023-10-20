part of 'manager_cubit.dart';

@immutable
abstract class ManagerState {}

class ManagerInitial extends ManagerState {}

class CreatingManager extends ManagerState {}

class ManagerCreated extends ManagerState {}

class ManagerCreationFailed extends ManagerState {
  final String message;

  ManagerCreationFailed(this.message);
}

class FetchingManagers extends ManagerState {}

class ManagersFetched extends ManagerState {}

class FetchingManagersFailed extends ManagerState {
  final String message;

  FetchingManagersFailed(this.message);
}

class FetchingManager extends ManagerState {}

class ManagerFetched extends ManagerState {}

class FetchingManagerFailed extends ManagerState {
  final String message;

  FetchingManagerFailed(this.message);
}

class BranchSelectionUpdated extends ManagerState {}

class UpdatingManager extends ManagerState {}

class UpdatedManager extends ManagerState {}

class UpdatingManagerFailed extends ManagerState {
  final String message;

  UpdatingManagerFailed(this.message);
}
