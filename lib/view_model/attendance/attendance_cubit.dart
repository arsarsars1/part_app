import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/attendance_monthly_record.dart';
import 'package:part_app/model/data_model/attendence_add_request.dart';
import 'package:part_app/model/data_model/attendence_classes_conducted.dart';
import 'package:part_app/model/data_model/attendence_classes_of_month.dart';
import 'package:part_app/model/data_model/attendence_taken.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/batch_request.dart';
import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/student_attendence_of_month.dart';

import '../../model/service/admin/attendance.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceInitial());
  final _attendanceService = AttendanceService();

  final List<Attendance> _attendance = [];
  final List<Days> _days = [];
  final List<BatchModel> _batches = [];
  final List<AttendanceDetails> _attendenceTaken = [];
  ConductedClassDetails? _conductedClassDetails;

  Set<int> selectedStudents = {};
  Set<int> updatedStudents = {};

  // pagination
  int page = 1;
  String? nextPageUrl = '';

  List<Attendance> get attendance => _attendance;
  List<Days> get days => _days;
  List<BatchModel> get batches => _batches;
  List<AttendanceDetails> get attendenceTaken => _attendenceTaken;
  ConductedClassDetails? get conductedClassDetails => _conductedClassDetails;
  int id = 0;

  List<StudentAttendance>? studentAttendanceDetails;
  List<ClassDetails>? attendenceClasses;
  List<ConductedClass>? conductedClasses;
  List<StudentAttendances>? studentClasses;
  ClassDetails? selectedClass;
  int conductedClassCount = 0;
  DateTime? conductedDate;
  List<int> conductedClassIdList = [];
  int pre = 0;
  int abs = 0;
  bool isFromRescheduledClass = false;
  int dropdownSelectedIndex = 0;

  void addOrRemoveStudent(int studentId) {
    if (selectedStudents.contains(studentId)) {
      selectedStudents.remove(studentId);
    } else {
      selectedStudents.add(studentId);
    }
    emit(AddedAttendance());
  }

  void updateStudent(int studentId) {
    if (updatedStudents.contains(studentId)) {
      updatedStudents.remove(studentId);
    } else {
      updatedStudents.add(studentId);
    }
    emit(AddedForUpdateAttendance());
  }

  Future updateAttendence(
      {Map<String, dynamic>? request,
      int? batchId,
      int? conductedClassId,
      int? conductedClassStudentId}) async {
    emit(UpdatingAttendence());
    Common? response = await _attendanceService.updateAttendence(
      request: request,
      batchId: batchId,
      conductedClassId: conductedClassId,
      conductedClassStudentId: conductedClassStudentId,
    );
    if (response?.status == 1) {
      emit(UpdatedAttendence());
    } else {
      emit(UpdateAttendenceFailed(response?.message ?? 'Failed to reschedule'));
    }
  }

  Future updateAttendenceForTrainer(
      {required int trainerId,
      Map<String, dynamic>? request,
      int? batchId,
      int? conductedClassId,
      int? conductedClassStudentId}) async {
    emit(UpdatingAttendence());
    Common? response = await _attendanceService.updateAttendenceForTrainer(
      trainerId: trainerId,
      request: request,
      batchId: batchId,
      conductedClassId: conductedClassId,
      conductedClassStudentId: conductedClassStudentId,
    );
    if (response?.status == 1) {
      emit(UpdatedAttendence());
    } else {
      emit(UpdateAttendenceFailed(response?.message ?? 'Failed to reschedule'));
    }
  }

  /// reset
  void reset() {
    _batches.clear();
    studentAttendanceDetails = [];
    emit(AttendanceInitial());
  }

  void addAttendenceofStudent(Attendance attendance) {
    _attendance.removeWhere(
        (element) => element.studentDetailId == attendance.studentDetailId);
    _attendance.add(attendance);

    // emit(DaysUpdated());
  }

  List<String> buildAttendanceList() {
    return _attendance.map((e) {
      return json.encode(e);
    }).toList();
  }

  Future addAttendence(AttendenceAddRequest request, {int? batchId}) async {
    emit(CreatingAttendance());
    try {
      Common? response =
          await _attendanceService.createAttendence(request, batchId: batchId);
      if (response?.status == 1) {
        emit(CreatedAttendance());
      } else {
        emit(CreateAttendanceFailed(
            response?.message ?? 'Failed to save attendance.'));
      }
    } catch (e) {
      emit(CreateAttendanceFailed('Failed to save attendance.'));
    }
  }

  Future addAttendenceForTrainer(AttendenceAddRequest request,
      {int? batchId, required int trainerId}) async {
    emit(CreatingAttendance());
    try {
      Common? response = await _attendanceService.createAttendenceForTrainer(
          request,
          batchId: batchId,
          trainerId: trainerId);
      if (response?.status == 1) {
        emit(CreatedAttendance());
      } else {
        emit(CreateAttendanceFailed(
            response?.message ?? 'Failed to save attendance.'));
      }
    } catch (e) {
      emit(CreateAttendanceFailed('Failed to save attendance.'));
    }
  }

  void refresh() {
    emit(AttendanceBatchesFetched());
  }

  /// this method can use when needed. It is working right now
  Future getBatches({
    int? branchId,
  }) async {
    _batches.clear();
    emit(FetchingAttendanceBatches(pagination: false));
    BatchResponse? response =
        await _attendanceService.getBatches(branchId: branchId!);
    if (response?.status == 1) {
      var items = response?.batches?.data
              .where((element) => element.isActive == 1)
              .map((e) => BatchModel.fromEntity(e))
              .toList() ??
          [];

      _batches.addAll(items);

      emit(AttendanceBatchesFetched());
    }
  }

  /// this method will handle four different uses based on
  /// [ branchId ] , [ search ]

  Future getBatchesByStatus({
    int? branchId,
    String? search,
    bool clean = false,
    bool branchSearch = false,
    String status = "ongoing",
  }) async {
    if (clean) {
      reset();
      page = 1;
      nextPageUrl = '';
      _batches.clear();
      emit(FetchingAttendanceBatches());
    } else {
      emit(FetchingAttendanceBatches(pagination: true));
    }
    if (nextPageUrl == null) {
      emit(AttendanceBatchesFetched());
      return;
    }
    BatchResponse? response = await _attendanceService.getBatchesByStatus(
      branchId: branchId,
      status: status,
      search: search,
      page: page,
      branchSearch: branchSearch,
    );

    if (response == null) {
      emit(AttendanceNetworkError());
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
      emit(AttendanceBatchesFetched(moreItems: nextPageUrl != null));
    }
  }

  Future getBatchesByStatusForTrainer({
    required int trainerId,
    int? branchId,
    String? search,
    bool clean = false,
    bool branchSearch = false,
    String status = "ongoing",
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      _batches.clear();
      emit(FetchingAttendanceBatches());
    } else {
      emit(FetchingAttendanceBatches(pagination: true));
    }
    if (nextPageUrl == null) {
      emit(AttendanceBatchesFetched());
      return;
    }
    BatchResponse? response =
        await _attendanceService.getBatchesByStatusForTrainer(
      trainerId: trainerId,
      branchId: branchId,
      status: status,
      search: search,
      page: page,
      branchSearch: branchSearch,
    );

    if (response == null) {
      emit(AttendanceNetworkError());
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
      emit(AttendanceBatchesFetched(moreItems: nextPageUrl != null));
    }
  }

  Future getStudentsMonthly({
    String? searchQuery,
    String? activeStatus,
    int? batchId,
    int? year,
    int? month,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      // _studentsMap.clear();
      studentAttendanceDetails = [];
      emit(FetchingStudentsAttendance());
    } else {
      emit(FetchingStudentsAttendance(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(StudentsAttendanceFetched());
      return;
    }

    AttendanceMonthlyRecord? response = await _attendanceService.getStudents(
      batchId: batchId,
      month: month,
      year: year,
      searchQuery: searchQuery,
      activeStatus: activeStatus,
      pageNo: page,
    );

    if (response?.status == 1) {
      studentAttendanceDetails = response?.studentAttendances ?? [];
      conductedClassCount = response?.conductedClassCount ?? 0;
      emit(StudentsAttendanceFetched(/*moreItems: nextPageUrl != null*/));
    }
  }

  Future getStudentsMonthlyForTrainer({
    required int trainerId,
    String? searchQuery,
    String? activeStatus,
    int? batchId,
    int? year,
    int? month,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      // _studentsMap.clear();
      studentAttendanceDetails = [];
      emit(FetchingStudentsAttendance());
    } else {
      emit(FetchingStudentsAttendance(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(StudentsAttendanceFetched());
      return;
    }

    AttendanceMonthlyRecord? response =
        await _attendanceService.getStudentsForTrainer(
      trainerId: trainerId,
      batchId: batchId,
      month: month,
      year: year,
      searchQuery: searchQuery,
      activeStatus: activeStatus,
      pageNo: page,
    );

    if (response?.status == 1) {
      studentAttendanceDetails = response?.studentAttendances ?? [];
      conductedClassCount = response?.conductedClassCount ?? 0;
      emit(StudentsAttendanceFetched(/*moreItems: nextPageUrl != null*/));
    }
  }

  /// this method is used to get the classes of a batch in a particular month
  Future getClassesOfMonth({
    int? batchId,
    DateTime? date,
  }) async {
    _batches.clear();
    emit(FetchingAttendanceBatches(pagination: false));
    AttendenceClassDetailsesOfMonth? response = await _attendanceService
        .getAttendeceClassesOfMonth(batchId: batchId, date: date);
    if (response?.status == 1) {
      attendenceClasses = response?.classes ?? [];
      emit(AttendanceBatchesFetched());
    }
  }

  /// this method is used to get the classes of a batch in a particular month
  Future getClassesOfMonthForTrainer({
    required int trainerId,
    int? batchId,
    DateTime? date,
  }) async {
    _batches.clear();
    emit(FetchingAttendanceBatches(pagination: false));
    AttendenceClassDetailsesOfMonth? response =
        await _attendanceService.getAttendeceClassesOfMonthForTrainer(
            trainerId: trainerId, batchId: batchId, date: date);
    if (response?.status == 1) {
      attendenceClasses = response?.classes ?? [];
      emit(AttendanceBatchesFetched());
    }
  }

  Future getStudentAppClassesOfMonth({
    int? batchId,
    DateTime? date,
    int? studentId,
  }) async {
    _batches.clear();
    emit(FetchingAttendanceBatches(pagination: false));
    AttendenceClassDetailsesOfMonth? response =
        await _attendanceService.getStudentAppAttendeceClassesOfMonth(
      batchId: batchId,
      date: date,
      studentId: studentId,
    );
    if (response?.status == 1) {
      attendenceClasses = response?.classes ?? [];
      emit(AttendanceBatchesFetched());
    }
  }

  /// this method is used to get the classes of a batch in a particular month
  Future getConductedClassesOfMonth({
    int? batchId,
    DateTime? date,
  }) async {
    _batches.clear();
    emit(FetchingAttendanceBatches(pagination: false));
    AttendenceConductedClass? response = await _attendanceService
        .getConductedAttendeceClassesOfMonth(batchId: batchId, date: date);
    if (response?.status == 1) {
      conductedClasses = response?.conductedClasses.data ?? [];
      emit(AttendanceBatchesFetched());
    }
  }

  /// this method is used to get the classes of a batch in a particular month
  Future getConductedClassesOfMonthForTrainer({
    required int trainerId,
    int? batchId,
    DateTime? date,
  }) async {
    _batches.clear();
    emit(FetchingAttendanceBatches(pagination: false));
    AttendenceConductedClass? response =
        await _attendanceService.getConductedAttendeceClassesOfMonthForTrainer(
            trainerId: trainerId, batchId: batchId, date: date);
    if (response?.status == 1) {
      conductedClasses = response?.conductedClasses.data ?? [];
      emit(AttendanceBatchesFetched());
    }
  }

  /// this method can use when needed. It is working right now
  Future getAttendenceTaken({int? batchId, int? conductedClassId}) async {
    selectedStudents.clear();
    _attendenceTaken.clear();
    updatedStudents.clear();
    _conductedClassDetails = null;
    emit(UpdatingAttendence());
    try {
      AttendenceTaken? response = await _attendanceService.getAttendenceTaken(
          batchId: batchId ?? 0, conductedClassId: conductedClassId ?? 0);
      if (response?.status == 1) {
        var items = response?.conductedClass?.attendances ?? [];
        _conductedClassDetails = response?.conductedClass;
        _attendenceTaken.addAll(items);

        updatedStudents.clear();
        for (AttendanceDetails element in _attendenceTaken) {
          if (element.isPresent == 1) {
            updatedStudents.add(element.studentDetailId ?? 0);
          }
        }

        emit(AttendanceBatchesFetched());
      }
    } catch (e) {
      emit(UpdateAttendenceFailed(e.toString()));
    }
  }

  /// this method can use when needed. It is working right now
  Future getAttendenceTakenForTrainer(
      {required int trainerId, int? batchId, int? conductedClassId}) async {
    selectedStudents.clear();
    _attendenceTaken.clear();
    updatedStudents.clear();
    _conductedClassDetails = null;
    emit(UpdatingAttendence());
    try {
      AttendenceTaken? response =
          await _attendanceService.getAttendenceTakenForTrainer(
              trainerId: trainerId,
              batchId: batchId ?? 0,
              conductedClassId: conductedClassId ?? 0);
      if (response?.status == 1) {
        var items = response?.conductedClass?.attendances ?? [];
        _conductedClassDetails = response?.conductedClass;
        _attendenceTaken.addAll(items);

        updatedStudents.clear();
        for (AttendanceDetails element in _attendenceTaken) {
          if (element.isPresent == 1) {
            updatedStudents.add(element.studentDetailId ?? 0);
          }
        }

        emit(AttendanceBatchesFetched());
      }
    } catch (e) {
      emit(UpdateAttendenceFailed(e.toString()));
    }
  }

  /// this method is used to get the attendance of a student in a batch in a particular month
  Future getAttendenceOfStudentOfMonth({
    int? batchId,
    int? studentDetailId,
    DateTime? date,
  }) async {
    _batches.clear();
    emit(FetchingAttendanceBatches(pagination: false));
    StudentAttendenceOfMonth? response =
        await _attendanceService.getAttendenceOfStudentOfMonth(
            batchId: batchId, studentDetailId: studentDetailId, date: date);
    if (response?.status == 1) {
      studentClasses = response?.studentAttendance ?? [];
      pre = response?.presentCount ?? 0;
      abs = response?.absentCount ?? 0;
      emit(AttendanceBatchesFetched());
    }
  }

  /// this method is used to get the attendance of a student in a batch in a particular month
  Future getAttendenceOfStudentOfMonthForTrainer({
    required int trainerId,
    int? batchId,
    int? studentDetailId,
    DateTime? date,
  }) async {
    _batches.clear();
    emit(FetchingAttendanceBatches(pagination: false));
    StudentAttendenceOfMonth? response =
        await _attendanceService.getAttendenceOfStudentOfMonthForTrainer(
            trainerId: trainerId,
            batchId: batchId,
            studentDetailId: studentDetailId,
            date: date);
    if (response?.status == 1) {
      studentClasses = response?.studentAttendance ?? [];
      pre = response?.presentCount ?? 0;
      abs = response?.absentCount ?? 0;
      emit(AttendanceBatchesFetched());
    }
  }

  Future getStudentAppAttendenceOfStudentOfMonth({
    int? batchId,
    int? studentDetailId,
    DateTime? date,
  }) async {
    _batches.clear();
    emit(FetchingAttendanceBatches(pagination: false));
    StudentAttendenceOfMonth? response =
        await _attendanceService.getStudentAppAttendenceOfStudentOfMonth(
            batchId: batchId, studentDetailId: studentDetailId, date: date);
    if (response?.status == 1) {
      studentClasses = response?.studentAttendance ?? [];
      pre = response?.presentCount ?? 0;
      abs = response?.absentCount ?? 0;
      emit(AttendanceBatchesFetched());
    }
  }
}
