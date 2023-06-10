// To parse this JSON data, do
//
//     final batchResponse = batchResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/model/data_model/course.dart';

import 'trainer_response.dart';

part 'batch_response.freezed.dart';
part 'batch_response.g.dart';

BatchResponse batchResponseFromJson(String str) =>
    BatchResponse.fromJson(json.decode(str));

StudentsBatchResponse studentBatchResponseFromJson(String str) =>
    StudentsBatchResponse.fromJson(json.decode(str));

String batchResponseToJson(BatchResponse data) => json.encode(data.toJson());

@freezed
abstract class BatchResponse with _$BatchResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BatchResponse({
    int? status,
    Datum? batches,
    Batch? batch,
  }) = _BatchResponse;

  factory BatchResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchResponseFromJson(json);
}

@freezed
abstract class StudentsBatchResponse with _$StudentsBatchResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory StudentsBatchResponse({
    int? status,
    List<Batch>? batches,
  }) = _StudentsBatchResponse;

  factory StudentsBatchResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentsBatchResponseFromJson(json);
}

@freezed
abstract class Datum with _$Datum {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Datum({
    int? currentPage,
    required List<Batch> data,
    int? from,
    int? perPage,
    String? nextPageUrl,
    int? to,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
abstract class Batch with _$Batch {
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
    int? activeStudentsCount,
    int? inactiveStudentsCount,
    int? admissionFees,
    int? isActive,
    PivotClass? pivot,
    List<BatchDetail>? batchDetail,
    List<Trainer>? trainers,
    Course? course,
    Course? subject,
    Branch? branch,
  }) = _Batch;

  factory Batch.fromJson(Map<String, dynamic> json) => _$BatchFromJson(json);
}

@freezed
abstract class BatchDetail with _$BatchDetail {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BatchDetail({
    int? id,
    int? batchId,
    int? day,
    DateTime? previousDate,
    DateTime? newDate,
    String? startTime,
    String? endTime,
    int? isActive,
  }) = _BatchDetail;

  factory BatchDetail.fromJson(Map<String, dynamic> json) =>
      _$BatchDetailFromJson(json);
}

@freezed
abstract class PivotClass with _$PivotClass {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PivotClass({
    int? studentDetailId,
    int? batchId,
    dynamic noOfClasses,
    String? feeType,
    int? feeAmount,
    int? admissionFees,
    int? cycle,
    DateTime? doj,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PivotClass;

  factory PivotClass.fromJson(Map<String, dynamic> json) =>
      _$PivotClassFromJson(json);
}
