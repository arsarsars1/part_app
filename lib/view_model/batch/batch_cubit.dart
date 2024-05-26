// ignore_for_file: prefer_final_fields

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/batch_request.dart';
import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/data_model/cancel_response.dart';
import 'package:part_app/model/data_model/class_link_response.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/course.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/data_model/reschedule_response.dart';
import 'package:part_app/model/data_model/student_app_batch_response.dart';
import 'package:part_app/model/data_model/students_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/model/service/admin/batch.dart';
import 'package:part_app/view/constants/default_values.dart';

part 'batch_state.dart';

class BatchCubit extends Cubit<BatchState> {
  BatchCubit() : super(BatchInitial());

  final _batchService = BatchService();

  List<Days> _days = [];
  List<StudentsData> _studentData = [];
  List<Course>? _courses;
  List<Course>? _subjects;
  bool second = false;
  bool isFromBatch = true;
  final List<int?> _selectedTrainers = [];
  List<BatchModel> _batches = [];
  List<StudentAppBatchDetail> _studentAppBatches = [];
  List<RescheduledClass> _rescheduledList = [];
  List<CancelledClass> _cancelledList = [];
  List<Student>? _students = [];
  List<ClassLink>? _classLinks = [];
  String tempStatus = 'ongoing';
  BatchModel? _batchModel;
  ClassLink? tempClass;
  Batch? _batch;
  String? sharedToken;
  List<Contact> _selectedContactList = [];
  bool isFromBatchDetail = false;

  // pagination

  int page = 1;
  String? nextPageUrl = '';

  DropDownItem? _defaultCourse;
  DropDownItem? _defaultSubject;

  List<Days> get days => _days;

  List<StudentsData> get studentData => _studentData;

  List<Contact> get selectedContactList => _selectedContactList;

  List<Course>? get courses => _courses;

  List<Course>? get subjects => _subjects;

  List<int?> get selectedTrainers => _selectedTrainers;

  List<BatchModel> get batches => _batches;

  List<StudentAppBatchDetail> get studentAppBatches => _studentAppBatches;

  List<BatchModel> get activeBatches =>
      _batches.where((element) => element.active).toList();

  List<Student>? get students => _students;

  List<ClassLink>? get classLinks => _classLinks;

  List<RescheduledClass> get rescheduledList => _rescheduledList;

  List<CancelledClass>? get cancelledList => _cancelledList;

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

  void addContact(Contact contact) {
    _selectedContactList.add(contact);
    if (!_studentData.contains(StudentsData(
        name: contact.displayName,
        mobileNo:
            contact.phones.first.number.replaceAll('+91', '')))) {
      _studentData.add(
        StudentsData(
            name: contact.displayName,
            mobileNo:
                contact.phones.first.number.replaceAll('+91', '')),
      );
    }

    emit(ContactAdded());
  }

  void removeContact(Contact contact) {
    _selectedContactList.removeWhere((element) =>
        element.phones.first.number ==
        contact.phones.first.number.replaceAll('+91', ''));
    _studentData.removeWhere((element) =>
        element.mobileNo ==
        contact.phones.first.number.replaceAll('+91', ''));
    emit(ContactRemoved());
  }

  void removeContact1(StudentsData contact) {
    _studentData.removeWhere((element) => element.mobileNo == contact.mobileNo);
    emit(ContactRemoved());
  }

  bool checkContactSelected(Contact contact) {
    bool flag = false;
    for (var element in selectedContactList) {
      if (element.phones.first.normalizedNumber.replaceAll('+91', '') ==
          contact.phones.first.normalizedNumber.replaceAll('+91', '')) {
        flag = true;
      }
    }
    return flag;
  }

  List<String> buildDaysList() {
    return _days.map((e) {
      return json.encode(e);
    }).toList();
  }

