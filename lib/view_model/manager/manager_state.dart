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

class FetchingManagerFailed extends ManagerState {
  final String message;

  FetchingManagerFailed(this.message);
}
