// To parse this JSON data, do
//
//     final attendenceClassDetailsesOfMonth = attendenceClassDetailsesOfMonthFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:part_app/model/data_model/models.dart';
import 'dart:convert';

import 'package:part_app/model/data_model/students_response.dart';

part 'attendence_classes_of_month.freezed.dart';
part 'attendence_classes_of_month.g.dart';

AttendenceClassDetailsesOfMonth attendenceClassDetailsesOfMonthFromJson(String str) =>
    AttendenceClassDetailsesOfMonth.fromJson(json.decode(str));

String attendenceClassDetailsesOfMonthToJson(AttendenceClassDetailsesOfMonth data) =>
    json.encode(data.toJson());

@freezed
class AttendenceClassDetailsesOfMonth with _$AttendenceClassDetailsesOfMonth {
  const factory AttendenceClassDetailsesOfMonth({
    int? status,
    List<ClassDetails>? classes,
    Batch? batch,
  }) = _AttendenceClassDetailsesOfMonth;

  factory AttendenceClassDetailsesOfMonth.fromJson(Map<String, dynamic> json) =>
      _$AttendenceClassDetailsesOfMonthFromJson(json);
}

@freezed
class Batch with _$Batch {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Batch({
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
    int? activeStudentsCount,
    int? inactiveStudentsCount,
    List<BatchDetail>? batchDetail,
    List<Trainer>? trainers,
    Course? course,
    Subject? subject,
    Branch? branch,
    List<Student>? students,
  }) = _Batch;

  factory Batch.fromJson(Map<String, dynamic> json) => _$BatchFromJson(json);
}

@freezed
class BatchDetail with _$BatchDetail {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BatchDetail({
    int? id,
    int? batchId,
    int? day,
    String? startTime,
    String? endTime,
    int? isActive,
  }) = _BatchDetail;

  factory BatchDetail.fromJson(Map<String, dynamic> json) =>
      _$BatchDetailFromJson(json);
}

@freezed
class Branch with _$Branch {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Branch({
    int? id,
    String? branchName,
    String? address,
    int? pincode,
    String? currency,
    int? stateId,
    int? districtId,
    int? countryId,
    Country? country,
    StateDetails? state,
    District? district,
    Timezone? timezone,
  }) = _Branch;

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);
}

@freezed
class Country with _$Country {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Country({
    int? id,
    String? name,
    String? currency,
    String? currencySymbol,
    String? currencyCode,
    String? timezone,
    String? currencySubUnit,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

@freezed
class District with _$District {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory District({
    int? id,
    String? districtName,
  }) = _District;

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
}

@freezed
class StateDetails with _$StateDetails {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory StateDetails({
    int? id,
    String? stateName,
  }) = _StateDetails;

  factory StateDetails.fromJson(Map<String, dynamic> json) => _$StateDetailsFromJson(json);
}

@freezed
class Timezone with _$Timezone {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Timezone({
    int? id,
    String? timezone,
  }) = _Timezone;

  factory Timezone.fromJson(Map<String, dynamic> json) =>
      _$TimezoneFromJson(json);
}

@freezed
class Course with _$Course {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Course({
    int? id,
    int? academyTypeId,
    String? courseName,
    int? isActive,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}

@freezed
class Subject with _$Subject {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Subject({
    int? id,
    int? courseId,
    String? subjectName,
    int? isActive,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}

@freezed
class ClassDetails with _$ClassDetails {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ClassDetails({
    String? startTime,
    String? endTime,
    DateTime? date,
    bool? rescheduled,
    bool? conducted,
  }) = _ClassDetails;

  factory ClassDetails.fromJson(Map<String, dynamic> json) => _$ClassDetailsFromJson(json);
}
