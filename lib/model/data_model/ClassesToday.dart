// To parse this JSON data, do
//
//     final classesToday = classesTodayFromJson(jsonString);

import 'dart:convert';

ClassesToday classesTodayFromJson(String str) => ClassesToday.fromJson(json.decode(str));

String classesTodayToJson(ClassesToday data) => json.encode(data.toJson());

class ClassesToday {
  int? status;
  List<Class>? classes;

  ClassesToday({
    this.status,
    this.classes,
  });

  factory ClassesToday.fromJson(Map<String, dynamic> json) => ClassesToday(
    status: json["status"],
    classes: json["classes"] == null ? [] : List<Class>.from(json["classes"]!.map((x) => Class.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "classes": classes == null ? [] : List<dynamic>.from(classes!.map((x) => x.toJson())),
  };
}

class Class {
  String? startTime;
  String? endTime;
  bool? rescheduled;
  DateTime? oldDate;
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
    oldDate: json["old_date"] == null ? null : DateTime.parse(json["old_date"]),
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
    "old_date": "${oldDate!.year.toString().padLeft(4, '0')}-${oldDate!.month.toString().padLeft(2, '0')}-${oldDate!.day.toString().padLeft(2, '0')}",
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