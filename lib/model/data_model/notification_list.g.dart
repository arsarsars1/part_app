// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationList _$$_NotificationListFromJson(Map<String, dynamic> json) =>
    _$_NotificationList(
      status: json['status'] as int?,
      notifications: json['notifications'] == null
          ? null
          : Notifications.fromJson(
              json['notifications'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotificationListToJson(_$_NotificationList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'notifications': instance.notifications,
    };

_$_Notifications _$$_NotificationsFromJson(Map<String, dynamic> json) =>
    _$_Notifications(
      currentPage: json['current_page'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationData.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: json['from'] as int?,
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      prevPageUrl: json['prev_page_url'],
      to: json['to'] as int?,
    );

Map<String, dynamic> _$$_NotificationsToJson(_$_Notifications instance) =>
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

_$_NotificationData _$$_NotificationDataFromJson(Map<String, dynamic> json) =>
    _$_NotificationData(
      id: json['id'] as String?,
      screen: json['screen'] as String?,
      entityType: json['entity_type'] as String?,
      entityId: json['entity_id'] as int?,
      type: json['type'] as String?,
      notifiableType: json['notifiable_type'] as String?,
      notifiableId: json['notifiable_id'] as int?,
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

Map<String, dynamic> _$$_NotificationDataToJson(_$_NotificationData instance) =>
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

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      title: json['title'] as String?,
      message: json['message'] as String?,
      screen: json['screen'] as String?,
      entityType: json['entity_type'] as String?,
      entityId: json['entity_id'] as int?,
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'screen': instance.screen,
      'entity_type': instance.entityType,
      'entity_id': instance.entityId,
    };
