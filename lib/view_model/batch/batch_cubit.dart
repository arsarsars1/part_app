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

part 'batch_state.dart';

class BatchCubit extends Cubit<BatchState> {
  BatchCubit() : super(BatchInitial());

  final _batchService = BatchService();

  final List<Days> _days = [];
  List<Course>? _courses;
  List<Course>? _subjects;

  final List<String> _selectedTrainers = [];
  List<BatchModel> _batches = [];

  List<Days> get days => _days;

  List<Course>? get courses => _courses;

  List<Course>? get subjects => _subjects;

  List<String> get selectedTrainers => _selectedTrainers;

  List<BatchModel> get batches => _batches;

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

  List<DropDownItem>? getSubjectsDropDown() {
    return _subjects
        ?.map((e) => DropDownItem(id: e.id, title: e.subjectName, item: e))
        .toList();
  }

  Future getCourses() async {
    _courses = await _batchService.getCourses();
    emit(CoursesUpdated());
  }

  Future getSubjects({required int? courseId}) async {
    emit(GettingCourses());
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

  Future getBatches() async {
    BatchResponse? response = await _batchService.getBatches();
    if (response?.status == 1) {
      _batches =
          response?.batches?.map((e) => BatchModel.fromEntity(e)).toList() ??
              [];
      emit(BatchesFetched());
    }
  }
}
