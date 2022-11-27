import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/batch_request.dart';
import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/course.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/service/admin/batch.dart';
import 'package:part_app/view/constants/default_values.dart';

part 'batch_state.dart';

class BatchCubit extends Cubit<BatchState> {
  BatchCubit() : super(BatchInitial());

  final _batchService = BatchService();

  List<Days> _days = [];
  List<Course>? _courses;
  List<Course>? _subjects;

  final List<String> _selectedTrainers = [];
  List<BatchModel> _batches = [];
  BatchModel? _batchModel;
  Batch? _batch;

  DropDownItem? _defaultCourse;
  DropDownItem? _defaultSubject;

  List<Days> get days => _days;

  List<Course>? get courses => _courses;

  List<Course>? get subjects => _subjects;

  List<String> get selectedTrainers => _selectedTrainers;

  List<BatchModel> get batches => _batches;

  BatchModel? get batchModel => _batchModel;

  Batch? get batch => _batch;

  DropDownItem? get defaultCourse => _defaultCourse;

  DropDownItem? get defaultSubject => _defaultSubject;

  void addDay(Days day) {
    _days.removeWhere((element) => element.day == day.day);
    _days.add(day);

    emit(DaysUpdated());
  }

  List<String> buildDaysList() {
    return _days.map((e) {
      return json.encode(e);
    }).toList();
  }

  List<DropDownItem>? getCoursesDropDown() {
    return _courses
        ?.map((e) => DropDownItem(id: e.id, title: e.courseName, item: e))
        .toList();
  }

  DropDownItem? getCourseMenuItem(int? courseId) {
    var item = getCoursesDropDown()?.firstWhere(
      (element) => element.id == courseId,
    );

    return item;
  }

  DropDownItem? getBatchStatusItem(String? title) {
    var item = DefaultValues().batchStatus.firstWhere(
          (element) => element.id == title,
        );

    return item;
  }

  DropDownItem? getSubjectMenuItem(int? courseId) {
    var item = getSubjectsDropDown()?.firstWhere(
      (element) => element.id == courseId,
    );

    return item;
  }

  List<DropDownItem>? getSubjectsDropDown() {
    return _subjects
        ?.map((e) => DropDownItem(id: e.id, title: e.subjectName, item: e))
        .toList();
  }

  Future getCourses() async {
    _courses = await _batchService.getCourses();
    _defaultCourse = null;
    _defaultSubject = null;
    emit(CoursesUpdated());
  }

  Future getSubjects({required int? courseId}) async {
    emit(GettingCourses());
    _defaultSubject = null;
    _subjects = await _batchService.getSubjects(courseId);
    emit(CoursesUpdated());
  }

  Future createBatch(BatchRequest request) async {
    emit(CreatingBatch());
    try {
      Common? response = await _batchService.createBatch(request);
      if (response?.status == 1) {
        await getBatches();
        emit(CreatedBatch());
      } else {
        emit(CreateBatchFailed(response?.message ?? 'Failed to create batch.'));
      }
    } catch (e) {
      emit(CreateBatchFailed('Failed to create batch.'));
    }
  }

  Future updateBatch(BatchRequest request) async {
    emit(UpdatingBatch());
    try {
      Common? response =
          await _batchService.updateBatch(request, _batchModel?.id);
      if (response?.status == 1) {
        await getBatches();
        emit(UpdatingBatch());
      } else {
        emit(UpdateBatchFailed(response?.message ?? 'Failed to create batch.'));
      }
    } catch (e) {
      emit(UpdateBatchFailed('Failed to create batch.'));
    }
  }

  Future getBatches() async {
    BatchResponse? response = await _batchService.getBatches();
    if (response?.status == 1) {
      _batches = response?.batches?.data
              .map((e) => BatchModel.fromEntity(e))
              .toList() ??
          [];
      emit(BatchesFetched());
    }
  }

  Future getBatchesForTrainer(int? trainerId) async {
    var items = await _batchService.getTrainerBatches(trainerId);
    if (items != null && items.isNotEmpty) {
      _batches = items.map((e) => BatchModel.fromEntity(e)).toList();
    } else {
      _batches.clear();
    }
    emit(BatchesFetched());
  }

  Future getBatch({required String batchId}) async {
    emit(FetchingBatch());
    BatchResponse? response = await _batchService.getBatch(id: batchId);
    if (response?.status == 1 && response?.batch != null) {
      _batch = response?.batch;
      _batchModel = BatchModel.fromEntity(response!.batch!);

      if (_courses == null || _courses!.isEmpty) {
        await getCourses();
      }

      await getSubjects(courseId: _batch?.course?.id);
      _defaultCourse = getCourseMenuItem(_batch?.course?.id);
      _defaultSubject = getSubjectMenuItem(_batch?.subject?.id);

      _days = _batch?.batchDetail
              ?.map((e) => Days(
                    day: e.day,
                    endTime: e.endTime,
                    startTime: e.startTime,
                  ))
              .toList() ??
          [];
      emit(FetchedBatch());
    } else {
      emit(FetchBatchFailed('Failed to fetch details.'));
    }
  }
}
