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
    );

Map<String, dynamic> _$$_ClassToJson(_$_Class instance) => <String, dynamic>{
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'rescheduled': instance.rescheduled,
      'old_date': instance.oldDate?.toIso8601String(),
    };
