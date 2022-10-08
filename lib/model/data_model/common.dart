// To parse this JSON data, do
//
//     final common = commonFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'common.freezed.dart';
part 'common.g.dart';

Common commonFromJson(String str) => Common.fromJson(json.decode(str));

String commonToJson(Common data) => json.encode(data.toJson());

@freezed
abstract class Common with _$Common {
  const factory Common({
    String? message,
    int? status,
  }) = _Common;

  factory Common.fromJson(Map<String, dynamic> json) => _$CommonFromJson(json);
}
