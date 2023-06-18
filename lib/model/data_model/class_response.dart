// To parse this JSON data, do
//
//     final classResponse = classResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'class_response.freezed.dart';
part 'class_response.g.dart';

ClassResponse classResponseFromJson(String str) =>
    ClassResponse.fromJson(json.decode(str));

String classResponseToJson(ClassResponse data) => json.encode(data.toJson());

@freezed
class ClassResponse with _$ClassResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ClassResponse({
    int? status,
    List<Class>? classes,
  }) = _ClassResponse;

  factory ClassResponse.fromJson(Map<String, dynamic> json) =>
      _$ClassResponseFromJson(json);
}

@freezed
class Class with _$Class {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Class({
    String? startTime,
    String? endTime,
    bool? rescheduled,
    DateTime? oldDate,
    int? batchId,
    String? batchName,
    int? activeStudentsCount,
    int? inactiveStudentsCount,
    String? courseName,
    String? subjectName,
    String? branchName,
    String? trainers,
  }) = _Class;

  factory Class.fromJson(Map<String, dynamic> json) => _$ClassFromJson(json);
}
