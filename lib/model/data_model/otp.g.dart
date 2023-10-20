// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Otp _$$_OtpFromJson(Map<String, dynamic> json) => _$_Otp(
      message: json['message'] as String,
      otp: json['otp'],
      status: json['status'] as int?,
    );

Map<String, dynamic> _$$_OtpToJson(_$_Otp instance) => <String, dynamic>{
      'message': instance.message,
      'otp': instance.otp,
      'status': instance.status,
    };
