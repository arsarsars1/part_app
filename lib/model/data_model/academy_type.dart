// To parse this JSON data, do
//
//     final academyType = academyTypeFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'academy_type.freezed.dart';
part 'academy_type.g.dart';

List<AcademyType> academyTypeFromJson(String str) => List<AcademyType>.from(
    json.decode(str).map((x) => AcademyType.fromJson(x)));

String academyTypeToJson(List<AcademyType> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class AcademyType with _$AcademyType {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AcademyType({
    required int id,
    required String academyType,
  }) = _AcademyType;

  factory AcademyType.fromJson(Map<String, dynamic> json) =>
      _$AcademyTypeFromJson(json);
}
