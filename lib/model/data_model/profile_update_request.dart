// To parse this JSON data, do
//
//     final profileUpdateRequest = profileUpdateRequestFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'profile_update_request.freezed.dart';
part 'profile_update_request.g.dart';

ProfileUpdateRequest profileUpdateRequestFromJson(String str) =>
    ProfileUpdateRequest.fromJson(json.decode(str));

String profileUpdateRequestToJson(ProfileUpdateRequest data) =>
    json.encode(data.toJson());

@freezed
class ProfileUpdateRequest with _$ProfileUpdateRequest {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProfileUpdateRequest({
    String? name,
    String? mobileNo,
    String? countryCode,
    String? email,
    String? gender,
    String? whatsappNo,
    String? academyName,
    String? dob,
    String? profilePic,
    
  }) = _ProfileUpdateRequest;

  factory ProfileUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateRequestFromJson(json);
}
