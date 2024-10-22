// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:part_app/model/data_model/branch_manager_response.dart';
import 'package:part_app/model/data_model/students_response.dart';
import 'package:part_app/model/data_model/trainer_response.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

@freezed
abstract class UserResponse with _$UserResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserResponse({
    User? user,
    String? token,
    String? message,
    int? status,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}

@freezed
abstract class User with _$User {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory User({
    required int id,
    String? name,
    String? countryCode,
    String? mobileNo,
    String? firebaseToken,
    int? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    Admin? adminDetail,
    List<Trainer>? trainerDetail,
    List<StudentDetail>? studentDetail,
    List<BranchManagerResponse>? managerDetail,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class Admin with _$Admin {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Admin({
    required int id,
    String? name,
    int? userId,
    String? whatsappNo,
    String? email,
    String? gender,
    DateTime? dob,
    DateTime? doj,
    String? profilePic,
    String? profilePicType,
    int? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    Academy? academy,
  }) = _Admin;

  factory Admin.fromJson(Map<String, dynamic> json) => _$AdminFromJson(json);
}

@freezed
abstract class Academy with _$Academy {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Academy({
    required int id,
    String? academyName,
    int? countryId,
    int? userId,
    int? stateId,
    int? districtId,
    int? academyTypeId,
    int? membershipId,
    DateTime? subscriptionDateTime,
    DateTime? paidOnDate,
    DateTime? validTillDate,
    int? maxNoOfStudents,
    int? maxNoOfBranches,
    int? createdBy,
    dynamic updatedBy,
    String? createdFrom,
    int? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    MembershipDetails? membership,
  }) = _Academy;

  factory Academy.fromJson(Map<String, dynamic> json) =>
      _$AcademyFromJson(json);
}

@freezed
class MembershipDetails with _$MembershipDetails {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory MembershipDetails({
    int? id,
    String? membershipType,
    int? countryId,
    String? period,
    String? paymentType,
    int? duration,
    int? amount,
    int? maxNoOfStudents,
    int? maxNoOfBatches,
    int? maxNoOfBranches,
    int? isDiscounted,
    dynamic discountType,
    int? discountAmount,
    dynamic discountPercentage,
    int? sgst,
    int? cgst,
    int? finalAmount,
    int? isActive,
  }) = _MembershipDetails;

  factory MembershipDetails.fromJson(Map<String, dynamic> json) =>
      _$MembershipDetailsFromJson(json);
}
