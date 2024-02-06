// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ManagerRequestImpl _$$ManagerRequestImplFromJson(Map<String, dynamic> json) =>
    _$ManagerRequestImpl(
      branchId: json['branch_id'] as int?,
      name: json['name'] as String?,
      mobileNo: json['mobile_no'] as String?,
      countryCode: json['country_code'] as int?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      doj: json['doj'] as String?,
      whatsappNo: json['whatsapp_no'] as String?,
      email: json['email'] as String?,
      salaryType: json['salary_type'] as String?,
      salaryDate: json['salary_date'] as String?,
      salaryAmount: json['salary_amount'] as String?,
      upiId: json['upi_id'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$ManagerRequestImplToJson(
        _$ManagerRequestImpl instance) =>
    <String, dynamic>{
      'branch_id': instance.branchId,
      'name': instance.name,
      'mobile_no': instance.mobileNo,
      'country_code': instance.countryCode,
      'gender': instance.gender,
      'dob': instance.dob,
      'doj': instance.doj,
      'whatsapp_no': instance.whatsappNo,
      'email': instance.email,
      'salary_type': instance.salaryType,
      'salary_date': instance.salaryDate,
      'salary_amount': instance.salaryAmount,
      'upi_id': instance.upiId,
      'address': instance.address,
    };
