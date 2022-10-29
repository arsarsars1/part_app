// To parse this JSON data, do
//
//     final trainerResponse = trainerResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:part_app/model/data_model/user_response.dart';

part 'trainer_response.freezed.dart';
part 'trainer_response.g.dart';

TrainerResponse trainerResponseFromJson(String str) =>
    TrainerResponse.fromJson(json.decode(str));

String trainerResponseToJson(TrainerResponse data) =>
    json.encode(data.toJson());

@freezed
abstract class TrainerResponse with _$TrainerResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TrainerResponse({
    required int status,
    List<Trainer>? trainers,
    Trainer? trainer,
  }) = _TrainerResponse;

  factory TrainerResponse.fromJson(Map<String, dynamic> json) =>
      _$TrainerResponseFromJson(json);
}

@freezed
abstract class Trainer with _$Trainer {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Trainer({
    required int id,
    int? userId,
    int? academyId,
    String? gender,
    DateTime? dob,
    DateTime? doj,
    String? whatsappNo,
    String? email,
    String? upiId,
    String? salaryType,
    int? salaryDate,
    String? salaryAmount,
    String? profilePic,
    String? profilePicType,
    int? isActive,
    Pivot? pivot,
    User? user,
  }) = _Trainer;

  factory Trainer.fromJson(Map<String, dynamic> json) =>
      _$TrainerFromJson(json);
}

@freezed
abstract class Pivot with _$Pivot {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Pivot({
    required int branchId,
    int? trainerDetailId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Pivot;

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);
}

// @freezed
// abstract class User with _$User {
//   const factory User({
//    required int id,
//     String? name,
//     String? countryCode,
//     String? mobileNo,
//     String? firebaseToken,
//     int? isActive,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//   }) = _User;
//
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
// }
