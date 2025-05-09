// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassResponseImpl _$$ClassResponseImplFromJson(Map<String, dynamic> json) =>
    _$ClassResponseImpl(
      status: (json['status'] as num?)?.toInt(),
      classes: (json['classes'] as List<dynamic>?)
          ?.map((e) => Class.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ClassResponseImplToJson(_$ClassResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'classes': instance.classes,
    };

_$ClassImpl _$$ClassImplFromJson(Map<String, dynamic> json) => _$ClassImpl(
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      rescheduled: json['rescheduled'] as bool?,
      oldDate: json['old_date'] == null
          ? null
          : DateTime.parse(json['old_date'] as String),
      batchId: (json['batch_id'] as num?)?.toInt(),
      batchName: json['batch_name'] as String?,
      activeStudentsCount: (json['active_students_count'] as num?)?.toInt(),
      inactiveStudentsCount: (json['inactive_students_count'] as num?)?.toInt(),
      courseName: json['course_name'] as String?,
      subjectName: json['subject_name'] as String?,
      branchName: json['branch_name'] as String?,
      trainers: json['trainers'] as String?,
    );

Map<String, dynamic> _$$ClassImplToJson(_$ClassImpl instance) =>
    <String, dynamic>{
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'rescheduled': instance.rescheduled,
      'old_date': instance.oldDate?.toIso8601String(),
      'batch_id': instance.batchId,
      'batch_name': instance.batchName,
      'active_students_count': instance.activeStudentsCount,
      'inactive_students_count': instance.inactiveStudentsCount,
      'course_name': instance.courseName,
      'subject_name': instance.subjectName,
      'branch_name': instance.branchName,
      'trainers': instance.trainers,
    };
