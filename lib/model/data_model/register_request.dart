// To parse this JSON data, do
//
//     final registerRequest = registerRequestFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_request.freezed.dart';
part 'register_request.g.dart';

RegisterRequest registerRequestFromJson(String str) =>
    RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) =>
    json.encode(data.toJson());

@freezed
class RegisterRequest with _$RegisterRequest {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RegisterRequest({
    String? mobileNo,
    String? countryCode,
    String? whatsappNo,
    String? email,
    String? gender,
    String? dob,
    String? profilePic,
    String? isTrainer,
    String? profilePicType,
    String? academyName,
    String? branchName,
    String? branchAddress,
    String? branchPincode,
    String? firebaseToken,
    int? academyTypeId,
    String? name,
    int? countryId,
    int? stateId,
    int? districtId,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, Object> json) =>
      _$RegisterRequestFromJson(json);
}
