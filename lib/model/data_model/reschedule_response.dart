// To parse this JSON data, do
//
//     final rescheduleResponse = rescheduleResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'reschedule_response.freezed.dart';
part 'reschedule_response.g.dart';

RescheduleResponse rescheduleResponseFromJson(String str) =>
    RescheduleResponse.fromJson(json.decode(str));

String rescheduleResponseToJson(RescheduleResponse data) =>
    json.encode(data.toJson());

@freezed
class RescheduleResponse with _$RescheduleResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RescheduleResponse({
    int? status,
    List<RescheduledClass>? rescheduledClasses,
  }) = _RescheduleResponse;

  factory RescheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$RescheduleResponseFromJson(json);
}

@freezed
abstract class RescheduledClasses with _$RescheduledClasses {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RescheduledClasses({
    int? currentPage,
    List<RescheduledClass>? data,
    String? firstPageUrl,
    String? nextPageUrl,
    int? from,
    String? path,
    int? perPage,
    int? to,
  }) = _RescheduledClasses;

  factory RescheduledClasses.fromJson(Map<String, dynamic> json) =>
      _$RescheduledClassesFromJson(json);
}

@freezed
class RescheduledClass with _$RescheduledClass {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RescheduledClass({
    int? id,
    int? batchId,
    DateTime? oldDate,
    String? oldStartTime,
    String? oldEndTime,
    DateTime? newDate,
    String? newStartTime,
    String? newEndTime,
    String? rescheduledByType,
    int? rescheduledById,
    dynamic cancelledDate,
    dynamic cancelledStartTime,
    dynamic cancelledEndTime,
  }) = _RescheduledClass;

  factory RescheduledClass.fromJson(Map<String, dynamic> json) =>
      _$RescheduledClassFromJson(json);
}
