// To parse this JSON data, do
//
//     final branchManagerResponse = branchManagerResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:part_app/model/data_model/user_response.dart';

part 'branch_manager_response.freezed.dart';
part 'branch_manager_response.g.dart';

BranchManagerResponse branchManagerResponseFromJson(String str) =>
    BranchManagerResponse.fromJson(json.decode(str));

String branchManagerResponseToJson(BranchManagerResponse data) =>
    json.encode(data.toJson());

@freezed
class BranchManagerResponse with _$BranchManagerResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BranchManagerResponse({
    int? id,
    String? name,
    int? userId,
    int? academyId,
    String? gender,
    DateTime? dob,
    DateTime? doj,
    String? whatsappNo,
    String? email,
    dynamic upiId,
    String? address,
    int? salaryDate,
    int? salaryAmount,
    String? profilePic,
    dynamic document1,
    dynamic document2,
    int? isActive,
    Academy? academy,
  }) = _BranchManagerResponse;

  factory BranchManagerResponse.fromJson(Map<String, dynamic> json) =>
      _$BranchManagerResponseFromJson(json);
}
