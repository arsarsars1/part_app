// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leads_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadsResponseImpl _$$LeadsResponseImplFromJson(Map<String, dynamic> json) =>
    _$LeadsResponseImpl(
      status: json['status'] as int?,
      leads: json['leads'] == null
          ? null
          : Leads.fromJson(json['leads'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LeadsResponseImplToJson(_$LeadsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'leads': instance.leads,
    };

_$LeadsImpl _$$LeadsImplFromJson(Map<String, dynamic> json) => _$LeadsImpl(
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

Map<String, dynamic> _$$LeadsImplToJson(_$LeadsImpl instance) =>
    <String, dynamic>{
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

_$LeadImpl _$$LeadImplFromJson(Map<String, dynamic> json) => _$LeadImpl(
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

Map<String, dynamic> _$$LeadImplToJson(_$LeadImpl instance) =>
    <String, dynamic>{
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

_$AssignedToImpl _$$AssignedToImplFromJson(Map<String, dynamic> json) =>
    _$AssignedToImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      branches: (json['branches'] as List<dynamic>?)
          ?.map((e) => BranchElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AssignedToImplToJson(_$AssignedToImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'branches': instance.branches,
    };

_$BranchElementImpl _$$BranchElementImplFromJson(Map<String, dynamic> json) =>
    _$BranchElementImpl(
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

Map<String, dynamic> _$$BranchElementImplToJson(_$BranchElementImpl instance) =>
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

_$CountryImpl _$$CountryImplFromJson(Map<String, dynamic> json) =>
    _$CountryImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      currency: json['currency'] as String?,
      currencySymbol: json['currency_symbol'] as String?,
      currencyCode: json['currency_code'] as String?,
      timezone: json['timezone'] as String?,
      currencySubUnit: json['currency_sub_unit'] as String?,
    );

Map<String, dynamic> _$$CountryImplToJson(_$CountryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'currency': instance.currency,
      'currency_symbol': instance.currencySymbol,
      'currency_code': instance.currencyCode,
      'timezone': instance.timezone,
      'currency_sub_unit': instance.currencySubUnit,
    };

_$DistrictImpl _$$DistrictImplFromJson(Map<String, dynamic> json) =>
    _$DistrictImpl(
      id: json['id'] as int?,
      districtName: json['district_name'] as String?,
    );

Map<String, dynamic> _$$DistrictImplToJson(_$DistrictImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'district_name': instance.districtName,
    };

_$PivotImpl _$$PivotImplFromJson(Map<String, dynamic> json) => _$PivotImpl(
      trainerDetailId: json['trainer_detail_id'] as int?,
      branchId: json['branch_id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PivotImplToJson(_$PivotImpl instance) =>
    <String, dynamic>{
      'trainer_detail_id': instance.trainerDetailId,
      'branch_id': instance.branchId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$StateDetailImpl _$$StateDetailImplFromJson(Map<String, dynamic> json) =>
    _$StateDetailImpl(
      id: json['id'] as int?,
      stateName: json['state_name'] as String?,
    );

Map<String, dynamic> _$$StateDetailImplToJson(_$StateDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state_name': instance.stateName,
    };

_$TimezoneImpl _$$TimezoneImplFromJson(Map<String, dynamic> json) =>
    _$TimezoneImpl(
      id: json['id'] as int?,
      timezone: json['timezone'] as String?,
    );

Map<String, dynamic> _$$TimezoneImplToJson(_$TimezoneImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timezone': instance.timezone,
    };

_$BatchImpl _$$BatchImplFromJson(Map<String, dynamic> json) => _$BatchImpl(
      id: json['id'] as int?,
      batchName: json['batch_name'] as String?,
    );

Map<String, dynamic> _$$BatchImplToJson(_$BatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batch_name': instance.batchName,
    };

_$DatumBranchImpl _$$DatumBranchImplFromJson(Map<String, dynamic> json) =>
    _$DatumBranchImpl(
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

Map<String, dynamic> _$$DatumBranchImplToJson(_$DatumBranchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_name': instance.branchName,
      'state_id': instance.stateId,
      'district_id': instance.districtId,
      'state': instance.state,
      'district': instance.district,
      'timezone': instance.timezone,
    };

_$FollowUpImpl _$$FollowUpImplFromJson(Map<String, dynamic> json) =>
    _$FollowUpImpl(
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

Map<String, dynamic> _$$FollowUpImplToJson(_$FollowUpImpl instance) =>
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
