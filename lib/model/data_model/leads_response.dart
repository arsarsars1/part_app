// To parse this JSON data, do
//
//     final leadsResponse = leadsResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'leads_response.freezed.dart';
part 'leads_response.g.dart';

LeadsResponse leadsResponseFromJson(String str) =>
    LeadsResponse.fromJson(json.decode(str));

String leadsResponseToJson(LeadsResponse data) => json.encode(data.toJson());

@freezed
class LeadsResponse with _$LeadsResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LeadsResponse({
    int? status,
    Leads? leads,
  }) = _LeadsResponse;

  factory LeadsResponse.fromJson(Map<String, dynamic> json) =>
      _$LeadsResponseFromJson(json);
}

@freezed
class Leads with _$Leads {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Leads({
    int? currentPage,
    List<Lead>? data,
    String? firstPageUrl,
    int? from,
    dynamic nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
  }) = _Leads;

  factory Leads.fromJson(Map<String, dynamic> json) => _$LeadsFromJson(json);
}

@freezed
class Lead with _$Lead {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Lead({
    int? id,
    int? academyId,
    String? name,
    String? age,
    String? gender,
    String? profilePic,
    String? countryCode,
    String? mobileNo,
    dynamic whatsapp,
    int? branchId,
    int? batchId,
    String? leadStatus,
    String? assignedToType,
    int? assignedToId,
    DateTime? addedOn,
    DatumBranch? branch,
    Batch? batch,
    AssignedTo? assignedTo,
    List<FollowUp>? followUps,
  }) = _Lead;

  factory Lead.fromJson(Map<String, dynamic> json) => _$LeadFromJson(json);
}

@freezed
class AssignedTo with _$AssignedTo {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AssignedTo({
    int? id,
    String? name,
    List<BranchElement>? branches,
  }) = _AssignedTo;

  factory AssignedTo.fromJson(Map<String, dynamic> json) =>
      _$AssignedToFromJson(json);
}

@freezed
class BranchElement with _$BranchElement {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BranchElement({
    int? id,
    String? branchName,
    int? academyId,
    int? countryId,
    dynamic managerDetailId,
    int? stateId,
    int? districtId,
    String? address,
    int? pincode,
    String? currency,
    int? isActive,
    Pivot? pivot,
    Country? country,
    StateDetail? state,
    District? district,
    Timezone? timezone,
  }) = _BranchElement;

  factory BranchElement.fromJson(Map<String, dynamic> json) =>
      _$BranchElementFromJson(json);
}

@freezed
class Country with _$Country {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Country({
    int? id,
    String? name,
    String? currency,
    String? currencySymbol,
    String? currencyCode,
    String? timezone,
    String? currencySubUnit,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

@freezed
class District with _$District {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory District({
    int? id,
    String? districtName,
  }) = _District;

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
}

@freezed
class Pivot with _$Pivot {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Pivot({
    int? trainerDetailId,
    int? branchId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Pivot;

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);
}

@freezed
class StateDetail with _$StateDetail {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory StateDetail({
    int? id,
    String? stateName,
  }) = _StateDetail;

  factory StateDetail.fromJson(Map<String, dynamic> json) =>
      _$StateDetailFromJson(json);
}

@freezed
class Timezone with _$Timezone {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Timezone({
    int? id,
    String? timezone,
  }) = _Timezone;

  factory Timezone.fromJson(Map<String, dynamic> json) =>
      _$TimezoneFromJson(json);
}

@freezed
class Batch with _$Batch {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Batch({
    int? id,
    String? batchName,
  }) = _Batch;

  factory Batch.fromJson(Map<String, dynamic> json) => _$BatchFromJson(json);
}

@freezed
class DatumBranch with _$DatumBranch {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DatumBranch({
    int? id,
    String? branchName,
    int? stateId,
    int? districtId,
    StateDetail? state,
    District? district,
    dynamic timezone,
  }) = _DatumBranch;

  factory DatumBranch.fromJson(Map<String, dynamic> json) =>
      _$DatumBranchFromJson(json);
}

@freezed
class FollowUp with _$FollowUp {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FollowUp({
    int? id,
    int? leadId,
    String? assignedToType,
    int? assignedToId,
    DateTime? followUpDate,
    String? followUpTime,
    dynamic followUpComment,
    String? followUpStatus,
    AssignedTo? assignedTo,
  }) = _FollowUp;

  factory FollowUp.fromJson(Map<String, dynamic> json) =>
      _$FollowUpFromJson(json);
}
