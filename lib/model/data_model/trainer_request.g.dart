// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrainerRequestImpl _$$TrainerRequestImplFromJson(Map<String, dynamic> json) =>
    _$TrainerRequestImpl(
      name: json['name'] as String?,
      mobileNo: json['mobile_no'] as String?,
      countryCode: (json['country_code'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      doj: json['doj'] as String?,
      whatsappNo: json['whatsapp_no'] as String?,
      email: json['email'] as String?,
      salaryType: json['salary_type'] as String?,
      expertise: json['expertise'] as String?,
      salaryDate: (json['salary_date'] as num?)?.toInt(),
      salaryAmount: json['salary_amount'] as String?,
      branchId: json['branch_id[]'],
      upiId: json['upi_id'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$TrainerRequestImplToJson(
        _$TrainerRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mobile_no': instance.mobileNo,
      'country_code': instance.countryCode,
      'gender': instance.gender,
      'dob': instance.dob,
      'doj': instance.doj,
      'whatsapp_no': instance.whatsappNo,
      'email': instance.email,
      'salary_type': instance.salaryType,
      'expertise': instance.expertise,
      'salary_date': instance.salaryDate,
      'salary_amount': instance.salaryAmount,
      'branch_id[]': instance.branchId,
      'upi_id': instance.upiId,
      'address': instance.address,
    };