  List<String> buildStudentList() {
    return _studentData.map((e) {
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
    if (_courses == null) {
      emit(BatchNetworkError());
    }
    _defaultCourse = null;
    _defaultSubject = null;
    emit(CoursesUpdated());
  }

  Future getCoursesForTrainer({required int acadamyId}) async {
    _courses = await _batchService.getCoursesForTrainer(acadamyId: acadamyId);
    if (_courses == null) {
      emit(BatchNetworkError());
    }
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
      BatchResponse? response = await _batchService.createBatch(request);
      if (response == null) {
        emit(BatchNetworkError());
      } else if (response.status == 1) {
        await getBatches();
        sharedToken = response.batch?.shareToken;
        emit(CreatedBatch());
      } else {
        emit(CreateBatchFailed('Failed to create batch.'));
      }
    } catch (e) {
      emit(CreateBatchFailed('Failed to create batch.'));
    }
  }

  Future createBatchForTrainer(int trainerId, BatchRequest request) async {
    emit(CreatingBatch());
    try {
      BatchResponse? response =
          await _batchService.createBatchForTrainer(trainerId, request);
      if (response == null) {
        emit(BatchNetworkError());
      } else if (response.status == 1) {
        await getBatches();
        sharedToken = response.batch?.shareToken;
        emit(CreatedBatch());
      } else {
        emit(CreateBatchFailed('Failed to create batch.'));
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

  Future updateBatchForTrainer(int trainerId, BatchRequest request) async {
    emit(UpdatingBatch());
    try {
      Common? response = await _batchService.updateBatchForTrainer(
        trainerId,
        request,
        _batchModel?.id,
      );
      if (response?.status == 1) {
        await getBatchesForTrainer(trainerId);
        await getBatchForTrainerDetail(
            trainerId: trainerId, batchId: '${_batchModel?.id}');
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

  Future getBatchesForTrainer(int trainerId) async {
    _batches.clear();
    emit(FetchingBatches(pagination: false));
    BatchResponse? response =
        await _batchService.getBatchesForTrainer(trainerId);
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

    if (response == null) {
      emit(BatchNetworkError());
    } else if (response.status == 1) {
      nextPageUrl = response.batches?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }

      var items = response.batches?.data
              .map((e) => BatchModel.fromEntity(e))
              .toList() ??
          [];

      _batches.addAll(items);
      emit(BatchesFetched(moreItems: nextPageUrl != null));
    }
  }

  Future getBatchesByStatusForTrainer({
    required int? trainerId,
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
    BatchResponse? response = await _batchService.getBatchesByStatusForTrainer(
      trainerId: trainerId,
      branchId: branchId,
      status: status,
      search: search,
      page: page,
      branchSearch: branchSearch,
    );

    if (response == null) {
      emit(BatchNetworkError());
    } else if (response.status == 1) {
      nextPageUrl = response.batches?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }

      var items = response.batches?.data
              .map((e) => BatchModel.fromEntity(e))
              .toList() ??
          [];

      _batches.addAll(items);
      emit(BatchesFetched(moreItems: nextPageUrl != null));
    }
  }

  Future getStudentAppBatchesByStatus({
    int? studentId,
    int? branchId,
    String status = 'ongoing',
    String? search,
    bool clean = false,
    bool branchSearch = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      _studentAppBatches.clear();
      emit(FetchingBatches());
    } else {
      emit(FetchingBatches(pagination: true));
    }
    if (nextPageUrl == null) {
      emit(BatchesFetched());
      return;
    }
    StudentAppBatchResponse? response =
        await _batchService.getStudentAppBatchesByStatus(
      studentId: studentId,
      branchId: branchId,
      status: status,
      search: search,
      page: page,
      branchSearch: branchSearch,
    );

    if (response == null) {
      emit(BatchNetworkError());
    } else if (response.status == 1) {
      _studentAppBatches.addAll(response.batches ?? []);
      emit(BatchesFetched(moreItems: nextPageUrl != null));
    }
  }

  String createTrainerStringFromTrainer(List<Trainer>? trainers) {
    String trainer = '';
    if (trainers != null && trainers.isNotEmpty) {
      for (var element in trainers) {
        trainer += '${element.name}, ';
      }
      trainer = trainer.trimRight().removeLast();
    } else {
      trainer = 'No Trainer Allocated';
    }
    return trainer;
  }

  List<String> createDayList(List<StudentAppBatchInDetail>? batch) {
    List<String> days = [];

    days = batch!.map((e) {
      String day = DefaultValues.defaultTrainingDays[e.day];
      return '${day.substring(0, 3)} ${e.startTime?.toAmPM()} - ${e.endTime?.toAmPM()}';
    }).toList();
    return days;
  }

  Future getStudentBatchesByStatus({
    int? studentId,
    String status = 'ongoing',
    String? search,
    bool clean = false,
    bool studentSearch = false,
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
      branchId: studentId,
      status: status,
      search: search,
      page: page,
      branchSearch: studentSearch,
    );

    if (response == null) {
      emit(BatchNetworkError());
    } else if (response.status == 1) {
      nextPageUrl = response.batches?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }

      var items = response.batches?.data
              .map((e) => BatchModel.fromEntity(e))
              .toList() ??
          [];

      _batches.addAll(items);
      emit(BatchesFetched(moreItems: nextPageUrl != null));
    }
  }

  Future getBatchesByBranch({int? branchId, bool clean = false}) async {
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

  Future getBatchesByBranchForTrainer(
      {required int trainerId, int? branchId, bool clean = false}) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      _batches.clear();
      emit(FetchingBatches());
    } else {
      emit(FetchingBatches(pagination: true));
    }
    BatchResponse? response = await _batchService.getBatchesByBranchForTrainer(
      trainerId: trainerId,
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

  Future getOngoigBatchesForTrainer(int? trainerId) async {
    _batches.clear();
    var items = await _batchService.getTrainerBatches(trainerId);
    if (items != null && items.isNotEmpty) {
      for (var element in items) {
        if (element.batchStatus == "ongoing") {
          _batches.add(BatchModel.fromEntity(element));
        }
      }
      // _batches = items.map((e) => BatchModel.fromEntity(e)).toList();
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

      var items = _batch?.trainers?.map((e) => e.id).toList();
      if (items != null) {
        _selectedTrainers.addAll(items);
      }
      emit(FetchedBatch());
    } else {
      emit(FetchBatchFailed('Failed to fetch batch details.'));
    }
  }

  Future getBatchForTrainerDetail(
      {required int trainerId, required String batchId}) async {
    emit(FetchingBatch());
    BatchResponse? response = await _batchService.getBatchForTrainerDetail(
        trainerId: trainerId, id: batchId);
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

      var items = _batch?.trainers?.map((e) => e.id).toList();
      if (items != null) {
        _selectedTrainers.addAll(items);
      }
      emit(FetchedBatch());
    } else {
      emit(FetchBatchFailed('Failed to fetch batch details.'));
    }
  }

  Future getBatchForTrainer(
      {required int trainerId,
      required String batchId,
      required int acadamyId}) async {
    emit(FetchingBatch());
    BatchResponse? response = await _batchService.getBatchForTrainer(
        trainerId: trainerId, id: batchId);
    if (response?.status == 1 && response?.batch != null) {
      _batch = response?.batch;
      _batchModel = BatchModel.fromEntity(response!.batch!);

      // fetch the students
      // getStudentsByBatch(_batch?.id);

      // fetch the courses list
      if (_courses == null || _courses!.isEmpty) {
        await getCoursesForTrainer(acadamyId: acadamyId);
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

      var items = _batch?.trainers?.map((e) => e.id).toList();
      if (items != null) {
        _selectedTrainers.addAll(items);
      }
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

  Future rescheduleForTrainer(
      Map<String, dynamic> request, int trainerId) async {
    emit(ReschedulingBatch());
    Common? response = await _batchService.rescheduleClassForTrainer(
      request,
      trainerId,
      batchModel?.id,
    );
    if (response?.status == 1) {
      await getRescheduledBatchesForTrainer(trainerId: trainerId);
      emit(RescheduledBatch());
    } else {
      emit(RescheduleFailed(response?.message ?? 'Failed to reschedule'));
    }
  }

  Future cancelClass(Map<String, dynamic> request) async {
    emit(CancellingClassBatch());
    Common? response = await _batchService.cancelClass(
      request,
      batchModel?.id,
    );
    log((response?.status).toString());
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(CancelledClassBatch());
    } else {
      emit(CancelClassFailed(response?.message ?? 'Failed to reschedule'));
    }
  }

  Future cancelClassForTrainer(
      Map<String, dynamic> request, int trainerId) async {
    emit(CancellingClassBatch());
    Common? response = await _batchService.cancelClassForTrainer(
      request,
      trainerId,
      batchModel?.id,
    );
    log((response?.status).toString());
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(CancelledClassBatch());
    } else {
      emit(CancelClassFailed(response?.message ?? 'Failed to reschedule'));
    }
  }

  Future deleteClassCancellation(int? batchDetailId) async {
    emit(DeleteCancelledClass());
    Common? response = await _batchService.deleteClassCancellation(
      classId: batchDetailId,
      batchId: _batch?.id,
    );
    if (response?.status == 1) {
      await getCancelledBatches();
      emit(DeletedCancelledClass());
    } else {
      emit(CancelledClassDeletionFailed(
          response?.message ?? 'Failed to delete class'));
    }
  }

  Future deleteClassCancellationForTrainer(
      int? batchDetailId, int trainerId) async {
    emit(DeleteCancelledClass());
    Common? response = await _batchService.deleteClassCancellationForTrainer(
      trainerId: trainerId,
      classId: batchDetailId,
      batchId: _batch?.id,
    );
    if (response?.status == 1) {
      await getCancelledBatchesForTrainer(trainerId: trainerId);
      emit(DeletedCancelledClass());
    } else {
      emit(CancelledClassDeletionFailed(
          response?.message ?? 'Failed to delete class'));
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

  Future deactivateClassForTrainer(int? batchDetailId, int trainerId) async {
    emit(ReschedulingBatch());
    Common? response = await _batchService.deactivateClassForTrainer(
      trainerId: trainerId,
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

  Future getRescheduledBatchesForTrainer(
      {required int trainerId, int? year, int? month}) async {
    emit(RescheduledListFetching());
    RescheduleResponse? response =
        await _batchService.rescheduledClassesForTrainer(
      batchModel?.id,
      year: year,
      month: month,
      trainerId: trainerId,
    );

    if (response?.status == 1) {
      _rescheduledList = response?.rescheduledClasses ?? [];
    } else {
      _rescheduledList = [];
    }
    emit(RescheduledListFetched());
  }

  Future getCancelledBatches({int? year, int? month}) async {
    emit(CancelledListFetching());
    CancelResponse? response = await _batchService.cancelledClasses(
      batchModel?.id,
      year: year,
      month: month,
    );

    if (response?.status == 1) {
      _cancelledList = response?.cancelledClasses ?? [];
    } else {
      _cancelledList = [];
    }
    emit(CancelledListFetched());
  }

  Future getCancelledBatchesForTrainer(
      {required int trainerId, int? year, int? month}) async {
    emit(CancelledListFetching());
    CancelResponse? response = await _batchService.cancelledClassesForTrainer(
      batchModel?.id,
      trainerId,
      year: year,
      month: month,
    );

    if (response?.status == 1) {
      _cancelledList = response?.cancelledClasses ?? [];
    } else {
      _cancelledList = [];
    }
    emit(CancelledListFetched());
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

  Future addClassLinkForTrainer(
      int trainerId, int? batchId, Map<String, dynamic> data) async {
    try {
      emit(AddingLink());
      Common? response =
          await _batchService.addClassLinkForTrainer(trainerId, batchId, data);

      if (response?.status == 1) {
        emit(AddedLink());
      } else {
        emit(AddLinkFailed(response?.message ?? 'Failed to add link.'));
      }
    } catch (e) {
      return null;
    }
  }

  Future updateClassLink(
      int? batchId, int? classId, Map<String, dynamic> data) async {
    try {
      emit(UpdatingLink());
      Common? response =
          await _batchService.updateClassLink(batchId, classId, data);

      if (response?.status == 1) {
        emit(UpdatedLink());
      } else {
        emit(UpdateLinkFailed(response?.message ?? 'Failed to add link.'));
      }
    } catch (e) {
      return null;
    }
  }

  Future updateClassLinkForTrainer(int trainerId, int? batchId, int? classId,
      Map<String, dynamic> data) async {
    try {
      emit(UpdatingLink());
      Common? response = await _batchService.updateClassLinkForTrainerId(
          trainerId, batchId, classId, data);

      if (response?.status == 1) {
        emit(UpdatedLink());
      } else {
        emit(UpdateLinkFailed(response?.message ?? 'Failed to add link.'));
      }
    } catch (e) {
      return null;
    }
  }

  Future getClassLink(int? batchId, DateTime dateTime) async {
    emit(FetchingLinks());
    _classLinks = [];
    ClassLinkResponse? response = await _batchService.getClassLink(
      batchId,
      dateTime,
    );
    if (response?.classLinks != null) {
      _classLinks = response?.classLinks;
      emit(FetchedLinks());
    } else {
      emit(FetchingLinks());
    }
  }

  Future getClassLinkForTrainer(
      int trainerId, int? batchId, DateTime dateTime) async {
    emit(FetchingLinks());
    _classLinks = [];
    ClassLinkResponse? response = await _batchService.getClassLinkForTrainer(
      trainerId,
      batchId,
      dateTime,
    );
    if (response?.classLinks != null) {
      _classLinks = response?.classLinks;
      emit(FetchedLinks());
    } else {
      emit(FetchingLinks());
    }
  }

  Future removeClassLink(
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
      emit(RemoveLinkFailed(response?.message ?? 'Failed to add link.'));
    }
  }

  Future removeClassLinkForTrainer(
    int trainerId,
    int? batchId,
    int? linkId,
  ) async {
    emit(RemovingLink());
    Common? response = await _batchService.removeClassLinkForTrainer(
      trainerId,
      batchId,
      linkId,
    );

    if (response?.status == 1) {
      emit(RemovedLink());
    } else {
      emit(RemoveLinkFailed(response?.message ?? 'Failed to add link.'));
    }
  }
}
