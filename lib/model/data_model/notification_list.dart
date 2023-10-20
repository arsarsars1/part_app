// To parse this JSON data, do
//
//     final notificationList = notificationListFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'notification_list.freezed.dart';
part 'notification_list.g.dart';

NotificationList notificationListFromJson(String str) =>
    NotificationList.fromJson(json.decode(str));

String notificationListToJson(NotificationList data) =>
    json.encode(data.toJson());

@freezed
class NotificationList with _$NotificationList {
  const factory NotificationList({
    int? status,
    Notifications? notifications,
  }) = _NotificationList;

  factory NotificationList.fromJson(Map<String, dynamic> json) =>
      _$NotificationListFromJson(json);
}

@freezed
class Notifications with _$Notifications {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Notifications({
    int? currentPage,
    List<NotificationData>? data,
    String? firstPageUrl,
    int? from,
    String? nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
  }) = _Notifications;

  factory Notifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsFromJson(json);
}

@freezed
class NotificationData with _$NotificationData {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NotificationData({
    String? id,
    String? screen,
    String? entityType,
    int? entityId,
    String? type,
    String? notifiableType,
    int? notifiableId,
    Data? data,
    DateTime? addedOn,
    dynamic readAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _NotificationData;

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);
}

@freezed
class Data with _$Data {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Data({
    String? title,
    String? message,
    String? screen,
    String? entityType,
    int? entityId,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
