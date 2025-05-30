// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ManagerResponseImpl _$$ManagerResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ManagerResponseImpl(
      status: (json['status'] as num).toInt(),
      managers: json['managers'] == null
          ? null
          : Datum.fromJson(json['managers'] as Map<String, dynamic>),
      manager: json['manager'] == null
          ? null
          : Manager.fromJson(json['manager'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ManagerResponseImplToJson(
        _$ManagerResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'managers': instance.managers,
      'manager': instance.manager,
    };

_$DatumImpl _$$DatumImplFromJson(Map<String, dynamic> json) => _$DatumImpl(
      currentPage: (json['current_page'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Manager.fromJson(e as Map<String, dynamic>))
          .toList(),
      from: (json['from'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      to: (json['to'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'from': instance.from,
      'per_page': instance.perPage,
      'to': instance.to,
    };

_$ManagerImpl _$$ManagerImplFromJson(Map<String, dynamic> json) =>
    _$ManagerImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      academyId: (json['academy_id'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      name: json['name'] as String?,
      mobileNo: json['mobile_no'] as String?,
      countryCode: json['country_code'] as String?,
      upiId: json['upi_id'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      doj: json['doj'] == null ? null : DateTime.parse(json['doj'] as String),
      whatsappNo: json['whatsapp_no'] as String?,
      email: json['email'] as String?,
      salaryType: json['salary_type'] as String?,
      salaryDate: (json['salary_date'] as num?)?.toInt(),
      salaryAmount: (json['salary_amount'] as num?)?.toInt(),
      profilePic: json['profile_pic'] as String?,
      profilePicType: json['profile_pic_type'] as String?,
      address: json['address'] as String?,
      document_1: json['document_1'] as String?,
      document_2: json['document_2'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
      managerDetail: (json['manager_detail'] as List<dynamic>?)
          ?.map((e) => Manager.fromJson(e as Map<String, dynamic>))
          .toList(),
      branches: (json['branches'] as List<dynamic>?)
          ?.map((e) => Branch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ManagerImplToJson(_$ManagerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'academy_id': instance.academyId,
      'gender': instance.gender,
      'name': instance.name,
      'mobile_no': instance.mobileNo,
      'country_code': instance.countryCode,
      'upi_id': instance.upiId,
      'dob': instance.dob?.toIso8601String(),
      'doj': instance.doj?.toIso8601String(),
      'whatsapp_no': instance.whatsappNo,
      'email': instance.email,
      'salary_type': instance.salaryType,
      'salary_date': instance.salaryDate,
      'salary_amount': instance.salaryAmount,
      'profile_pic': instance.profilePic,
      'profile_pic_type': instance.profilePicType,
      'address': instance.address,
      'document_1': instance.document_1,
      'document_2': instance.document_2,
      'is_active': instance.isActive,
      'manager_detail': instance.managerDetail,
      'branches': instance.branches,
    };
