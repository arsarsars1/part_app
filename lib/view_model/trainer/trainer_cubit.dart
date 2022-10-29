import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/model/service/admin/trainer.dart';

part 'trainer_state.dart';

class TrainerCubit extends Cubit<TrainerState> {
  TrainerCubit() : super(TrainerInitial());

  final _trainerService = TrainerService();

  Trainer? _trainer;

  Trainer? get trainer => _trainer;

  set trainer(Trainer? temp) {
    _trainer = temp;
    emit(TrainerDetailsLoaded());
  }

  Future getTrainerDetails({required int trainerId}) async {
    emit(TrainerDetailsLoading());
    Trainer? temp = await _trainerService.getTrainerById(trainerId: trainerId);
    if (temp != null) {
      trainer = temp;
      emit(TrainerDetailsLoaded());
      return;
    }
    emit(TrainerDetailsFailed('Failed to load the trainer details'));
  }
}
