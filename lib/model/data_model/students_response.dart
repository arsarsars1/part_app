// To parse this JSON data, do
//
//     final studentsResponse = studentsResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:part_app/model/data_model/batch_response.dart';
import 'package:part_app/model/data_model/user_response.dart';

part 'students_response.freezed.dart';
part 'students_response.g.dart';

StudentsResponse studentsResponseFromJson(String str) =>
    StudentsResponse.fromJson(json.decode(str));

String studentsResponseToJson(StudentsResponse data) =>
    json.encode(data.toJson());

@freezed
abstract class StudentsResponse with _$StudentsResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory StudentsResponse({
    int? status,
    int? activeStudentsCount,
    int? inactiveStudentsCount,
    Students? students,
  }) = _StudentsResponse;

  factory StudentsResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentsResponseFromJson(json);
}

@freezed
abstract class Students with _$Students {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Students({
    int? currentPage,
    List<Student>? data,
    String? firstPageUrl,
    String? nextPageUrl,
    int? from,
    String? path,
    int? perPage,
    int? to,
  }) = _Students;

  factory Students.fromJson(Map<String, dynamic> json) =>
      _$StudentsFromJson(json);
}

StudentResponse studentResponseFromJson(String str) =>
    StudentResponse.fromJson(json.decode(str));

String studentResponseToJson(StudentResponse data) =>
    json.encode(data.toJson());

@freezed
abstract class StudentResponse with _$StudentResponse {
  const factory StudentResponse({
    int? status,
    Student? student,
    String? message,
  }) = _StudentResponse;

  factory StudentResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentResponseFromJson(json);
}

@freezed
abstract class Student with _$Student {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Student({
    int? id,
    String? countryCode,
    String? mobileNo,
    int? isActive,
    String? mobileUnique,
    List<StudentDetail>? studentDetail,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
}

@freezed
abstract class StudentDetail with _$StudentDetail {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory StudentDetail({
    int? id,
    String? name,
    String? parentName,
    int? userId,
    int? academyId,
    String? gender,
    DateTime? dob,
    DateTime? doj,
    String? email,
    String? whatsappNo,
    String? address,
    String? profilePic,
    int? isActive,
    List<Batch>? batches,
    PivotClass? pivot,
    Academy? academy,
    List<DiscontinuedBatch>? discontinuedBatches,
  }) = _StudentDetail;

  factory StudentDetail.fromJson(Map<String, dynamic> json) =>
      _$StudentDetailFromJson(json);
}

@freezed
class DiscontinuedBatch with _$DiscontinuedBatch {
  const factory DiscontinuedBatch({
    int? id,
    String? batchName,
    int? academyId,
    int? branchId,
    int? courseId,
    int? subjectId,
    String? batchStatus,
    int? feeAmount,
    int? admissionFees,
    String? shareToken,
    int? isActive,
    PivotClass? pivot,
    Course1? course,
    Subject1? subject,
  }) = _DiscontinuedBatch;

  factory DiscontinuedBatch.fromJson(Map<String, dynamic> json) =>
      _$DiscontinuedBatchFromJson(json);
}

@freezed
class Course1 with _$Course1 {
  const factory Course1({
    int? id,
    int? academyTypeId,
    String? courseName,
    int? isActive,
  }) = _Course1;

  factory Course1.fromJson(Map<String, dynamic> json) =>
      _$Course1FromJson(json);
}

@freezed
class Subject1 with _$Subject1 {
  const factory Subject1({
    int? id,
    int? courseId,
    String? subjectName,
    int? isActive,
  }) = _Subject1;

  factory Subject1.fromJson(Map<String, dynamic> json) =>
      _$Subject1FromJson(json);
}
