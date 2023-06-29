// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:part_app/model/data_model/branch_response.dart';

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
    Datum? managers,
    Manager? manager,
  }) = _ManagerResponse;

  factory ManagerResponse.fromJson(Map<String, dynamic> json) =>
      _$ManagerResponseFromJson(json);
}

@freezed
abstract class Datum with _$Datum {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Datum({
    int? currentPage,
    required List<Manager> data,
    int? from,
    int? perPage,
    int? to,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
abstract class Manager with _$Manager {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Manager({
    required int id,
    int? userId,
    int? academyId,
    String? gender,
    String? name,
    String? mobileNo,
    String? countryCode,
    String? upiId,
    DateTime? dob,
    DateTime? doj,
    String? whatsappNo,
    String? email,
    String? salaryType,
    int? salaryDate,
    int? salaryAmount,
    String? profilePic,
    String? profilePicType,
    String? address,
    String? document_1,
    String? document_2,
    int? isActive,
    List<Manager>? managerDetail,
    List<Branch>? branches,
  }) = _Manager;

  factory Manager.fromJson(Map<String, dynamic> json) =>
      _$ManagerFromJson(json);
}
