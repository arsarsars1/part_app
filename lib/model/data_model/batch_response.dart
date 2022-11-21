// To parse this JSON data, do
//
//     final batchResponse = batchResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'trainer_response.dart';

part 'batch_response.freezed.dart';
part 'batch_response.g.dart';

BatchResponse batchResponseFromJson(String str) =>
    BatchResponse.fromJson(json.decode(str));

String batchResponseToJson(BatchResponse data) => json.encode(data.toJson());

@freezed
abstract class BatchResponse with _$BatchResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BatchResponse({
    int? status,
    List<Batch>? batches,
  }) = _BatchResponse;

  factory BatchResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchResponseFromJson(json);
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
    int? admissionFees,
    int? isActive,
    List<BatchDetail>? batchDetail,
    List<Trainer>? trainers,
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
    String? startTime,
    String? endTime,
    int? isActive,
  }) = _BatchDetail;

  factory BatchDetail.fromJson(Map<String, dynamic> json) =>
      _$BatchDetailFromJson(json);
}
