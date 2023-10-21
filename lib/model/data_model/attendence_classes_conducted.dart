// To parse this JSON data, do
//
//     final attendenceConductedClass = attendenceConductedClassFromJson(jsonString);

import 'dart:convert';

AttendenceConductedClass attendenceConductedClassFromJson(String str) => AttendenceConductedClass.fromJson(json.decode(str));

String attendenceConductedClassToJson(AttendenceConductedClass data) => json.encode(data.toJson());

class AttendenceConductedClass {
    ConductedClasses conductedClasses;
    int status;

    AttendenceConductedClass({
        required this.conductedClasses,
        required this.status,
    });

    factory AttendenceConductedClass.fromJson(Map<String, dynamic> json) => AttendenceConductedClass(
        conductedClasses: ConductedClasses.fromJson(json["conducted_classes"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "conducted_classes": conductedClasses.toJson(),
        "status": status,
    };
}

class ConductedClasses {
    int currentPage;
    List<ConductedClass> data;
    String firstPageUrl;
    int from;
    dynamic nextPageUrl;
    String path;
    int perPage;
    dynamic prevPageUrl;
    int to;

    ConductedClasses({
        required this.currentPage,
        required this.data,
        required this.firstPageUrl,
        required this.from,
        this.nextPageUrl,
        required this.path,
        required this.perPage,
        this.prevPageUrl,
        required this.to,
    });

    factory ConductedClasses.fromJson(Map<String, dynamic> json) => ConductedClasses(
        currentPage: json["current_page"],
        data: List<ConductedClass>.from(json["data"].map((x) => ConductedClass.fromJson(x))),
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
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
    };
}

class ConductedClass {
    int id;
    int batchId;
    String takenByType;
    int takenById;
    dynamic updatedByType;
    dynamic updatedById;
    DateTime conductedOn;
    String startTime;
    String endTime;
    DateTime createdAt;
    DateTime updatedAt;
    TakenBy takenBy;
    dynamic updatedBy;

    ConductedClass({
        required this.id,
        required this.batchId,
        required this.takenByType,
        required this.takenById,
        this.updatedByType,
        this.updatedById,
        required this.conductedOn,
        required this.startTime,
        required this.endTime,
        required this.createdAt,
        required this.updatedAt,
        required this.takenBy,
        this.updatedBy,
    });

    factory ConductedClass.fromJson(Map<String, dynamic> json) => ConductedClass(
        id: json["id"],
        batchId: json["batch_id"],
        takenByType: json["taken_by_type"],
        takenById: json["taken_by_id"],
        updatedByType: json["updated_by_type"],
        updatedById: json["updated_by_id"],
        conductedOn: DateTime.parse(json["conducted_on"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        takenBy: TakenBy.fromJson(json["taken_by"]),
        updatedBy: json["updated_by"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "batch_id": batchId,
        "taken_by_type": takenByType,
        "taken_by_id": takenById,
        "updated_by_type": updatedByType,
        "updated_by_id": updatedById,
        "conducted_on": "${conductedOn.year.toString().padLeft(4, '0')}-${conductedOn.month.toString().padLeft(2, '0')}-${conductedOn.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "taken_by": takenBy.toJson(),
        "updated_by": updatedBy,
    };
}

class TakenBy {
    int id;
    String name;

    TakenBy({
        required this.id,
        required this.name,
    });

    factory TakenBy.fromJson(Map<String, dynamic> json) => TakenBy(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
