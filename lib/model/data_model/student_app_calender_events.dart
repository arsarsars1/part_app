// To parse this JSON data, do
//
//     final studentAppCalenderEvents = studentAppCalenderEventsFromJson(jsonString);

import 'dart:convert';

StudentAppCalenderEvents studentAppCalenderEventsFromJson(String str) =>
    StudentAppCalenderEvents.fromJson(json.decode(str));

String studentAppCalenderEventsToJson(StudentAppCalenderEvents data) =>
    json.encode(data.toJson());

class StudentAppCalenderEvents {
  List<Class>? classes;
  List<dynamic>? dueInvoices;
  List<dynamic>? payments;
  int? status;

  StudentAppCalenderEvents({
    this.classes,
    this.dueInvoices,
    this.payments,
    this.status,
  });

  factory StudentAppCalenderEvents.fromJson(Map<String, dynamic> json) =>
      StudentAppCalenderEvents(
        classes: json["classes"] == null
            ? []
            : List<Class>.from(json["classes"]!.map((x) => Class.fromJson(x))),
        dueInvoices: json["due_invoices"] == null
            ? []
            : List<dynamic>.from(json["due_invoices"]!.map((x) => x)),
        payments: json["payments"] == null
            ? []
            : List<dynamic>.from(json["payments"]!.map((x) => x)),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "classes": classes == null
            ? []
            : List<dynamic>.from(classes!.map((x) => x.toJson())),
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
  dynamic oldDate;
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

  Class({
    this.startTime,
    this.endTime,
    this.rescheduled,
    this.oldDate,
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
  });

  factory Class.fromJson(Map<String, dynamic> json) => Class(
        startTime: json["start_time"],
        endTime: json["end_time"],
        rescheduled: json["rescheduled"],
        oldDate: json["old_date"],
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
      );

  Map<String, dynamic> toJson() => {
        "start_time": startTime,
        "end_time": endTime,
        "rescheduled": rescheduled,
        "old_date": oldDate,
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
      };
}
