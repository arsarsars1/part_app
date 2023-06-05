// To parse this JSON data, do
//
//     final attendenceTaken = attendenceTakenFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'attendence_taken.freezed.dart';
part 'attendence_taken.g.dart';

AttendenceTaken attendenceTakenFromJson(String str) =>
    AttendenceTaken.fromJson(json.decode(str));

String attendenceTakenToJson(AttendenceTaken data) =>
    json.encode(data.toJson());

@freezed
class AttendenceTaken with _$AttendenceTaken {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AttendenceTaken({
    ConductedClassDetails? conductedClass,
    int? status,
  }) = _AttendenceTaken;

  factory AttendenceTaken.fromJson(Map<String, dynamic> json) =>
      _$AttendenceTakenFromJson(json);
}

@freezed
class ConductedClassDetails with _$ConductedClassDetails {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ConductedClassDetails({
    int? id,
    int? batchId,
    String? takenByType,
    int? takenById,
    dynamic? updatedByType,
    dynamic? updatedById,
    DateTime? conductedOn,
    String? startTime,
    String? endTime,
    DateTime? createdAt,
    DateTime? updatedAt,
    TakenBy? takenBy,
    dynamic? updatedBy,
    List<AttendanceDetails>? attendances,
  }) = _ConductedClassDetails;

  factory ConductedClassDetails.fromJson(Map<String, dynamic> json) =>
      _$ConductedClassDetailsFromJson(json);
}

@freezed
class AttendanceDetails with _$AttendanceDetails {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AttendanceDetails({
    int? id,
    int? conductedClassId,
    int? studentDetailId,
    String? feeType,
    int? cycle,
    int? isPresent,
    StudentDetail? studentDetail,
  }) = _AttendanceDetails;

  factory AttendanceDetails.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDetailsFromJson(json);
}

@freezed
class StudentDetail with _$StudentDetail {
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
  }) = _StudentDetail;

  factory StudentDetail.fromJson(Map<String, dynamic> json) =>
      _$StudentDetailFromJson(json);
}

@freezed
class TakenBy with _$TakenBy {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TakenBy({
    int? id,
    String? name,
  }) = _TakenBy;

  factory TakenBy.fromJson(Map<String, dynamic> json) =>
      _$TakenByFromJson(json);
}
