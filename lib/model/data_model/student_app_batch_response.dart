// To parse this JSON data, do
//
//     final studentAppBatchResponse = studentAppBatchResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'student_app_batch_response.freezed.dart';
part 'student_app_batch_response.g.dart';

StudentAppBatchResponse studentAppBatchResponseFromJson(String str) =>
    StudentAppBatchResponse.fromJson(json.decode(str));

String studentAppBatchResponseToJson(StudentAppBatchResponse data) =>
    json.encode(data.toJson());

@freezed
class StudentAppBatchResponse with _$StudentAppBatchResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory StudentAppBatchResponse({
    String? branchName,
    List<StudentAppBatchDetail>? batches,
    int? status,
  }) = _StudentAppBatchResponse;

  factory StudentAppBatchResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentAppBatchResponseFromJson(json);
}

@freezed
class StudentAppBatchDetail with _$StudentAppBatchDetail {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory StudentAppBatchDetail({
    int? id,
    String? batchName,
    int? academyId,
    int? branchId,
    int? courseId,
    int? subjectId,
    String? batchStatus,
    int? feeAmount,
    int? admissionFees,
    int? isActive,
    AdminDetail? adminDetail,
    List<StudentAppBatchInDetail>? batchDetail,
    List<Trainer>? trainers,
    CourseDetail? course,
    Subject? subject,
    Branch? branch,
    List<StudentDetail>? students,
  }) = _StudentAppBatchDetail;

  factory StudentAppBatchDetail.fromJson(Map<String, dynamic> json) =>
      _$StudentAppBatchDetailFromJson(json);
}

@freezed
class AdminDetail with _$AdminDetail {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AdminDetail({
    int? id,
    String? name,
    int? userId,
    String? profilePic,
    String? whatsappNo,
    String? email,
    String? gender,
    DateTime? dob,
    DateTime? doj,
    int? isActive,
  }) = _AdminDetail;

  factory AdminDetail.fromJson(Map<String, dynamic> json) =>
      _$AdminDetailFromJson(json);
}

@freezed
class StudentAppBatchInDetail with _$StudentAppBatchInDetail {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory StudentAppBatchInDetail({
    int? id,
    int? batchId,
    int? day,
    String? startTime,
    String? endTime,
  }) = _StudentAppBatchInDetail;

  factory StudentAppBatchInDetail.fromJson(Map<String, dynamic> json) =>
      _$StudentAppBatchInDetailFromJson(json);
}

@freezed
class Branch with _$Branch {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Branch({
    int? id,
    String? branchName,
    int? academyId,
  }) = _Branch;

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);
}

@freezed
class CourseDetail with _$CourseDetail {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CourseDetail({
    int? id,
    String? courseName,
  }) = _CourseDetail;

  factory CourseDetail.fromJson(Map<String, dynamic> json) =>
      _$CourseDetailFromJson(json);
}

@freezed
class StudentDetail with _$StudentDetail {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory StudentDetail({
    String? name,
    int? feeAmount,
    String? feeType,
    int? admissionFees,
  }) = _StudentDetail;

  factory StudentDetail.fromJson(Map<String, dynamic> json) =>
      _$StudentDetailFromJson(json);
}

@freezed
class Subject with _$Subject {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Subject({
    int? id,
    String? subjectName,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}

@freezed
class Trainer with _$Trainer {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Trainer({
    String? name,
    String? profilePic,
  }) = _Trainer;

  factory Trainer.fromJson(Map<String, dynamic> json) =>
      _$TrainerFromJson(json);
}
