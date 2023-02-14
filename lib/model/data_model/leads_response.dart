// To parse this JSON data, do
//
//     final leadsResponse = leadsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:part_app/model/data_model/branch_response.dart';

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
    String? nextPageUrl,
    String? path,
    int? perPage,
    String? prevPageUrl,
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
    String? countryCode,
    String? mobileNo,
    String? whatsapp,
    int? branchId,
    int? batchId,
    String? leadStatus,
    String? assignedToType,
    int? assignedToId,
    Branch? branch,
    Batch? batch,
    List<FollowUp>? followUps,
  }) = _Lead;

  factory Lead.fromJson(Map<String, dynamic> json) => _$LeadFromJson(json);
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
class FollowUp with _$FollowUp {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FollowUp({
    int? id,
    int? leadId,
    String? assignedToType,
    int? assignedToId,
    DateTime? followUpDate,
    String? followUpTime,
    String? followUpComment,
    String? followUpStatus,
    AssignedTo? assignedTo,
  }) = _FollowUp;

  factory FollowUp.fromJson(Map<String, dynamic> json) =>
      _$FollowUpFromJson(json);
}

@freezed
class AssignedTo with _$AssignedTo {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AssignedTo({
    int? id,
    String? name,
    List<Branch>? branches,
  }) = _AssignedTo;

  factory AssignedTo.fromJson(Map<String, dynamic> json) =>
      _$AssignedToFromJson(json);
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
