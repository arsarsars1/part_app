import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:part_app/model/data_model/country.dart';
import 'package:part_app/model/data_model/district.dart';
import 'package:part_app/model/data_model/manager_response.dart';

part 'branch_response.freezed.dart';
part 'branch_response.g.dart';

BranchResponse branchResponseFromJson(String str) =>
    BranchResponse.fromJson(json.decode(str));

String branchResponseToJson(BranchResponse data) => json.encode(data.toJson());

@freezed
abstract class BranchResponse with _$BranchResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BranchResponse({
    required int status,
    List<Branch>? branches,
    Branch? branch,
  }) = _BranchResponse;

  factory BranchResponse.fromJson(Map<String, dynamic> json) =>
      _$BranchResponseFromJson(json);
}

@freezed
abstract class Branch with _$Branch {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Branch({
    required int id,
    String? branchName,
    int? academyId,
    int? countryId,
    int? stateId,
    int? districtId,
    String? address,
    int? pincode,
    String? currency,
    int? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    Country? country,
    District? state,
    District? district,
    Manager? managerDetail,
  }) = _Branch;

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);
}
//
// @freezed
// abstract class ManagerDetail with _$ManagerDetail {
//   @JsonSerializable(fieldRename: FieldRename.snake)
//   const factory ManagerDetail({
//     int? id,
//     int? userId,
//     String? email,
//     User? user,
//   }) = _ManagerDetail;
//
//   factory ManagerDetail.fromJson(Map<String, dynamic> json) =>
//       _$ManagerDetailFromJson(json);
// }
