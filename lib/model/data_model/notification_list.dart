// To parse this JSON data, do
//
//     final notificationList = notificationListFromJson(jsonString);

import 'dart:convert';

NotificationList notificationListFromJson(String str) =>
    NotificationList.fromJson(json.decode(str));

String notificationListToJson(NotificationList data) =>
    json.encode(data.toJson());

class NotificationList {
  int? status;
  Notifications? notifications;

  NotificationList({
    this.status,
    this.notifications,
  });

  factory NotificationList.fromJson(Map<String, dynamic> json) =>
      NotificationList(
        status: json["status"],
        notifications: json["notifications"] == null
            ? null
            : Notifications.fromJson(json["notifications"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "notifications": notifications?.toJson(),
      };
}

class Notifications {
  int? currentPage;
  List<NotificationData>? data;
  String? firstPageUrl;
  int? from;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;

  Notifications({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<NotificationData>.from(json["data"]!.map((x) => NotificationData.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
      };
}

class NotificationData {
  String? id;
  String? screen;
  String? entityType;
  int? entityId;
  String? type;
  String? notifiableType;
  int? notifiableId;
  Data? data;
  DateTime? addedOn;
  dynamic readAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  NotificationData({
    this.id,
    this.screen,
    this.entityType,
    this.entityId,
    this.type,
    this.notifiableType,
    this.notifiableId,
    this.data,
    this.addedOn,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) => NotificationData(
        id: json["id"],
        screen: json["screen"],
        entityType: json["entity_type"],
        entityId: json["entity_id"],
        type: json["type"],
        notifiableType: json["notifiable_type"],
        notifiableId: json["notifiable_id"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        addedOn:
            json["added_on"] == null ? null : DateTime.parse(json["added_on"]),
        readAt: json["read_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "screen": screen,
        "entity_type": entityType,
        "entity_id": entityId,
        "type": type,
        "notifiable_type": notifiableType,
        "notifiable_id": notifiableId,
        "data": data?.toJson(),
        "added_on": addedOn?.toIso8601String(),
        "read_at": readAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Data {
  String? title;
  String? message;
  String? screen;
  String? entityType;
  int? entityId;

  Data({
    this.title,
    this.message,
    this.screen,
    this.entityType,
    this.entityId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        message: json["message"],
        screen: json["screen"],
        entityType: json["entity_type"],
        entityId: json["entity_id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "message": message,
        "screen": screen,
        "entity_type": entityType,
        "entity_id": entityId,
      };
}
