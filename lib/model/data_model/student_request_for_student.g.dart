// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_request_for_student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentRequestForStudentImpl _$$StudentRequestForStudentImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentRequestForStudentImpl(
      name: json['name'] as String?,
      mobileNo: json['mobile_no'] as String?,
      countryCode: json['country_code'] as int?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      whatsappNo: json['whatsapp_no'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      isParent: json['is_parent'] as int?,
      parentName: json['parent_name'] as String?,
    );

Map<String, dynamic> _$$StudentRequestForStudentImplToJson(
        _$StudentRequestForStudentImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mobile_no': instance.mobileNo,
      'country_code': instance.countryCode,
      'gender': instance.gender,
      'dob': instance.dob,
      'whatsapp_no': instance.whatsappNo,
      'email': instance.email,
      'address': instance.address,
      'is_parent': instance.isParent,
      'parent_name': instance.parentName,
    };
