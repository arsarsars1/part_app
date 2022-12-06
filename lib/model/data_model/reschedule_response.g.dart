// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reschedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RescheduleResponse _$$_RescheduleResponseFromJson(
        Map<String, dynamic> json) =>
    _$_RescheduleResponse(
      status: json['status'] as int?,
      rescheduledClasses: json['rescheduled_classes'] == null
          ? null
          : RescheduledClasses.fromJson(
              json['rescheduled_classes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RescheduleResponseToJson(
        _$_RescheduleResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'rescheduled_classes': instance.rescheduledClasses,
    };

_$_RescheduledClasses _$$_RescheduledClassesFromJson(
        Map<String, dynamic> json) =>
    _$_RescheduledClasses(
      currentPage: json['current_page'] as int?,
      batchDetails: (json['data'] as List<dynamic>?)
          ?.map((e) => BatchDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: json['from'] as int?,
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      to: json['to'] as int?,
    );

Map<String, dynamic> _$$_RescheduledClassesToJson(
        _$_RescheduledClasses instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.batchDetails,
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'path': instance.path,
      'per_page': instance.perPage,
      'to': instance.to,
    };
