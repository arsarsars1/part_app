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

class FailedToFetchTrainers extends TrainerState {
  final String message;

  FailedToFetchTrainers(this.message);
}

class TrainerCreated extends TrainerState {}

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

class UpdatingTrainerFailed extends TrainerState {
  final String message;

  UpdatingTrainerFailed(this.message);
}
