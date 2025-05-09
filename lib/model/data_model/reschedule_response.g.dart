// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reschedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RescheduleResponseImpl _$$RescheduleResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RescheduleResponseImpl(
      status: (json['status'] as num?)?.toInt(),
      rescheduledClasses: (json['rescheduled_classes'] as List<dynamic>?)
          ?.map((e) => RescheduledClass.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RescheduleResponseImplToJson(
        _$RescheduleResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'rescheduled_classes': instance.rescheduledClasses,
    };

_$RescheduledClassesImpl _$$RescheduledClassesImplFromJson(
        Map<String, dynamic> json) =>
    _$RescheduledClassesImpl(
      currentPage: (json['current_page'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => RescheduledClass.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      nextPageUrl: json['next_page_url'] as String?,
      from: (json['from'] as num?)?.toInt(),
      path: json['path'] as String?,
      perPage: (json['per_page'] as num?)?.toInt(),
      to: (json['to'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RescheduledClassesImplToJson(
        _$RescheduledClassesImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'first_page_url': instance.firstPageUrl,
      'next_page_url': instance.nextPageUrl,
      'from': instance.from,
      'path': instance.path,
      'per_page': instance.perPage,
      'to': instance.to,
    };

_$RescheduledClassImpl _$$RescheduledClassImplFromJson(
        Map<String, dynamic> json) =>
    _$RescheduledClassImpl(
      id: (json['id'] as num?)?.toInt(),
      batchId: (json['batch_id'] as num?)?.toInt(),
      oldDate: json['old_date'] == null
          ? null
          : DateTime.parse(json['old_date'] as String),
      oldStartTime: json['old_start_time'] as String?,
      oldEndTime: json['old_end_time'] as String?,
      newDate: json['new_date'] == null
          ? null
          : DateTime.parse(json['new_date'] as String),
      newStartTime: json['new_start_time'] as String?,
      newEndTime: json['new_end_time'] as String?,
      rescheduledByType: json['rescheduled_by_type'] as String?,
      rescheduledById: (json['rescheduled_by_id'] as num?)?.toInt(),
      cancelledDate: json['cancelled_date'],
      cancelledStartTime: json['cancelled_start_time'],
      cancelledEndTime: json['cancelled_end_time'],
    );

Map<String, dynamic> _$$RescheduledClassImplToJson(
        _$RescheduledClassImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batch_id': instance.batchId,
      'old_date': instance.oldDate?.toIso8601String(),
      'old_start_time': instance.oldStartTime,
      'old_end_time': instance.oldEndTime,
      'new_date': instance.newDate?.toIso8601String(),
      'new_start_time': instance.newStartTime,
      'new_end_time': instance.newEndTime,
      'rescheduled_by_type': instance.rescheduledByType,
      'rescheduled_by_id': instance.rescheduledById,
      'cancelled_date': instance.cancelledDate,
      'cancelled_start_time': instance.cancelledStartTime,
      'cancelled_end_time': instance.cancelledEndTime,
    };
