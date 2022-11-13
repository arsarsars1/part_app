// To parse this JSON data, do
//
//     final batchRequest = batchRequestFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'batch_request.freezed.dart';
part 'batch_request.g.dart';

BatchRequest batchRequestFromJson(String str) =>
    BatchRequest.fromJson(json.decode(str));

String batchRequestToJson(BatchRequest data) => json.encode(data.toJson());

@freezed
abstract class BatchRequest with _$BatchRequest {
  const factory BatchRequest({
    String? batchName,
    int? courseId,
    int? subjectId,
    String? batchStatus,
    int? feeAmount,
    @JsonKey(name: "trainers[]") List<int>? trainers,
    @JsonKey(name: "days[]") List<Days>? days,
  }) = _BatchRequest;

  factory BatchRequest.fromJson(Map<String, dynamic> json) =>
      _$BatchRequestFromJson(json);
}

@freezed
abstract class Days with _$Days {
  const factory Days({
    int? day,
    String? startTime,
    String? endTime,
  }) = _Days;

  factory Days.fromJson(Map<String, dynamic> json) => _$DaysFromJson(json);
}
