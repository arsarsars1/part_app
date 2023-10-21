// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BranchResponse _$$_BranchResponseFromJson(Map<String, dynamic> json) =>
    _$_BranchResponse(
      status: json['status'] as int,
      branches: (json['branches'] as List<dynamic>?)
          ?.map((e) => Branch.fromJson(e as Map<String, dynamic>))
          .toList(),
      branch: json['branch'] == null
          ? null
          : Branch.fromJson(json['branch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BranchResponseToJson(_$_BranchResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'branches': instance.branches,
      'branch': instance.branch,
    };

_$_Branch _$$_BranchFromJson(Map<String, dynamic> json) => _$_Branch(
      id: json['id'] as int,
      branchName: json['branch_name'] as String?,
      academyId: json['academy_id'] as int?,
      countryId: json['country_id'] as int?,
      stateId: json['state_id'] as int?,
      districtId: json['district_id'] as int?,
      address: json['address'] as String?,
      pincode: json['pincode'] as int?,
      currency: json['currency'] as String?,
      isActive: json['is_active'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      state: json['state'] == null
          ? null
          : District.fromJson(json['state'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : District.fromJson(json['district'] as Map<String, dynamic>),
      managerDetail: json['manager_detail'] == null
          ? null
          : Manager.fromJson(json['manager_detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BranchToJson(_$_Branch instance) => <String, dynamic>{
      'id': instance.id,
      'branch_name': instance.branchName,
      'academy_id': instance.academyId,
      'country_id': instance.countryId,
      'state_id': instance.stateId,
      'district_id': instance.districtId,
      'address': instance.address,
      'pincode': instance.pincode,
      'currency': instance.currency,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'country': instance.country,
      'state': instance.state,
      'district': instance.district,
      'manager_detail': instance.managerDetail,
    };
