// To parse this JSON data, do
//
//     final notificationList = notificationListFromJson(jsonString);

import 'dart:convert';

NotificationList notificationListFromJson(String str) => NotificationList.fromJson(json.decode(str));

String notificationListToJson(NotificationList data) => json.encode(data.toJson());

class NotificationList {
    int? status;
    List<NotificationData>? notifications;

    NotificationList({
        this.status,
        this.notifications,
    });

    factory NotificationList.fromJson(Map<String, dynamic> json) => NotificationList(
        status: json["status"],
        notifications: json["notifications"] == null ? [] : List<NotificationData>.from(json["notifications"]!.map((x) => NotificationData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "notifications": notifications == null ? [] : List<dynamic>.from(notifications!.map((x) => x.toJson())),
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
        readAt: json["read_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
