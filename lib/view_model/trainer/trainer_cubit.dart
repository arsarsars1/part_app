import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/model/data_model/trainer_request.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/model/service/admin/trainer.dart';

part 'trainer_state.dart';

class TrainerCubit extends Cubit<TrainerState> {
  TrainerCubit() : super(TrainerInitial());

  final _trainerService = TrainerService();

  Trainer? _trainer;
  List<Trainer> _trainers = [];

  List<Trainer> _filteredTrainers = [];

  Trainer? get trainer => _trainer;

  List<Trainer> get trainers => _trainers;

  List<Trainer> get filteredTrainers => _filteredTrainers;

  bool _isActive = true;

  TrainerRequest _request = const TrainerRequest();

  TrainerRequest get request => _request;

  set trainer(Trainer? temp) {
    _trainer = temp;
    emit(TrainerDetailsLoaded());
  }

  set filteredTrainers(List<Trainer> temp) {
    _filteredTrainers = temp;
    emit(TrainersFetched());
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

  Future getTrainers() async {
    emit(FetchingTrainers());
    TrainerResponse? response = await _trainerService.getTrainers();

    if (response?.trainers != null) {
      _trainers = response!.trainers!;
      filterTrainers(active: _isActive);
    } else {
      emit(FailedToFetchTrainers('Failed to fetch the trainers'));
    }
  }

  List<Trainer> filterTrainers({required bool active}) {
    _isActive = active;
    List<Trainer> list = _trainers.where((element) {
      if (active) {
        return element.isActive == 1;
      } else {
        return element.isActive == 0;
      }
    }).toList();

    filteredTrainers = list;

    return list;
  }

  Future searchTrainers(Branch? branch, {required String query}) async {
    _trainers = [];
    emit(FetchingTrainers());
    TrainerResponse? response = await _trainerService.searchTrainer(
      branch?.id,
      query: query,
    );

    if (response?.trainers != null) {
      _trainers = response!.trainers!;
      filterTrainers(active: _isActive);
    } else {
      emit(FailedToFetchTrainers('Failed to fetch the trainers'));
    }
  }

  void updateRequest(
    TrainerRequest trainerRequest, {
    File? image,
    File? doc1,
    File? doc2,
  }) {
    _request = trainerRequest;
    if (kDebugMode) {
      print(_request.toJson());
    }
  }
}
