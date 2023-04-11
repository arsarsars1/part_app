// To parse this JSON data, do
//
//     final studentsResponse = studentsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:part_app/model/data_model/batch_response.dart';

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
  }) = _StudentDetail;

  factory StudentDetail.fromJson(Map<String, dynamic> json) =>
      _$StudentDetailFromJson(json);
}
