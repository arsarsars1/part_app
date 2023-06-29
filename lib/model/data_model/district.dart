// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'district.freezed.dart';
part 'district.g.dart';

List<District> districtFromJson(String str) =>
    List<District>.from(json.decode(str).map((x) => District.fromJson(x)));

String districtToJson(List<District> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class District with _$District {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory District({
    String? message,
    required int id,
    String? districtName,
    String? stateName,
  }) = _District;

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
}
