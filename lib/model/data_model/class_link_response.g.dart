// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_link_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClassLinkResponseImpl _$$ClassLinkResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ClassLinkResponseImpl(
      status: json['status'] as int?,
      classLinks: (json['class_links'] as List<dynamic>?)
          ?.map((e) => ClassLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ClassLinkResponseImplToJson(
        _$ClassLinkResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'class_links': instance.classLinks,
    };

_$ClassLinkImpl _$$ClassLinkImplFromJson(Map<String, dynamic> json) =>
    _$ClassLinkImpl(
      id: json['id'] as int?,
      batchId: json['batch_id'] as int?,
      link: json['link'] as String?,
      service: json['service'] as String?,
      classDate: json['class_date'] == null
          ? null
          : DateTime.parse(json['class_date'] as String),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      addedByType: json['added_by_type'] as String?,
      addedById: json['added_by_id'] as int?,
      batchName: json['batch_name'] as String?,
      branchName: json['branch_name'] as String?,
      courseName: json['course_name'] as String?,
      subjectName: json['subject_name'] as String?,
    );

Map<String, dynamic> _$$ClassLinkImplToJson(_$ClassLinkImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batch_id': instance.batchId,
      'link': instance.link,
      'service': instance.service,
      'class_date': instance.classDate?.toIso8601String(),
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'added_by_type': instance.addedByType,
      'added_by_id': instance.addedById,
      'batch_name': instance.batchName,
      'branch_name': instance.branchName,
      'course_name': instance.courseName,
      'subject_name': instance.subjectName,
    };
