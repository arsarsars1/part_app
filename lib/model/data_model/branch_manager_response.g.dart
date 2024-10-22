// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_manager_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BranchManagerResponseImpl _$$BranchManagerResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BranchManagerResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      academyId: (json['academy_id'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      doj: json['doj'] == null ? null : DateTime.parse(json['doj'] as String),
      whatsappNo: json['whatsapp_no'] as String?,
      email: json['email'] as String?,
      upiId: json['upi_id'],
      address: json['address'] as String?,
      salaryDate: (json['salary_date'] as num?)?.toInt(),
      salaryAmount: (json['salary_amount'] as num?)?.toInt(),
      profilePic: json['profile_pic'] as String?,
      document1: json['document1'],
      document2: json['document2'],
      isActive: (json['is_active'] as num?)?.toInt(),
      academy: json['academy'] == null
          ? null
          : Academy.fromJson(json['academy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BranchManagerResponseImplToJson(
        _$BranchManagerResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user_id': instance.userId,
      'academy_id': instance.academyId,
      'gender': instance.gender,
      'dob': instance.dob?.toIso8601String(),
      'doj': instance.doj?.toIso8601String(),
      'whatsapp_no': instance.whatsappNo,
      'email': instance.email,
      'upi_id': instance.upiId,
      'address': instance.address,
      'salary_date': instance.salaryDate,
      'salary_amount': instance.salaryAmount,
      'profile_pic': instance.profilePic,
      'document1': instance.document1,
      'document2': instance.document2,
      'is_active': instance.isActive,
      'academy': instance.academy,
    };
