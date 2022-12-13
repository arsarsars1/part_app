// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reschedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RescheduleResponse _$$_RescheduleResponseFromJson(
        Map<String, dynamic> json) =>
    _$_RescheduleResponse(
      status: json['status'] as int?,
      rescheduledClasses: (json['rescheduled_classes'] as List<dynamic>?)
          ?.map((e) => BatchDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RescheduleResponseToJson(
        _$_RescheduleResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'rescheduled_classes': instance.rescheduledClasses,
    };
