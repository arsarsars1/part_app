// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_link_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClassLinkResponse _$$_ClassLinkResponseFromJson(Map<String, dynamic> json) =>
    _$_ClassLinkResponse(
      status: json['status'] as int?,
      classLinks: (json['class_links'] as List<dynamic>?)
          ?.map((e) => ClassLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ClassLinkResponseToJson(
        _$_ClassLinkResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'class_links': instance.classLinks,
    };

_$_ClassLink _$$_ClassLinkFromJson(Map<String, dynamic> json) => _$_ClassLink(
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
    );

Map<String, dynamic> _$$_ClassLinkToJson(_$_ClassLink instance) =>
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
    };
