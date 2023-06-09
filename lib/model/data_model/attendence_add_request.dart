// To parse this JSON data, do
//
//     final attendenceAddRequest = attendenceAddRequestFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'attendence_add_request.freezed.dart';
part 'attendence_add_request.g.dart';

AttendenceAddRequest attendenceAddRequestFromJson(String str) =>
    AttendenceAddRequest.fromJson(json.decode(str));

String attendenceAddRequestToJson(AttendenceAddRequest data) =>
    json.encode(data.toJson());

@freezed
class AttendenceAddRequest with _$AttendenceAddRequest {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AttendenceAddRequest({
    DateTime? conductedOn,
    String? startTime,
    String? endTime,
    // Attendance? attendance,
    @JsonKey(name: 'attendance[]') List<String>? attendance,
  }) = _AttendenceAddRequest;

  factory AttendenceAddRequest.fromJson(Map<String, dynamic> json) =>
      _$AttendenceAddRequestFromJson(json);
}

@freezed
class Attendance with _$Attendance {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Attendance({
    int? studentDetailId,
    int? isPresent,
  }) = _Attendance;

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);
}
