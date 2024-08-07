// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtpImpl _$$OtpImplFromJson(Map<String, dynamic> json) => _$OtpImpl(
      message: json['message'] as String,
      otp: json['otp'],
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OtpImplToJson(_$OtpImpl instance) => <String, dynamic>{
      'message': instance.message,
      'otp': instance.otp,
      'status': instance.status,
    };
