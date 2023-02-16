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
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      prevPageUrl: json['prev_page_url'] as String?,
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
      countryCode: json['country_code'] as String?,
      mobileNo: json['mobile_no'] as String?,
      whatsapp: json['whatsapp'] as String?,
      branchId: json['branch_id'] as int?,
      batchId: json['batch_id'] as int?,
      leadStatus: json['lead_status'] as String?,
      assignedToType: json['assigned_to_type'] as String?,
      assignedToId: json['assigned_to_id'] as int?,
      branch: json['branch'] == null
          ? null
          : Branch.fromJson(json['branch'] as Map<String, dynamic>),
      batch: json['batch'] == null
          ? null
          : Batch.fromJson(json['batch'] as Map<String, dynamic>),
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
      'country_code': instance.countryCode,
      'mobile_no': instance.mobileNo,
      'whatsapp': instance.whatsapp,
      'branch_id': instance.branchId,
      'batch_id': instance.batchId,
      'lead_status': instance.leadStatus,
      'assigned_to_type': instance.assignedToType,
      'assigned_to_id': instance.assignedToId,
      'branch': instance.branch,
      'batch': instance.batch,
      'follow_ups': instance.followUps,
    };

_$_Batch _$$_BatchFromJson(Map<String, dynamic> json) => _$_Batch(
      id: json['id'] as int?,
      batchName: json['batch_name'] as String?,
    );

Map<String, dynamic> _$$_BatchToJson(_$_Batch instance) => <String, dynamic>{
      'id': instance.id,
      'batch_name': instance.batchName,
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
      followUpComment: json['follow_up_comment'] as String?,
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

_$_AssignedTo _$$_AssignedToFromJson(Map<String, dynamic> json) =>
    _$_AssignedTo(
      id: json['id'] as int?,
      name: json['name'] as String?,
      branches: (json['branches'] as List<dynamic>?)
          ?.map((e) => Branch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AssignedToToJson(_$_AssignedTo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'branches': instance.branches,
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
