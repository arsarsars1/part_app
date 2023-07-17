part of 'trainer_cubit.dart';

@immutable
abstract class TrainerState {}

class TrainerInitial extends TrainerState {}

class TrainerDetailsLoaded extends TrainerState {}

class TrainerDetailsLoading extends TrainerState {}

class TrainerDetailsFailed extends TrainerState {
  final String message;

  TrainerDetailsFailed(this.message);
}

// trainers list

class TrainersFetched extends TrainerState {}

class FetchingTrainers extends TrainerState {}

class SearchedTrainers extends TrainerState {}

class FailedToFetchTrainers extends TrainerState {
  final String message;

  FailedToFetchTrainers(this.message);
}

class TrainerCreated extends TrainerState {
  final bool fromBranch;
  TrainerCreated(this.fromBranch);
}

class CreatingTrainer extends TrainerState {}

class CreatingTrainerFailed extends TrainerState {
  final String message;

  CreatingTrainerFailed(this.message);
}

class TrainerUpdated extends TrainerState {}

class TrainerStatusUpdated extends TrainerState {
  final bool activated;

  TrainerStatusUpdated(this.activated);
}

class UpdatingTrainer extends TrainerState {}

class BranchesUpdated extends TrainerState {}

class UpdatingTrainerFailed extends TrainerState {
  final String message;

  UpdatingTrainerFailed(this.message);
}

class FetchingTrainerSalary extends TrainerState {
  final bool pagination;
  FetchingTrainerSalary({this.pagination = false});
}

class TrainerSalaryFetched extends TrainerState {
  final bool moreItems;
  TrainerSalaryFetched({this.moreItems = false});
}

class TrainerSalaryDetailsFailed extends TrainerState {
  final String message;
  TrainerSalaryDetailsFailed(this.message);
}

class FetchingSalaryDetails extends TrainerState {}

class SalaryDetailsFetched extends TrainerState {}

class SalaryDetailsFetchFailed extends TrainerState {
  final String message;
  SalaryDetailsFetchFailed(this.message);
}

class AddingSalary extends TrainerState {}

class AddedSalary extends TrainerState {
  final String message;
  AddedSalary(this.message);
}

class AddSalaryFailed extends TrainerState {
  final String message;
  AddSalaryFailed(this.message);
}

class ClosingSalary extends TrainerState {}

class ClosedSalary extends TrainerState {
  final String message;
  ClosedSalary(this.message);
}

class CloseSalaryFailed extends TrainerState {
  final String message;
  CloseSalaryFailed(this.message);
}

class DeletingSalary extends TrainerState {}

class DeletedSalary extends TrainerState {
  final String message;
  DeletedSalary(this.message);
}

class DeleteSalaryFailed extends TrainerState {
  final String message;
  DeleteSalaryFailed(this.message);
}

class EditingSalary extends TrainerState {}

class EditedSalary extends TrainerState {
  final String message;
  EditedSalary(this.message);
}

class EditSalaryFailed extends TrainerState {
  final String message;
  EditSalaryFailed(this.message);
}
