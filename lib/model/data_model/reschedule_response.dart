// To parse this JSON data, do
//
//     final rescheduleResponse = rescheduleResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:part_app/model/data_model/batch_response.dart';

part 'reschedule_response.freezed.dart';
part 'reschedule_response.g.dart';

RescheduleResponse rescheduleResponseFromJson(String str) =>
    RescheduleResponse.fromJson(json.decode(str));

String rescheduleResponseToJson(RescheduleResponse data) =>
    json.encode(data.toJson());

@freezed
abstract class RescheduleResponse with _$RescheduleResponse {
  const factory RescheduleResponse({
    int? status,
    @JsonKey(name: 'rescheduled-classes')
        RescheduledClasses? rescheduledClasses,
  }) = _RescheduleResponse;

  factory RescheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$RescheduleResponseFromJson(json);
}

@freezed
abstract class RescheduledClasses with _$RescheduledClasses {
  const factory RescheduledClasses({
    int? currentPage,
    @JsonKey(name: 'data') List<BatchDetail>? batchDetails,
    String? firstPageUrl,
    int? from,
    String? path,
    int? perPage,
    int? to,
  }) = _RescheduledClasses;

  factory RescheduledClasses.fromJson(Map<String, dynamic> json) =>
      _$RescheduledClassesFromJson(json);
}
