// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CancelResponseImpl _$$CancelResponseImplFromJson(Map<String, dynamic> json) =>
    _$CancelResponseImpl(
      status: (json['status'] as num?)?.toInt(),
      cancelledClasses: (json['cancelled_classes'] as List<dynamic>?)
          ?.map((e) => CancelledClass.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CancelResponseImplToJson(
        _$CancelResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'cancelled_classes': instance.cancelledClasses,
    };

_$CancelledClassImpl _$$CancelledClassImplFromJson(Map<String, dynamic> json) =>
    _$CancelledClassImpl(
      id: (json['id'] as num?)?.toInt(),
      batchId: (json['batch_id'] as num?)?.toInt(),
      classDate: json['class_date'] == null
          ? null
          : DateTime.parse(json['class_date'] as String),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      reason: json['reason'] as String?,
      cancelledByType: json['cancelled_by_type'] as String?,
      cancelledById: (json['cancelled_by_id'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      cancelledBy: json['cancelled_by'] == null
          ? null
          : CancelledBy.fromJson(json['cancelled_by'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CancelledClassImplToJson(
        _$CancelledClassImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batch_id': instance.batchId,
      'class_date': instance.classDate?.toIso8601String(),
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'reason': instance.reason,
      'cancelled_by_type': instance.cancelledByType,
      'cancelled_by_id': instance.cancelledById,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'cancelled_by': instance.cancelledBy,
    };

_$CancelledByImpl _$$CancelledByImplFromJson(Map<String, dynamic> json) =>
    _$CancelledByImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      whatsappNo: json['whatsapp_no'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      doj: json['doj'] == null ? null : DateTime.parse(json['doj'] as String),
      profilePic: json['profile_pic'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CancelledByImplToJson(_$CancelledByImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user_id': instance.userId,
      'whatsapp_no': instance.whatsappNo,
      'email': instance.email,
      'gender': instance.gender,
      'dob': instance.dob?.toIso8601String(),
      'doj': instance.doj?.toIso8601String(),
      'profile_pic': instance.profilePic,
      'is_active': instance.isActive,
    };
