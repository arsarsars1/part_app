// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClassResponse _$$_ClassResponseFromJson(Map<String, dynamic> json) =>
    _$_ClassResponse(
      status: json['status'] as int?,
      classes: (json['classes'] as List<dynamic>?)
          ?.map((e) => Class.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ClassResponseToJson(_$_ClassResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'classes': instance.classes,
    };

_$_Class _$$_ClassFromJson(Map<String, dynamic> json) => _$_Class(
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      rescheduled: json['rescheduled'] as bool?,
      oldDate: json['old_date'] == null
          ? null
          : DateTime.parse(json['old_date'] as String),
      batchId: json['batch_id'] as int?,
      batchName: json['batch_name'] as String?,
      activeStudentsCount: json['active_students_count'] as int?,
      inactiveStudentsCount: json['inactive_students_count'] as int?,
      courseName: json['course_name'] as String?,
      subjectName: json['subject_name'] as String?,
      branchName: json['branch_name'] as String?,
      trainers: json['trainers'] as String?,
    );

Map<String, dynamic> _$$_ClassToJson(_$_Class instance) => <String, dynamic>{
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
