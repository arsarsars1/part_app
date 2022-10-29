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
