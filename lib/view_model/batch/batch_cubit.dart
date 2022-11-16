import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/batch_request.dart';
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

  List<Days> get days => _days;

  List<Course>? get courses => _courses;

  List<Course>? get subjects => _subjects;

  List<String> get selectedTrainers => _selectedTrainers;

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
    try {
      Common? response = await _batchService.createBatch(request);
      print(response?.toJson());
    } catch (e) {
      print(e);
    }
  }
}
