// To parse this JSON data, do
//
//     final trainerResponse = trainerResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

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
    Datum? trainers,
    Trainer? trainer,
  }) = _TrainerResponse;

  factory TrainerResponse.fromJson(Map<String, dynamic> json) =>
      _$TrainerResponseFromJson(json);
}

@freezed
abstract class Datum with _$Datum {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Datum({
    int? currentPage,
    required List<Trainer> data,
    int? from,
    int? perPage,
    int? to,
    String? nextPageUrl,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
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
    String? expertise,
    int? salaryDate,
    int? salaryAmount,
    String? profilePic,
    String? profilePicType,
    int? trainerDetailId,
    int? isActive,
    User? user,
    Academy? academy,
    List<Branch>? branches,
    @JsonKey(name: 'document_1') String? document1,
    @JsonKey(name: 'document_2') String? document2,
    List<Trainer>? trainerDetail,
  }) = _Trainer;

  factory Trainer.fromJson(Map<String, dynamic> json) =>
      _$TrainerFromJson(json);
}

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
