import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/batch_model.dart';
import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/student_model.dart';
import 'package:part_app/model/data_model/student_request.dart';
import 'package:part_app/model/data_model/students_response.dart';
import 'package:part_app/model/service/admin/student.dart';
import 'package:part_app/view_model/cubits.dart';
import 'package:part_app/view_model/utils.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());

  final _studentService = StudentService();

  StudentRequest _studentRequest = const StudentRequest();

  StudentRequest get studentRequest => _studentRequest;

  Student? _student;

  Student? get student => _student;

  Map<int?, Student>? _studentsMap = {};

  List<Student>? get students => _studentsMap?.values.toList();

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

  void setProfilePic(File file) {
    _profilePic = file;
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

  Future updateProfilePic({required File profilePic}) async {
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
    );
    if (response?.status == 1) {
      _student = response?.student;
      String url =
          '${F.baseUrl}/admin/images/student/${_student?.studentDetail?[0].id}'
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
    _studentsMap?.clear();
    emit(StudentInitial());
  }

  Future getStudents({
    String? searchQuery,
    String? activeStatus,
    int? batchId,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      _studentsMap?.clear();
      emit(FetchingStudents());
    } else {
      emit(FetchingStudents(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(StudentsFetched());
      return;
    }

    StudentsResponse? response = await _studentService.getStudents(
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

      List<StudentModel> tempStudents = [];

      for (var student in items) {
        var details = student.studentDetail;
        if (details != null) {
          for (var details in details) {
            var newStudent = StudentModel.fromEntity(student, details);
            tempStudents.add(newStudent);
          }
        }
      }

      print(tempStudents);
      print('STUDENT COUNT ${tempStudents.length}');

      _studentsMap?.addEntries(items.map((e) => MapEntry(e.id, e)));

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

  void insertStudent() {
    emit(StudentsFetched());
  }

  void updateStudentsList() {
    // int? index = _students?.indexWhere((element) => element.id == _student?.id);
    // int? index = _studentsMap?.keys
    //     .toList()
    //     .indexWhere((element) => element == _student?.id);

    _studentsMap?.update(
      _student?.id,
      (student) => _student!,
      ifAbsent: () => _student!,
    );

    emit(StudentsFetched());
  }

  Future getStudentBatches() async {
    emit(StudentBatchesFetching());
    StudentsBatchResponse? response = await _studentService.getStudentBatches(
      _student?.studentDetail?[0].id,
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

  Future removeStudentBatch(int? batchId,
      {required String date, reason}) async {
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
}
