// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leads_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LeadsResponse _$$_LeadsResponseFromJson(Map<String, dynamic> json) =>
    _$_LeadsResponse(
      status: json['status'] as int?,
      leads: json['leads'] == null
          ? null
          : Leads.fromJson(json['leads'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LeadsResponseToJson(_$_LeadsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'leads': instance.leads,
    };

_$_Leads _$$_LeadsFromJson(Map<String, dynamic> json) => _$_Leads(
      currentPage: json['current_page'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Lead.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: json['from'] as int?,
      nextPageUrl: json['next_page_url'],
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      prevPageUrl: json['prev_page_url'],
      to: json['to'] as int?,
    );

Map<String, dynamic> _$$_LeadsToJson(_$_Leads instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
    };

_$_Lead _$$_LeadFromJson(Map<String, dynamic> json) => _$_Lead(
      id: json['id'] as int?,
      academyId: json['academy_id'] as int?,
      name: json['name'] as String?,
      age: json['age'] as String?,
      gender: json['gender'] as String?,
      profilePic: json['profile_pic'] as String?,
      countryCode: json['country_code'] as String?,
      mobileNo: json['mobile_no'] as String?,
      whatsapp: json['whatsapp'],
      branchId: json['branch_id'] as int?,
      batchId: json['batch_id'] as int?,
      email: json['email'] as String?,
      leadStatus: json['lead_status'] as String?,
      assignedToType: json['assigned_to_type'] as String?,
      assignedToId: json['assigned_to_id'] as int?,
      addedOn: json['added_on'] == null
          ? null
          : DateTime.parse(json['added_on'] as String),
      branch: json['branch'] == null
          ? null
          : DatumBranch.fromJson(json['branch'] as Map<String, dynamic>),
      batch: json['batch'] == null
          ? null
          : Batch.fromJson(json['batch'] as Map<String, dynamic>),
      assignedTo: json['assigned_to'] == null
          ? null
          : AssignedTo.fromJson(json['assigned_to'] as Map<String, dynamic>),
      followUps: (json['follow_ups'] as List<dynamic>?)
          ?.map((e) => FollowUp.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LeadToJson(_$_Lead instance) => <String, dynamic>{
      'id': instance.id,
      'academy_id': instance.academyId,
      'name': instance.name,
      'age': instance.age,
      'gender': instance.gender,
      'profile_pic': instance.profilePic,
      'country_code': instance.countryCode,
      'mobile_no': instance.mobileNo,
      'whatsapp': instance.whatsapp,
      'branch_id': instance.branchId,
      'batch_id': instance.batchId,
      'email': instance.email,
      'lead_status': instance.leadStatus,
      'assigned_to_type': instance.assignedToType,
      'assigned_to_id': instance.assignedToId,
      'added_on': instance.addedOn?.toIso8601String(),
      'branch': instance.branch,
      'batch': instance.batch,
      'assigned_to': instance.assignedTo,
      'follow_ups': instance.followUps,
    };

_$_AssignedTo _$$_AssignedToFromJson(Map<String, dynamic> json) =>
    _$_AssignedTo(
      id: json['id'] as int?,
      name: json['name'] as String?,
      branches: (json['branches'] as List<dynamic>?)
          ?.map((e) => BranchElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AssignedToToJson(_$_AssignedTo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'branches': instance.branches,
    };

_$_BranchElement _$$_BranchElementFromJson(Map<String, dynamic> json) =>
    _$_BranchElement(
      id: json['id'] as int?,
      branchName: json['branch_name'] as String?,
      academyId: json['academy_id'] as int?,
      countryId: json['country_id'] as int?,
      managerDetailId: json['manager_detail_id'],
      stateId: json['state_id'] as int?,
      districtId: json['district_id'] as int?,
      address: json['address'] as String?,
      pincode: json['pincode'] as int?,
      currency: json['currency'] as String?,
      isActive: json['is_active'] as int?,
      pivot: json['pivot'] == null
          ? null
          : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      state: json['state'] == null
          ? null
          : StateDetail.fromJson(json['state'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : District.fromJson(json['district'] as Map<String, dynamic>),
      timezone: json['timezone'] == null
          ? null
          : Timezone.fromJson(json['timezone'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BranchElementToJson(_$_BranchElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_name': instance.branchName,
      'academy_id': instance.academyId,
      'country_id': instance.countryId,
      'manager_detail_id': instance.managerDetailId,
      'state_id': instance.stateId,
      'district_id': instance.districtId,
      'address': instance.address,
      'pincode': instance.pincode,
      'currency': instance.currency,
      'is_active': instance.isActive,
      'pivot': instance.pivot,
      'country': instance.country,
      'state': instance.state,
      'district': instance.district,
      'timezone': instance.timezone,
    };

_$_Country _$$_CountryFromJson(Map<String, dynamic> json) => _$_Country(
      id: json['id'] as int?,
      name: json['name'] as String?,
      currency: json['currency'] as String?,
      currencySymbol: json['currency_symbol'] as String?,
      currencyCode: json['currency_code'] as String?,
      timezone: json['timezone'] as String?,
      currencySubUnit: json['currency_sub_unit'] as String?,
    );

Map<String, dynamic> _$$_CountryToJson(_$_Country instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'currency': instance.currency,
      'currency_symbol': instance.currencySymbol,
      'currency_code': instance.currencyCode,
      'timezone': instance.timezone,
      'currency_sub_unit': instance.currencySubUnit,
    };

_$_District _$$_DistrictFromJson(Map<String, dynamic> json) => _$_District(
      id: json['id'] as int?,
      districtName: json['district_name'] as String?,
    );

Map<String, dynamic> _$$_DistrictToJson(_$_District instance) =>
    <String, dynamic>{
      'id': instance.id,
      'district_name': instance.districtName,
    };

_$_Pivot _$$_PivotFromJson(Map<String, dynamic> json) => _$_Pivot(
      trainerDetailId: json['trainer_detail_id'] as int?,
      branchId: json['branch_id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_PivotToJson(_$_Pivot instance) => <String, dynamic>{
      'trainer_detail_id': instance.trainerDetailId,
      'branch_id': instance.branchId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$_StateDetail _$$_StateDetailFromJson(Map<String, dynamic> json) =>
    _$_StateDetail(
      id: json['id'] as int?,
      stateName: json['state_name'] as String?,
    );

Map<String, dynamic> _$$_StateDetailToJson(_$_StateDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state_name': instance.stateName,
    };

_$_Timezone _$$_TimezoneFromJson(Map<String, dynamic> json) => _$_Timezone(
      id: json['id'] as int?,
      timezone: json['timezone'] as String?,
    );

Map<String, dynamic> _$$_TimezoneToJson(_$_Timezone instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timezone': instance.timezone,
    };

_$_Batch _$$_BatchFromJson(Map<String, dynamic> json) => _$_Batch(
      id: json['id'] as int?,
      batchName: json['batch_name'] as String?,
    );

Map<String, dynamic> _$$_BatchToJson(_$_Batch instance) => <String, dynamic>{
      'id': instance.id,
      'batch_name': instance.batchName,
    };

_$_DatumBranch _$$_DatumBranchFromJson(Map<String, dynamic> json) =>
    _$_DatumBranch(
      id: json['id'] as int?,
      branchName: json['branch_name'] as String?,
      stateId: json['state_id'] as int?,
      districtId: json['district_id'] as int?,
      state: json['state'] == null
          ? null
          : StateDetail.fromJson(json['state'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : District.fromJson(json['district'] as Map<String, dynamic>),
      timezone: json['timezone'],
    );

Map<String, dynamic> _$$_DatumBranchToJson(_$_DatumBranch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_name': instance.branchName,
      'state_id': instance.stateId,
      'district_id': instance.districtId,
      'state': instance.state,
      'district': instance.district,
      'timezone': instance.timezone,
    };

_$_FollowUp _$$_FollowUpFromJson(Map<String, dynamic> json) => _$_FollowUp(
      id: json['id'] as int?,
      leadId: json['lead_id'] as int?,
      assignedToType: json['assigned_to_type'] as String?,
      assignedToId: json['assigned_to_id'] as int?,
      followUpDate: json['follow_up_date'] == null
          ? null
          : DateTime.parse(json['follow_up_date'] as String),
      followUpTime: json['follow_up_time'] as String?,
      followUpComment: json['follow_up_comment'],
      followUpStatus: json['follow_up_status'] as String?,
      assignedTo: json['assigned_to'] == null
          ? null
          : AssignedTo.fromJson(json['assigned_to'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FollowUpToJson(_$_FollowUp instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lead_id': instance.leadId,
      'assigned_to_type': instance.assignedToType,
      'assigned_to_id': instance.assignedToId,
      'follow_up_date': instance.followUpDate?.toIso8601String(),
      'follow_up_time': instance.followUpTime,
      'follow_up_comment': instance.followUpComment,
      'follow_up_status': instance.followUpStatus,
      'assigned_to': instance.assignedTo,
    };
