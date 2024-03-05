// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadRequestImpl _$$LeadRequestImplFromJson(Map<String, dynamic> json) =>
    _$LeadRequestImpl(
      branchId: json['branch_id'] as int?,
      batchId: json['batch_id'] as int?,
      leadStatus: json['lead_status'] as String?,
      name: json['name'] as String?,
      mobileNo: json['mobile_no'] as String?,
      gender: json['gender'] as String?,
      age: json['age'] as String?,
      whatsappNo: json['whatsapp_no'] as String?,
      email: json['email'] as String?,
      followUpDate: json['follow_up_date'] as String?,
      followUpTime: json['follow_up_time'] as String?,
      assignedToId: json['assigned_to_id'] as int?,
      assignedToType: json['assigned_to_type'] as String?,
      followUpComment: json['follow_up_comment'] as String?,
    );

Map<String, dynamic> _$$LeadRequestImplToJson(_$LeadRequestImpl instance) =>
    <String, dynamic>{
      'branch_id': instance.branchId,
      'batch_id': instance.batchId,
      'lead_status': instance.leadStatus,
      'name': instance.name,
      'mobile_no': instance.mobileNo,
      'gender': instance.gender,
      'age': instance.age,
      'whatsapp_no': instance.whatsappNo,
      'email': instance.email,
      'follow_up_date': instance.followUpDate,
      'follow_up_time': instance.followUpTime,
      'assigned_to_id': instance.assignedToId,
      'assigned_to_type': instance.assignedToType,
      'follow_up_comment': instance.followUpComment,
    };
