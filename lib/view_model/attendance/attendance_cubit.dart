import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/attendance_monthly_record.dart';
import 'package:part_app/model/data_model/attendence_classes_conducted.dart';
import 'package:part_app/model/data_model/attendence_classes_of_month.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/batch_request.dart';
import 'package:part_app/model/data_model/batch_response.dart';
import '../../model/service/admin/attendance.dart';
part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceInitial());
  final _attendanceService = AttendanceService();

  List<Days> _days = [];
  List<BatchModel> _batches = [];

  // pagination
  int page = 1;
  String? nextPageUrl = '';

  List<Days> get days => _days;
  List<BatchModel> get batches => _batches;
  int id = 0;

  List<StudentAttendance>? studentAttendanceDetails;
  List<Class>? attendenceClasses;
  List<ConductedClass>? conductedClasses;
  int conductedClassCount = 0;

  /// reset
  void reset() {
    _batches.clear();
    studentAttendanceDetails = [];
    emit(AttendanceInitial());
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

  /// this method is used to get the classes of a batch in a particular month
  Future getClassesOfMonth({
    int? batchId,
    DateTime? date,
  }) async {
    _batches.clear();
    emit(FetchingAttendanceBatches(pagination: false));
    AttendenceClassesOfMonth? response = await _attendanceService
        .getAttendeceClassesOfMonth(batchId: batchId, date: date);
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
}
