import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/trainer_request.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/model/service/admin/branch.dart';
import 'package:part_app/model/service/admin/trainer.dart';
import 'package:path/path.dart';

part 'trainer_state.dart';

class TrainerCubit extends Cubit<TrainerState> {
  TrainerCubit() : super(TrainerInitial());

  final _trainerService = TrainerService();
  final _branchService = BranchService();

  Trainer? _trainer;
  List<Trainer> _trainers = [];

  List<Trainer> _filteredTrainers = [];

  Trainer? get trainer => _trainer;

  List<Trainer> get trainers => _trainers;

  List<Trainer> get filteredTrainers => _filteredTrainers;

  bool _isActive = true;

  TrainerRequest _request = const TrainerRequest();

  TrainerRequest get request => _request;

  File? image, doc1, doc2;

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
    if (temp != null && temp.trainerDetail != null) {
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

  Future searchTrainers(int? branchID, {String? query}) async {
    _trainers = [];
    emit(FetchingTrainers());
    TrainerResponse? response;

    if (branchID != null && query == null) {
      response = await _branchService.getTrainers(
        branchId: branchID.toString(),
      );
    }

    if (query != null) {
      response = await _trainerService.searchTrainer(
        branchID,
        query: query,
      );
    }

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
  }) async {
    if (image != null) {
      this.image = image;
    }
    if (doc1 != null) {
      this.doc1 = doc1;
    }
    if (doc2 != null) {
      this.doc2 = doc2;
    }
    _request = trainerRequest;
    if (kDebugMode) {
      log(_request.toString());
    }
  }

  Future createTrainer() async {
    emit(CreatingTrainer());
    Map<String, dynamic> map = _request.toJson();

    /// prepare files for upload
    if (image != null) {
      MultipartFile imageFile = await MultipartFile.fromFile(image!.path,
          filename: basename(image!.path));
      map.putIfAbsent('image', () => imageFile);
    }

    if (doc1 != null) {
      MultipartFile doc1File = await MultipartFile.fromFile(doc1!.path,
          filename: basename(doc1!.path));
      map.putIfAbsent('document1', () => doc1File);
    }

    if (doc2 != null) {
      MultipartFile doc2File = await MultipartFile.fromFile(doc2!.path,
          filename: basename(doc2!.path));

      map.putIfAbsent('document2', () => doc2File);
    }
    Common? response = await _trainerService.createTrainer(map);

    if (response != null && response.status == 1) {
      await getTrainers();
      emit(TrainerCreated());
    } else {
      emit(
        CreatingTrainerFailed(
          response?.message ?? 'Failed to create the trainer',
        ),
      );
    }
  }

  Future updateTrainer(TrainerRequest request, {File? doc1, File? doc2}) async {
    emit(UpdatingTrainer());
    Map<String, dynamic> data = request.toJson();

    data.removeWhere((key, value) => value == null);

    if (doc1 != null) {
      MultipartFile doc1File = await MultipartFile.fromFile(
        doc1.path,
        filename: basename(doc1.path),
      );
      data.putIfAbsent('document1', () => doc1File);
    }

    if (doc2 != null) {
      MultipartFile doc2File = await MultipartFile.fromFile(
        doc2.path,
        filename: basename(doc2.path),
      );

      data.putIfAbsent('document2', () => doc2File);
    }

    print(data);

    Common? common = await _trainerService.updateTrainer(
      data,
      trainer!.trainerDetail![0].id,
    );

    if (common?.status == 1) {
      await getTrainerDetails(
        trainerId: trainer!.trainerDetail![0].id,
      );
      emit(TrainerUpdated());
    } else {
      emit(
        UpdatingTrainerFailed(common?.message ?? 'Failed to update trainer'),
      );
    }
  }
}
