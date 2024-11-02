import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/student_model.dart';
import 'package:part_app/model/data_model/student_request.dart';
import 'package:part_app/model/data_model/student_request_for_student.dart';
import 'package:part_app/model/data_model/students_response.dart';
import 'package:part_app/model/extensions.dart';
import 'package:part_app/model/service/admin/student.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/utils.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());

  final _studentService = StudentService();

  StudentRequest _studentRequest = const StudentRequest();

  StudentRequest get studentRequest => _studentRequest;

  StudentRequestForStudent _studentRequestForStudent =
      const StudentRequestForStudent();

  StudentRequestForStudent get studentRequestForStudent =>
      _studentRequestForStudent;

  Student? _student;
  Student? tempStudent;
  bool second = false;
  int? activeStudentsCount;
  int? inactiveStudentsCount;
  Student? get student => _student;

  final Map<int?, StudentModel> _studentsMap = {};

  List<StudentModel>? get students => _studentsMap.values.toList();

  List<BatchModel> _batches = [];

  List<BatchModel> get batches => _batches;

  List<int> get enrolledBatches => _batches.map((e) => e.id).toList();

  File? _profilePic;

  // pagination

  int page = 1;
  String? nextPageUrl = '';

  void setStudent(StudentRequest request) {
    _studentRequest = request;
  }

  void setStudentForStudent(StudentRequestForStudent request) {
    _studentRequestForStudent = request;
  }

  void setProfilePic(File file) {
    _profilePic = file;
  }

  void clearBatches() {
    _batches.clear();
  }

  Future createStudent() async {
    emit(CreatingStudent());
    _student = null;
    var request = _studentRequest.toJson();

    if (_profilePic != null) {
      MultipartFile? picFile =
          await Utils().generateMultiPartFile(_profilePic!);
      request.putIfAbsent('profile_pic', () => picFile);
    }
    StudentResponse? response = await _studentService.createStudent(
      request,
    );

    if (response?.status == 1) {
      _student = response?.student;
      tempStudent = response?.student;
      // updateStudentsList();
      emit(CreatedStudent());
      _profilePic = null;
      _studentRequest = const StudentRequest();
    } else {
      emit(
        CreateStudentFailed(response?.message ?? 'Failed to create student'),
      );
    }
  }

  Future createStudentForTrainer({
    required int trainerId,
  }) async {
    emit(CreatingStudent());
    _student = null;
    var request = _studentRequest.toJson();

    if (_profilePic != null) {
      MultipartFile? picFile =
          await Utils().generateMultiPartFile(_profilePic!);
      request.putIfAbsent('profile_pic', () => picFile);
    }
    StudentResponse? response = await _studentService.createStudentForTrainer(
        request: request, trainerId: trainerId);

    if (response?.status == 1) {
      _student = response?.student;
      tempStudent = response?.student;
      // updateStudentsList();
      emit(CreatedStudent());
      _profilePic = null;
      _studentRequest = const StudentRequest();
    } else {
      emit(
        CreateStudentFailed(response?.message ?? 'Failed to create student'),
      );
    }
  }

  Future enrollToBatch() async {
    emit(CreatingStudent());

    StudentResponse? response = await _studentService.enrollToBatch(
      _studentRequest.toJson(),
      _student?.studentDetail?[0].id,
    );

    if (response?.status == 1) {
      await getStudentBatches();
      emit(CreatedStudent());
    } else {
      emit(
        CreateStudentFailed(response?.message ?? 'Failed to add batch.'),
      );
    }
  }

  Future enrollToBatchForStudent({required String token}) async {
    emit(CreatingStudent());

    StudentResponse? response = await _studentService.enrollToBatchForStudent(
        _studentRequestForStudent.toJson(), token);

    if (response?.status == 1) {
      emit(CreatedStudent());
    } else {
      emit(
        CreateStudentFailed(response?.message ?? 'Failed to add batch.'),
      );
    }
  }

  Future enrollToBatchForTrainer({
    required int trainerId,
  }) async {
    emit(CreatingStudent());

    StudentResponse? response = await _studentService.enrollToBatchForTrainer(
        request: _studentRequest.toJson(),
        studentId: _student?.studentDetail?[0].id,
        trainerId: trainerId);

    if (response?.status == 1) {
      await getStudentBatches();
      emit(CreatedStudent());
    } else {
      emit(
        CreateStudentFailed(response?.message ?? 'Failed to add batch.'),
      );
    }
  }

  Future updateStudent(StudentRequest request) async {
    emit(UpdatingStudent());
    StudentResponse? response = await _studentService.updateStudent(
      request.toJson(),
      _student?.studentDetail?[0].id,
    );

    if (response?.status == 1) {
      _student = response?.student;
      updateStudentsList();
      emit(UpdatedStudent());
    } else {
      emit(
        UpdateStudentFailed(response?.message ?? 'Failed to update student'),
      );
    }
  }

  Future updateStudentForTrainer(int trainerId, StudentRequest request) async {
    emit(UpdatingStudent());
    StudentResponse? response = await _studentService.updateStudentForTrainer(
      request.toJson(),
      _student?.studentDetail?[0].id,
      trainerId,
    );

    if (response?.status == 1) {
      _student = response?.student;
      updateStudentsList();
      emit(UpdatedStudent());
    } else {
      emit(
        UpdateStudentFailed(response?.message ?? 'Failed to update student'),
      );
    }
  }

  Future updateProfilePic({required File profilePic, int? trainerId}) async {
    emit(UpdatingStudent());
    MultipartFile? picFile = await Utils().generateMultiPartFile(profilePic);
    Map<String, dynamic> data = {
      'profile_pic': picFile,
      'is_parent': _student?.studentDetail?[0].parentName == null ? 0 : 1,
      'parent_name': _student?.studentDetail?[0].parentName,
    };
    StudentResponse? response = await _studentService.updateStudent(
      data,
      _student?.studentDetail?[0].id,
      trainerId: trainerId,
    );
    if (response?.status == 1) {
      _student = response?.student;
      String url = trainerId != null
          ? '${F.baseUrl}/trainers/$trainerId/images/student/'
              '${_student?.studentDetail?[0].id}/${_student?.studentDetail?[0].profilePic}'
          : '${F.baseUrl}/admin/images/student/${_student?.studentDetail?[0].id}'
              '/${_student?.studentDetail?[0].profilePic}';
      await CachedNetworkImage.evictFromCache(url);
      updateStudentsList();
      emit(UpdatedStudent());
    } else {
      emit(
        UpdateStudentFailed(
            response?.message ?? 'Failed to update profile pic'),
      );
    }
  }

  Future updateStatus({required int active}) async {
    emit(UpdatingStudent());

    Common? response = await _studentService.updateStatus(
      status: active,
      studentId: _student?.studentDetail?[0].id,
    );
    if (response?.status == 1) {
      await studentDetails(_student?.studentDetail?[0].id);
      updateStudentsList();
      emit(UpdatedStudent());
    } else {
      emit(
        UpdateStudentFailed(response?.message ?? 'Failed to update status.'),
      );
    }
  }

  void clean() {
    page = 1;
    nextPageUrl = '';
    activeStudentsCount = null;
    inactiveStudentsCount = null;
    _studentsMap.clear();
    emit(StudentInitial());
  }

  Future<void> getStudents({
    int? batchId,
    int? branchId,
    String? searchQuery,
    String? activeStatus,
    bool clean = false,
  }) async {
    if (state is FetchingStudents) {
      return;
    }
    if (clean) {
      page = 1;
      nextPageUrl = '';
      activeStudentsCount = null;
      inactiveStudentsCount = null;
      _studentsMap.clear();
      emit(FetchingStudents());
    } else {
      emit(FetchingStudents(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(StudentsFetched());
      return;
    }

    StudentsResponse? response = await _studentService.getStudents(
      branchId: branchId,
      batchId: batchId,
      searchQuery: searchQuery,
      activeStatus: activeStatus,
      pageNo: page,
    );

    if (response?.status == 1) {
      nextPageUrl = response?.students?.nextPageUrl;
      if (nextPageUrl != null && nextPageUrl.isNotNullOrEmpty()) {
        page++;
      } else {
        nextPageUrl = null;
      }

      var items = response?.students?.data ?? [];
      activeStudentsCount = response?.activeStudentsCount;
      inactiveStudentsCount = response?.inactiveStudentsCount;
      List<StudentModel> tempStudents = [];

      for (var student in items) {
        var details = student.studentDetail;
        if (details != null) {
          for (var details in details) {
            StudentModel newStudent;
            if (activeStatus == null) {
              newStudent = StudentModel.fromEntity(student, details);
            } else {
              newStudent =
                  StudentModel.fromEntity1(student, details, batchId ?? 0);
            }

            tempStudents.add(newStudent);
          }
        }
      }

      _studentsMap.addEntries(tempStudents.map((e) => MapEntry(e.detailId, e)));

      emit(StudentsFetched(moreItems: nextPageUrl != null));
    } else {
      emit(StudentDetailsFailed(response?.message ?? ""));
    }
  }

  Future<void> getBatchStudents({
    int? batchId,
    String? searchQuery,
    String? activeStatus,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      activeStudentsCount = null;
      inactiveStudentsCount = null;
      _studentsMap.clear();
      emit(FetchingStudents());
    } else {
      emit(FetchingStudents(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(StudentsFetched());
      return;
    }

    StudentsResponse? response = await _studentService.getBatchStudents(
      batchId: batchId,
      searchQuery: searchQuery,
      activeStatus: activeStatus,
      pageNo: page,
    );

    if (response?.status == 1) {
      nextPageUrl = response?.students?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }

      var items = response?.students?.data ?? [];
      activeStudentsCount = response?.activeStudentsCount;
      inactiveStudentsCount = response?.inactiveStudentsCount;
      List<StudentModel> tempStudents = [];

      for (var student in items) {
        var details = student.studentDetail;
        if (details != null) {
          for (var details in details) {
            StudentModel newStudent;
            if (activeStatus == null) {
              newStudent = StudentModel.fromEntity(student, details);
            } else {
              newStudent =
                  StudentModel.fromEntity1(student, details, batchId ?? 0);
            }

            tempStudents.add(newStudent);
          }
        }
      }

      _studentsMap.addEntries(tempStudents.map((e) => MapEntry(e.detailId, e)));

      emit(StudentsFetched(moreItems: nextPageUrl != null));
    } else {
      emit(StudentDetailsFailed(''));
    }
  }

  Future getStudentsForTrainer({
    required int trainerId,
    String? searchQuery,
    String? activeStatus,
    int? batchId,
    int? branchId,
    bool clean = false,
  }) async {
    if (state is FetchingStudents) {
      return;
    }
    if (clean) {
      page = 1;
      nextPageUrl = '';
      _studentsMap.clear();
      activeStudentsCount = null;
      inactiveStudentsCount = null;
      emit(FetchingStudents());
    } else {
      emit(FetchingStudents(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(StudentsFetched());
      return;
    }

    StudentsResponse? response = await _studentService.getStudentsForTrainer(
      trainerId: trainerId,
      batchId: batchId,
      branchId: branchId,
      searchQuery: searchQuery,
      activeStatus: activeStatus,
      pageNo: page,
    );

    if (response?.status == 1) {
      nextPageUrl = response?.students?.nextPageUrl;
      if (nextPageUrl != null && nextPageUrl.isNotNullOrEmpty()) {
        page++;
      } else {
        nextPageUrl = null;
      }

      var items = response?.students?.data ?? [];
      activeStudentsCount = response?.activeStudentsCount;
      inactiveStudentsCount = response?.inactiveStudentsCount;
      List<StudentModel> tempStudents = [];

      for (var student in items) {
        var details = student.studentDetail;
        if (details != null) {
          for (var details in details) {
            StudentModel newStudent;
            if (activeStatus == null) {
              newStudent = StudentModel.fromEntity(student, details);
            } else {
              newStudent =
                  StudentModel.fromEntity1(student, details, batchId ?? 0);
            }

            tempStudents.add(newStudent);
          }
        }
      }

      _studentsMap.addEntries(tempStudents.map((e) => MapEntry(e.detailId, e)));

      emit(StudentsFetched(moreItems: nextPageUrl != null));
    }
  }

  Future studentDetails(int? studentId) async {
    _student = null;
    emit(StudentDetailsFetching());
    StudentResponse? response = await _studentService.studentDetails(studentId);
    if (response?.status == 1) {
      _student = response?.student;
      emit(StudentDetailsFetched());
    } else {
      emit(
        StudentDetailsFailed(
            response?.message ?? 'Failed to fetch student details,'),
      );
    }
  }

  Future studentDetailsForTrainer(
      {required int trainerId, int? studentId}) async {
    _student = null;
    emit(StudentDetailsFetching());
    StudentResponse? response =
        await _studentService.studentDetailsForTrainer(trainerId, studentId);
    if (response?.status == 1) {
      _student = response?.student;
      emit(StudentDetailsFetched());
    } else {
      emit(
        StudentDetailsFailed(
            response?.message ?? 'Failed to fetch student details,'),
      );
    }
  }

  void insertStudent() {
    emit(StudentsFetched());
  }

  // this method will manipulate the local list to show the updates
  void updateStudentsList() {
    if (_student?.studentDetail != null) {
      for (var details in _student!.studentDetail!) {
        var newStudent = StudentModel.fromEntity(_student!, details);
        _studentsMap.update(
          _student?.id,
          (student) => newStudent,
          ifAbsent: () => newStudent,
        );
      }

      // updates the UI
      emit(StudentsFetched());
    }
  }

  Future getStudentBatches() async {
    emit(StudentBatchesFetching());
    StudentsBatchResponse? response = await _studentService.getStudentBatches(
      _student?.studentDetail?[0].id ?? tempStudent?.studentDetail?[0].id,
    );

    if (response?.status == 1) {
      var items =
          response?.batches?.map((e) => BatchModel.fromEntity(e)).toList() ??
              [];
      _batches = items;
      emit(StudentBatchesFetched());
    } else {
      emit(StudentBatchesFailed('Failed to fetch batches.'));
    }
  }

  Future getStudentAdminBatches({
    String? status,
    String? search,
    int? batchId,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      _batches.clear();
      emit(StudentBatchesFetched());
    } else {
      emit(StudentBatchesFetched());
    }

    emit(StudentBatchesFetching());
    StudentsBatchResponse? response = await _studentService.getStudentBatches(
      _student?.studentDetail?[0].id ?? tempStudent?.studentDetail?[0].id,
    );

    if (response?.status == 1) {
      var items =
          response?.batches?.map((e) => BatchModel.fromEntity(e)).toList() ??
              [];
      _batches = items;
      emit(StudentBatchesFetched());
    } else {
      emit(StudentBatchesFailed('Failed to fetch batches.'));
    }
  }

  Future getStudentBatchesForTrainer({required int trainerId}) async {
    emit(StudentBatchesFetching());
    StudentsBatchResponse? response =
        await _studentService.getStudentBatchesForTrainer(
            _student?.studentDetail?[0].id ?? tempStudent?.studentDetail?[0].id,
            trainerId);

    if (response?.status == 1) {
      var items =
          response?.batches?.map((e) => BatchModel.fromEntity(e)).toList() ??
              [];
      _batches = items;
      emit(StudentBatchesFetched());
    } else {
      emit(StudentBatchesFailed('Failed to fetch batches.'));
    }
  }

  Future getStudentBatchesForTrainers({
    required int trainerId,
    String? status,
    int? batchId,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      _batches.clear();
      emit(StudentBatchesFetched());
    } else {
      emit(StudentBatchesFetched());
    }

    emit(StudentBatchesFetching());
    StudentsBatchResponse? response =
        await _studentService.getStudentBatchesForTrainer(
            _student?.studentDetail?[0].id ?? tempStudent?.studentDetail?[0].id,
            trainerId);

    if (response?.status == 1) {
      var items =
          response?.batches?.map((e) => BatchModel.fromEntity(e)).toList() ??
              [];
      _batches = items;
      emit(StudentBatchesFetched());
    } else {
      emit(StudentBatchesFailed('Failed to fetch batches.'));
    }
  }

  Future removeStudentBatch(int? batchId, {String? date, reason}) async {
    emit(RemovingStudent());
    Common? common = await _studentService.removeStudentBatch(
      batchId,
      _student?.studentDetail?[0].id,
      date: date,
      reason: reason,
    );

    if (common?.status == 1) {
      getStudentBatches();
      emit(RemovedStudent());
    } else {
      emit(RemoveStudentFailed(common?.message ?? 'Failed to remove student'));
    }
  }

  Future removeStudentBatchForTrainer(int? batchId,
      {String? date, reason, required int trainerId}) async {
    emit(RemovingStudent());
    Common? common = await _studentService.removeStudentBatchforTrainer(
      trainerId: trainerId,
      batchId,
      _student?.studentDetail?[0].id,
      date: date,
      reason: reason,
    );

    if (common?.status == 1) {
      getStudentBatchesForTrainer(trainerId: trainerId);
      emit(RemovedStudent());
    } else {
      emit(RemoveStudentFailed(common?.message ?? 'Failed to remove student'));
    }
  }

  bool checkPhoneNumber(Contact contact) {
    String temp = (contact.phoneNumbers?.first ?? '').replaceAll(' ', '');
    if (RegExp(r'^\d+$').hasMatch(temp) ||
        (temp.startsWith('+') && RegExp(r'^\+\d+$').hasMatch(temp)) ||
        temp.length >= 10) {
      String prefix = temp.substring(0, temp.length - 10);
      if (prefix == "" || prefix == "0" || prefix == "+91" || prefix == "91") {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  String get10DigitsPhoneNumber(Contact contact) {
    String temp = (contact.phoneNumbers?.first ?? '').replaceAll(' ', '');
    String? lastTenDigits = temp.substring(temp.length - 10);
    return lastTenDigits;
  }
}
