// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp.freezed.dart';
part 'otp.g.dart';

Otp otpFromJson(String str) => Otp.fromJson(json.decode(str));

String otpToJson(Otp data) => json.encode(data.toJson());

@freezed
abstract class Otp with _$Otp {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Otp({
    required String message,
    dynamic otp,
    int? status,
  }) = _Otp;

  factory Otp.fromJson(Map<String, dynamic> json) => _$OtpFromJson(json);
}
