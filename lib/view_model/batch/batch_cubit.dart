import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/batch_request.dart';
import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/data_model/class_link_response.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/course.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/data_model/reschedule_response.dart';
import 'package:part_app/model/data_model/students_response.dart';
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
  List<BatchDetail> _rescheduledList = [];
  List<Student>? _students;
  List<ClassLink>? _classLinks;

  BatchModel? _batchModel;
  Batch? _batch;

  // pagination

  int page = 1;
  String? nextPageUrl = '';

  DropDownItem? _defaultCourse;
  DropDownItem? _defaultSubject;

  List<Days> get days => _days;

  List<Course>? get courses => _courses;

  List<Course>? get subjects => _subjects;

  List<String> get selectedTrainers => _selectedTrainers;

  List<BatchModel> get batches => _batches;

  List<BatchModel> get activeBatches =>
      _batches.where((element) => element.active).toList();

  List<Student>? get students => _students;

  List<ClassLink>? get classLinks => _classLinks;

  List<BatchDetail> get rescheduledList => _rescheduledList;

  BatchModel? get batchModel => _batchModel;

  Batch? get batch => _batch;

  DropDownItem? get defaultCourse => _defaultCourse;

  DropDownItem? get defaultSubject => _defaultSubject;

  void addDay(Days day) {
    _days.removeWhere((element) => element.day == day.day);
    _days.add(day);

    emit(DaysUpdated());
  }

  void removeDay(Days day) {
    _days.removeWhere((element) => element.day == day.day);

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
    try {
      var item = getSubjectsDropDown()?.firstWhere(
        (element) => element.id == courseId,
      );
      return item;
    } catch (e) {
      return null;
    }
  }

  /// reset
  void reset() {
    _batches.clear();
    emit(BatchInitial());
  }

  void refresh() {
    emit(BatchesFetched());
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
      Common? response = await _batchService.updateBatch(
        request,
        _batchModel?.id,
      );
      if (response?.status == 1) {
        await getBatches();
        await getBatch(batchId: '${_batchModel?.id}');
        emit(UpdatedBatch());
      } else {
        emit(UpdateBatchFailed(response?.message ?? 'Failed to update batch.'));
      }
    } catch (e) {
      emit(UpdateBatchFailed('Failed to update batch.'));
    }
  }

  Future getBatches() async {
    _batches.clear();
    emit(FetchingBatches(pagination: false));
    BatchResponse? response = await _batchService.getBatches();
    if (response?.status == 1) {
      _batches = response?.batches?.data
              .where((element) => element.branch?.isActive == 1)
              .map((e) => BatchModel.fromEntity(e))
              .toList() ??
          [];
      emit(BatchesFetched());
    }
  }

  Future getBatchesByStatus({
    int? branchId,
    String status = 'ongoing',
    String? search,
    bool clean = false,
    bool branchSearch = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      _batches.clear();
      emit(FetchingBatches());
    } else {
      emit(FetchingBatches(pagination: true));
    }
    if (nextPageUrl == null) {
      emit(BatchesFetched());
      return;
    }
    BatchResponse? response = await _batchService.getBatchesByStatus(
      branchId: branchId,
      status: status,
      search: search,
      page: page,
      branchSearch: branchSearch,
    );

    if (response?.status == 1) {
      nextPageUrl = response?.batches?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }

      var items = response?.batches?.data
              .map((e) => BatchModel.fromEntity(e))
              .toList() ??
          [];

      _batches.addAll(items);
      emit(BatchesFetched(moreItems: nextPageUrl != null));
    }
  }

  Future getBatchesByBranch(int? branchId, {bool clean = false}) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      _batches.clear();
      emit(FetchingBatches());
    } else {
      emit(FetchingBatches(pagination: true));
    }
    BatchResponse? response = await _batchService.getBatchesByBranch(
      page: page,
      branchId: branchId,
    );
    if (response?.status == 1) {
      nextPageUrl = response?.batches?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }
      var items = response?.batches?.data
              .map((e) => BatchModel.fromEntity(e))
              .toList() ??
          [];

      _batches.addAll(items);
      emit(BatchesFetched(moreItems: nextPageUrl != null));
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

      // fetch the students
      // getStudentsByBatch(_batch?.id);

      // fetch the courses list
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
      emit(FetchBatchFailed('Failed to fetch batch details.'));
    }
  }

  Future reschedule(Map<String, dynamic> request) async {
    emit(ReschedulingBatch());
    Common? response = await _batchService.rescheduleClass(
      request,
      batchModel?.id,
    );
    if (response?.status == 1) {
      await getRescheduledBatches();
      emit(RescheduledBatch());
    } else {
      emit(RescheduleFailed(response?.message ?? 'Failed to reschedule'));
    }
  }

  Future deactivateClass(int? batchDetailId) async {
    emit(ReschedulingBatch());
    Common? response = await _batchService.deactivateClass(
      classId: batchDetailId,
      batchId: _batch?.id,
    );
    if (response?.status == 1) {
      await getRescheduledBatches();
      emit(RescheduledBatch());
    } else {
      emit(RescheduleFailed(response?.message ?? 'Failed to reschedule'));
    }
  }

  Future getRescheduledBatches({int? year, int? month}) async {
    emit(RescheduledListFetching());
    RescheduleResponse? response = await _batchService.rescheduledClasses(
      batchModel?.id,
      year: year,
      month: month,
    );

    if (response?.status == 1) {
      _rescheduledList = response?.rescheduledClasses ?? [];
    } else {
      _rescheduledList = [];
    }
    emit(RescheduledListFetched());
  }

  /// Method to get the students
  Future getStudentsByBatch(int? batchId) async {
    emit(FetchingBatchStudents());
    StudentsResponse? response = await _batchService.getStudentsByBatch(
      batchId,
    );
    if (response?.status == 1) {
      _students = response?.students?.data;
      emit(FetchedBatchStudents());
    } else {
      emit(FetchingBatchStudentsFailed());
    }
  }

  Future addClassLink(int? batchId, Map<String, dynamic> data) async {
    try {
      emit(AddingLink());
      Common? response = await _batchService.addClassLink(batchId, data);

      if (response?.status == 1) {
        emit(AddedLink());
      } else {
        emit(AddLinkFailed(response?.message ?? 'Failed to add link.'));
      }
    } catch (e) {
      return null;
    }
  }

  Future getClassLink(int? batchId, DateTime dateTime) async {
    emit(FetchingLinks());
    ClassLinkResponse? response = await _batchService.getClassLink(
      batchId,
      dateTime,
    );
    if (response?.classLinks != null) {
      _classLinks = response?.classLinks;
      emit(FetchedLinks());
    }
  }

  Future removeClassLint(
    int? batchId,
    int? linkId,
  ) async {
    emit(RemovingLink());
    Common? response = await _batchService.removeClassLink(
      batchId,
      linkId,
    );

    if (response?.status == 1) {
      emit(RemovedLink());
    } else {
      emit(RemoveLinkFailed());
    }
  }
}
