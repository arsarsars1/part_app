// To parse this JSON data, do
//
//     final orderResponse = orderResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_response.freezed.dart';
part 'order_response.g.dart';

OrderResponse orderResponseFromJson(String str) =>
    OrderResponse.fromJson(json.decode(str));

String orderResponseToJson(OrderResponse data) => json.encode(data.toJson());

@freezed
abstract class OrderResponse with _$OrderResponse {
  const factory OrderResponse({
    required String id,
    String? entity,
    int? amount,
    int? amountPaid,
    int? amountDue,
    String? currency,
    String? receipt,
    dynamic? offerId,
    String? status,
    int? attempts,
    int? createdAt,
  }) = _OrderResponse;

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);
}

@freezed
abstract class Notes with _$Notes {
  const factory Notes({
    String? notesKey1,
    String? notesKey2,
  }) = _Notes;

  factory Notes.fromJson(Map<String, dynamic> json) => _$NotesFromJson(json);
}
