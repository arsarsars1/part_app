// To parse this JSON data, do
//
//     final classLinkResponse = classLinkResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'class_link_response.freezed.dart';
part 'class_link_response.g.dart';

ClassLinkResponse classLinkResponseFromJson(String str) =>
    ClassLinkResponse.fromJson(json.decode(str));

String classLinkResponseToJson(ClassLinkResponse data) =>
    json.encode(data.toJson());

@freezed
class ClassLinkResponse with _$ClassLinkResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ClassLinkResponse({
    int? status,
    List<ClassLink>? classLinks,
  }) = _ClassLinkResponse;

  factory ClassLinkResponse.fromJson(Map<String, dynamic> json) =>
      _$ClassLinkResponseFromJson(json);
}

@freezed
class ClassLink with _$ClassLink {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ClassLink({
    int? id,
    int? batchId,
    String? link,
    String? service,
    DateTime? classDate,
    String? startTime,
    String? endTime,
    String? addedByType,
    int? addedById,
    String? batchName,
    String? branchName,
    String? courseName,
    String? subjectName,
  }) = _ClassLink;

  factory ClassLink.fromJson(Map<String, dynamic> json) =>
      _$ClassLinkFromJson(json);
}
