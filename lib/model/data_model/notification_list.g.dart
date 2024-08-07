// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationListImpl _$$NotificationListImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationListImpl(
      status: (json['status'] as num?)?.toInt(),
      notifications: json['notifications'] == null
          ? null
          : Notifications.fromJson(
              json['notifications'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NotificationListImplToJson(
        _$NotificationListImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'notifications': instance.notifications,
    };

_$NotificationsImpl _$$NotificationsImplFromJson(Map<String, dynamic> json) =>
    _$NotificationsImpl(
      currentPage: (json['current_page'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationData.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: (json['from'] as num?)?.toInt(),
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String?,
      perPage: (json['per_page'] as num?)?.toInt(),
      prevPageUrl: json['prev_page_url'],
      to: (json['to'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NotificationsImplToJson(_$NotificationsImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
    };

_$NotificationDataImpl _$$NotificationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationDataImpl(
      id: json['id'] as String?,
      screen: json['screen'] as String?,
      entityType: json['entity_type'] as String?,
      entityId: (json['entity_id'] as num?)?.toInt(),
      type: json['type'] as String?,
      notifiableType: json['notifiable_type'] as String?,
      notifiableId: (json['notifiable_id'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      addedOn: json['added_on'] == null
          ? null
          : DateTime.parse(json['added_on'] as String),
      readAt: json['read_at'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$NotificationDataImplToJson(
        _$NotificationDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'screen': instance.screen,
      'entity_type': instance.entityType,
      'entity_id': instance.entityId,
      'type': instance.type,
      'notifiable_type': instance.notifiableType,
      'notifiable_id': instance.notifiableId,
      'data': instance.data,
      'added_on': instance.addedOn?.toIso8601String(),
      'read_at': instance.readAt,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      title: json['title'] as String?,
      message: json['message'] as String?,
      screen: json['screen'] as String?,
      entityType: json['entity_type'] as String?,
      entityId: (json['entity_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'screen': instance.screen,
      'entity_type': instance.entityType,
      'entity_id': instance.entityId,
    };
