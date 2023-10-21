// To parse this JSON data, do
//
//     final studentAppCalenderEvents = studentAppCalenderEventsFromJson(jsonString);

import 'dart:convert';

StudentAppCalenderEvents studentAppCalenderEventsFromJson(String str) =>
    StudentAppCalenderEvents.fromJson(json.decode(str));

String studentAppCalenderEventsToJson(StudentAppCalenderEvents data) =>
    json.encode(data.toJson());

class StudentAppCalenderEvents {
  List<Class>? scheduledClasses;
  List<Class>? rescheduledClasses;
  List<Class>? rescheduledFromClasses;
  List<Class>? cancelledClasses;
  List<dynamic>? dueInvoices;
  List<dynamic>? payments;
  int? status;

  StudentAppCalenderEvents({
    this.scheduledClasses,
    this.rescheduledClasses,
    this.rescheduledFromClasses,
    this.cancelledClasses,
    this.dueInvoices,
    this.payments,
    this.status,
  });

  factory StudentAppCalenderEvents.fromJson(Map<String, dynamic> json) =>
      StudentAppCalenderEvents(
        scheduledClasses: json["scheduled_classes"] == null
            ? []
            : List<Class>.from(
                json["scheduled_classes"]!.map((x) => Class.fromJson(x))),
        rescheduledClasses: json["rescheduled_classes"] == null
            ? []
            : List<Class>.from(
                json["rescheduled_classes"]!.map((x) => Class.fromJson(x))),
        rescheduledFromClasses: json["rescheduled_from_classes"] == null
            ? []
            : List<Class>.from(json["rescheduled_from_classes"]!
                .map((x) => Class.fromJson(x))),
        cancelledClasses: json["cancelled_classes"] == null
            ? []
            : List<Class>.from(
                json["cancelled_classes"]!.map((x) => Class.fromJson(x))),
        dueInvoices: json["due_invoices"] == null
            ? []
            : List<dynamic>.from(json["due_invoices"]!.map((x) => x)),
        payments: json["payments"] == null
            ? []
            : List<dynamic>.from(json["payments"]!.map((x) => x)),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "scheduled_classes": scheduledClasses == null
            ? []
            : List<Class>.from(scheduledClasses!.map((x) => x.toJson())),
        "rescheduled_classes": rescheduledClasses == null
            ? []
            : List<Class>.from(rescheduledClasses!.map((x) => x.toJson())),
        "rescheduled_from_classes": rescheduledFromClasses == null
            ? []
            : List<Class>.from(rescheduledFromClasses!.map((x) => x)),
        "cancelled_classes": cancelledClasses == null
            ? []
            : List<Class>.from(cancelledClasses!.map((x) => x)),
        "due_invoices": dueInvoices == null
            ? []
            : List<dynamic>.from(dueInvoices!.map((x) => x)),
        "payments":
            payments == null ? [] : List<dynamic>.from(payments!.map((x) => x)),
        "status": status,
      };
}

class Class {
  String? startTime;
  String? endTime;
  bool? rescheduled;
  DateTime? oldDate;
  DateTime? newDate;
  String? oldStartTime;
  String? oldEndTime;
  int? batchId;
  String? batchName;
  int? activeStudentsCount;
  int? inactiveStudentsCount;
  String? courseName;
  String? subjectName;
  String? branchName;
  bool? conducted;
  String? classLink;
  String? trainers;
  BatchDetail? batchDetail;

  Class({
    this.startTime,
    this.endTime,
    this.rescheduled,
    this.oldDate,
    this.newDate,
    this.oldStartTime,
    this.oldEndTime,
    this.batchId,
    this.batchName,
    this.activeStudentsCount,
    this.inactiveStudentsCount,
    this.courseName,
    this.subjectName,
    this.branchName,
    this.conducted,
    this.classLink,
    this.trainers,
    this.batchDetail,
  });

  factory Class.fromJson(Map<String, dynamic> json) => Class(
        startTime: json["start_time"],
        endTime: json["end_time"],
        rescheduled: json["rescheduled"],
        oldDate:
            json["old_date"] == null ? null : DateTime.parse(json["old_date"]),
        newDate:
            json["new_date"] == null ? null : DateTime.parse(json["new_date"]),
        oldStartTime: json["old_start_time"],
        oldEndTime: json["old_end_time"],
        batchId: json["batch_id"],
        batchName: json["batch_name"],
        activeStudentsCount: json["active_students_count"],
        inactiveStudentsCount: json["inactive_students_count"],
        courseName: json["course_name"],
        subjectName: json["subject_name"],
        branchName: json["branch_name"],
        conducted: json["conducted"],
        classLink: json["class_link"],
        trainers: json["trainers"],
        batchDetail: json["batch_detail"] == null
            ? null
            : BatchDetail.fromJson(json["batch_detail"]),
      );

  Map<String, dynamic> toJson() => {
        "start_time": startTime,
        "end_time": endTime,
        "rescheduled": rescheduled,
        "old_date":
            "${oldDate!.year.toString().padLeft(4, '0')}-${oldDate!.month.toString().padLeft(2, '0')}-${oldDate!.day.toString().padLeft(2, '0')}",
        "new_date":
            "${newDate!.year.toString().padLeft(4, '0')}-${newDate!.month.toString().padLeft(2, '0')}-${newDate!.day.toString().padLeft(2, '0')}",
        "old_start_time": oldStartTime,
        "old_end_time": oldEndTime,
        "batch_id": batchId,
        "batch_name": batchName,
        "active_students_count": activeStudentsCount,
        "inactive_students_count": inactiveStudentsCount,
        "course_name": courseName,
        "subject_name": subjectName,
        "branch_name": branchName,
        "conducted": conducted,
        "class_link": classLink,
        "trainers": trainers,
        "batch_detail": batchDetail?.toJson(),
      };
}

class BatchDetail {
  int? id;
  int? batchId;
  int? day;
  String? startTime;
  String? endTime;
  int? isActive;

  BatchDetail({
    this.id,
    this.batchId,
    this.day,
    this.startTime,
    this.endTime,
    this.isActive,
  });

  factory BatchDetail.fromJson(Map<String, dynamic> json) => BatchDetail(
        id: json["id"],
        batchId: json["batch_id"],
        day: json["day"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "batch_id": batchId,
        "day": day,
        "start_time": startTime,
        "end_time": endTime,
        "is_active": isActive,
      };
}
