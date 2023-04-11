// To parse this JSON data, do
//
//     final cancelResponse = cancelResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'cancel_response.freezed.dart';
part 'cancel_response.g.dart';

CancelResponse cancelResponseFromJson(String str) =>
    CancelResponse.fromJson(json.decode(str));

String cancelResponseToJson(CancelResponse data) => json.encode(data.toJson());

@freezed
class CancelResponse with _$CancelResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CancelResponse({
    int? status,
    List<CancelledClass>? cancelledClasses,
  }) = _CancelResponse;

  factory CancelResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelResponseFromJson(json);
}

// @freezed
// abstract class CancelResponse with _$CancelResponses {
//   @JsonSerializable(fieldRename: FieldRename.snake)
//   const factory CancelResponse({
//     int? currentPage,
//     List<CancelledClass>? data,
//     String? firstPageUrl,
//     String? nextPageUrl,
//     int? from,
//     String? path,
//     int? perPage,
//     int? to,
//   }) = _CancelResponse;

//   factory CancelResponse.fromJson(Map<String, dynamic> json) =>
//       _$CancelResponseFromJson(json);
// }

@freezed
class CancelledClass with _$CancelledClass {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CancelledClass({
    int? id,
    int? batchId,
    DateTime? classDate,
    String? startTime,
    String? endTime,
    String? reason,
    String? cancelledByType,
    int? cancelledById,
    DateTime? createdAt,
    DateTime? updatedAt,
    CancelledBy? cancelledBy,
  }) = _CancelledClass;

  factory CancelledClass.fromJson(Map<String, dynamic> json) =>
      _$CancelledClassFromJson(json);
}

@freezed
class CancelledBy with _$CancelledBy {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory CancelledBy({
    int? id,
    String? name,
    int? userId,
    String? whatsappNo,
    String? email,
    String? gender,
    DateTime? dob,
    DateTime? doj,
    String? profilePic,
    int? isActive,
  }) = _CancelledBy;

  factory CancelledBy.fromJson(Map<String, dynamic> json) =>
      _$CancelledByFromJson(json);
}
