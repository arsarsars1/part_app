// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileUpdateRequestImpl _$$ProfileUpdateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileUpdateRequestImpl(
      name: json['name'] as String?,
      mobileNo: json['mobile_no'] as String?,
      countryCode: json['country_code'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      whatsappNo: json['whatsapp_no'] as String?,
      academyName: json['academy_name'] as String?,
      dob: json['dob'] as String?,
      profilePic: json['profile_pic'] as String?,
    );

Map<String, dynamic> _$$ProfileUpdateRequestImplToJson(
        _$ProfileUpdateRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mobile_no': instance.mobileNo,
      'country_code': instance.countryCode,
      'email': instance.email,
      'gender': instance.gender,
      'whatsapp_no': instance.whatsappNo,
      'academy_name': instance.academyName,
      'dob': instance.dob,
      'profile_pic': instance.profilePic,
    };
