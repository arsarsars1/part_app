// To parse this JSON data, do
//
//     final trainerResponse = trainerResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:part_app/model/data_model/branch_response.dart';
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
    String? mobileNo,
    String? countryCode,
    String? name,
    String? email,
    String? upiId,
    String? salaryType,
    String? address,
    int? salaryDate,
    int? salaryAmount,
    String? profilePic,
    String? profilePicType,
    int? isActive,
    User? user,
    Academy? academy,
    Trainer? trainer,
    List<Branch>? branches,
    List<Document>? documents,
    List<Trainer>? trainerDetail,
  }) = _Trainer;

  factory Trainer.fromJson(Map<String, dynamic> json) =>
      _$TrainerFromJson(json);
}

// @freezed
// abstract class Pivot with _$Pivot {
//   @JsonSerializable(fieldRename: FieldRename.snake)
//   const factory Pivot({
//     required int branchId,
//     int? trainerDetailId,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//   }) = _Pivot;
//
//   factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);
// }

@freezed
abstract class Document with _$Document {
  const factory Document({
    int? id,
    int? documentIndex,
    String? image,
    String? ofType,
    int? ofId,
    int? isAvailable,
  }) = _Document;

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);
}
