// To parse this JSON data, do
//
//     final BranchTrainerResponse = BranchTrainerResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:part_app/model/data_model/trainer_response.dart';

part 'branch_trainer_response.freezed.dart';
part 'branch_trainer_response.g.dart';

BranchTrainerResponse branchTrainerResponseFromJson(String str) =>
    BranchTrainerResponse.fromJson(json.decode(str));

String branchTrainerResponseToJson(BranchTrainerResponse data) =>
    json.encode(data.toJson());

@freezed
abstract class BranchTrainerResponse with _$BranchTrainerResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BranchTrainerResponse({
    required int status,
    List<Trainer>? trainers,
  }) = _BranchTrainerResponse;

  factory BranchTrainerResponse.fromJson(Map<String, dynamic> json) =>
      _$BranchTrainerResponseFromJson(json);
}
