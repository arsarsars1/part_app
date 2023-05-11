// To parse this JSON data, do
//
//     final attendanceMonthlyRecord = attendanceMonthlyRecordFromJson(jsonString);

import 'dart:convert';

AttendanceMonthlyRecord attendanceMonthlyRecordFromJson(String str) => AttendanceMonthlyRecord.fromJson(json.decode(str));

String attendanceMonthlyRecordToJson(AttendanceMonthlyRecord data) => json.encode(data.toJson());

class AttendanceMonthlyRecord {
  List<StudentAttendance>? studentAttendances;
  int? conductedClassCount;
  int? status;

  AttendanceMonthlyRecord({
    this.studentAttendances,
    this.conductedClassCount,
    this.status,
  });

  factory AttendanceMonthlyRecord.fromJson(Map<String, dynamic> json) => AttendanceMonthlyRecord(
    studentAttendances: json["student_attendances"] == null ? [] : List<StudentAttendance>.from(json["student_attendances"]!.map((x) => StudentAttendance.fromJson(x))),
    conductedClassCount: json["conducted_class_count"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "student_attendances": studentAttendances == null ? [] : List<dynamic>.from(studentAttendances!.map((x) => x.toJson())),
    "conducted_class_count": conductedClassCount,
    "status": status,
  };
}

class StudentAttendance {
  int? studentDetailId;
  String? feeType;
  String? name;
  int? total;
  int? present;

  StudentAttendance({
    this.studentDetailId,
    this.feeType,
    this.name,
    this.total,
    this.present,
  });

  factory StudentAttendance.fromJson(Map<String, dynamic> json) => StudentAttendance(
    studentDetailId: json["student_detail_id"],
    feeType: json["fee_type"],
    name: json["name"],
    total: json["total"],
    present: json["present"],
  );

  Map<String, dynamic> toJson() => {
    "student_detail_id": studentDetailId,
    "fee_type": feeType,
    "name": name,
    "total": total,
    "present": present,
  };
}