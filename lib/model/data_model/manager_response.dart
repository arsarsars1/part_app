import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/model/data_model/user_response.dart';

part 'manager_response.freezed.dart';
part 'manager_response.g.dart';

ManagerResponse managerResponseFromJson(String str) =>
    ManagerResponse.fromJson(json.decode(str));

String managerResponseToJson(ManagerResponse data) =>
    json.encode(data.toJson());

@freezed
abstract class ManagerResponse with _$ManagerResponse {
  const factory ManagerResponse({
    required int status,
    List<Manager>? managers,
    Manager? manager,
  }) = _ManagerResponse;

  factory ManagerResponse.fromJson(Map<String, dynamic> json) =>
      _$ManagerResponseFromJson(json);
}

@freezed
abstract class Manager with _$Manager {
  const factory Manager({
    required int id,
    int? userId,
    int? academyId,
    String? gender,
    DateTime? dob,
    DateTime? doj,
    String? whatsappNo,
    String? email,
    String? salaryType,
    int? salaryDate,
    String? salaryAmount,
    String? profilePic,
    String? profilePicType,
    int? isActive,
    User? user,
    List<Branch>? branches,
  }) = _Manager;

  factory Manager.fromJson(Map<String, dynamic> json) =>
      _$ManagerFromJson(json);
}
