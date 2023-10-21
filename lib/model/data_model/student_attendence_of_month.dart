// To parse this JSON data, do
//
//     final studentAttendenceOfMonth = studentAttendenceOfMonthFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'student_attendence_of_month.freezed.dart';
part 'student_attendence_of_month.g.dart';

StudentAttendenceOfMonth studentAttendenceOfMonthFromJson(String str) =>
    StudentAttendenceOfMonth.fromJson(json.decode(str));

String studentAttendenceOfMonthToJson(StudentAttendenceOfMonth data) =>
    json.encode(data.toJson());

@freezed
class StudentAttendenceOfMonth with _$StudentAttendenceOfMonth {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory StudentAttendenceOfMonth({
    int? status,
    List<StudentAttendances>? studentAttendance,
    int? presentCount,
    int? absentCount,
  }) = _StudentAttendenceOfMonth;

  factory StudentAttendenceOfMonth.fromJson(Map<String, dynamic> json) =>
      _$StudentAttendenceOfMonthFromJson(json);
}

@freezed
class StudentAttendances with _$StudentAttendances {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory StudentAttendances({
    int? id,
    int? conductedClassId,
    int? studentDetailId,
    String? feeType,
    int? cycle,
    int? isPresent,
    ConductedClasses? conductedClass,
  }) = _StudentAttendances;

  factory StudentAttendances.fromJson(Map<String, dynamic> json) =>
      _$StudentAttendancesFromJson(json);
}

@freezed
class ConductedClasses with _$ConductedClasses {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ConductedClasses({
    int? id,
    int? batchId,
    String? takenByType,
    int? takenById,
    String? updatedByType,
    int? updatedById,
    DateTime? conductedOn,
    String? startTime,
    String? endTime,
    DateTime? createdAt,
    DateTime? updatedAt,
    By? takenBy,
    By? updatedBy,
  }) = _ConductedClasses;

  factory ConductedClasses.fromJson(Map<String, dynamic> json) =>
      _$ConductedClassesFromJson(json);
}

@freezed
class By with _$By {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory By({
    int? id,
    String? name,
  }) = _By;

  factory By.fromJson(Map<String, dynamic> json) => _$ByFromJson(json);
}
