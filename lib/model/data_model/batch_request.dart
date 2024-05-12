// To parse this JSON data, do
//
//     final batchRequest = batchRequestFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'batch_request.freezed.dart';
part 'batch_request.g.dart';

BatchRequest batchRequestFromJson(String str) =>
    BatchRequest.fromJson(json.decode(str));

String batchRequestToJson(BatchRequest data) => json.encode(data.toJson());

@freezed
abstract class BatchRequest with _$BatchRequest {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BatchRequest({
    String? batchName,
    int? branchId,
    int? courseId,
    int? subjectId,
    int? retainStudents,
    String? batchStatus,
    dynamic feeAmount,
    dynamic admissionFees,
    @JsonKey(name: 'trainers[]') dynamic trainers,
    @JsonKey(name: 'days[]') List<String>? days,
    @JsonKey(name: 'students[]') List<String>? students,
  }) = _BatchRequest;

  factory BatchRequest.fromJson(Map<String, dynamic> json) =>
      _$BatchRequestFromJson(json);
}

@freezed
abstract class Days with _$Days {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Days({
    int? day,
    String? startTime,
    String? endTime,
  }) = _Days;

  factory Days.fromJson(Map<String, dynamic> json) => _$DaysFromJson(json);
}

@freezed
abstract class StudentsData with _$StudentsData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory StudentsData({
    String? name,
    String? mobileNo,
  }) = _StudentsData;

  factory StudentsData.fromJson(Map<String, dynamic> json) =>
      _$StudentsDataFromJson(json);
}
