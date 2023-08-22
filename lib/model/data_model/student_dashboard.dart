// To parse this JSON data, do
//
//     final studentDashboard = studentDashboardFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'student_dashboard.freezed.dart';
part 'student_dashboard.g.dart';

StudentDashboard studentDashboardFromJson(String str) =>
    StudentDashboard.fromJson(json.decode(str));

String studentDashboardToJson(StudentDashboard data) =>
    json.encode(data.toJson());

@freezed
class StudentDashboard with _$StudentDashboard {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory StudentDashboard({
    List<ClassDetails>? classes,
    List<BatchFeeInvoice>? batchFeeInvoices,
    AdmissionFeeInvoice? admissionFeeInvoice,
    int? status,
  }) = _StudentDashboard;

  factory StudentDashboard.fromJson(Map<String, dynamic> json) =>
      _$StudentDashboardFromJson(json);
}

@freezed
class AdmissionFeeInvoice with _$AdmissionFeeInvoice {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AdmissionFeeInvoice({
    int? id,
    int? studentDetailId,
    int? academyId,
    int? branchId,
    String? branchName,
    int? batchId,
    String? batchName,
    String? courseName,
    String? subjectName,
    String? payableAmount,
    int? reminderCount,
    int? writtenOffStatus,
    dynamic writtenOffDate,
    String? writtenOffAmount,
    dynamic writtenOffRemarks,
    dynamic writeOffByType,
    dynamic writeOffById,
    String? paymentStatus,
    String? feeType,
    String? currency,
    String? currencyCode,
    String? currencySymbol,
    String? pendingAmount,
    dynamic writeOffBy,
    StudentDetail? studentDetail,
    List<dynamic>? payments,
    List<dynamic>? paymentsTotal,
    Batch? batch,
  }) = _AdmissionFeeInvoice;

  factory AdmissionFeeInvoice.fromJson(Map<String, dynamic> json) =>
      _$AdmissionFeeInvoiceFromJson(json);
}

@freezed
class Batch with _$Batch {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Batch({
    int? id,
    String? batchName,
    int? academyId,
    int? branchId,
    int? courseId,
    int? subjectId,
    String? batchStatus,
    int? feeAmount,
    int? admissionFees,
    int? isActive,
    List<BatchDetail>? batchDetail,
    List<Trainer>? trainers,
    Course? course,
    Subject? subject,
    Branch? branch,
  }) = _Batch;

  factory Batch.fromJson(Map<String, dynamic> json) => _$BatchFromJson(json);
}

@freezed
class BatchDetail with _$BatchDetail {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BatchDetail({
    int? id,
    int? batchId,
    int? day,
    String? startTime,
    String? endTime,
    int? isActive,
  }) = _BatchDetail;

  factory BatchDetail.fromJson(Map<String, dynamic> json) =>
      _$BatchDetailFromJson(json);
}

@freezed
class Branch with _$Branch {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Branch({
    int? id,
    String? branchName,
    String? address,
    int? pincode,
    String? currency,
    int? stateId,
    int? districtId,
    int? countryId,
    Country? country,
    StateDetails? state,
    District? district,
    Timezone? timezone,
    int? academyId,
    int? managerDetailId,
    int? isActive,
    Pivot? pivot,
  }) = _Branch;

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);
}

@freezed
class Country with _$Country {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Country({
    int? id,
    String? name,
    String? currency,
    String? currencySymbol,
    String? currencyCode,
    String? timezone,
    String? currencySubUnit,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

@freezed
class District with _$District {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory District({
    int? id,
    String? districtName,
  }) = _District;

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
}

@freezed
class Pivot with _$Pivot {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Pivot({
    int? trainerDetailId,
    int? branchId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? batchId,
  }) = _Pivot;

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);
}

@freezed
class StateDetails with _$StateDetails {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory StateDetails({
    int? id,
    String? stateName,
  }) = _StateDetails;

  factory StateDetails.fromJson(Map<String, dynamic> json) =>
      _$StateDetailsFromJson(json);
}

@freezed
class Timezone with _$Timezone {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Timezone({
    int? id,
    String? timezone,
  }) = _Timezone;

  factory Timezone.fromJson(Map<String, dynamic> json) =>
      _$TimezoneFromJson(json);
}

@freezed
class Course with _$Course {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Course({
    int? id,
    int? academyTypeId,
    String? courseName,
    int? isActive,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}

@freezed
class Subject with _$Subject {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Subject({
    int? id,
    int? courseId,
    String? subjectName,
    int? isActive,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}

@freezed
class Trainer with _$Trainer {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Trainer({
    int? id,
    String? name,
    int? userId,
    int? academyId,
    String? gender,
    dynamic dob,
    DateTime? doj,
    dynamic whatsappNo,
    String? email,
    dynamic upiId,
    String? salaryType,
    int? salaryDate,
    int? salaryAmount,
    dynamic expertise,
    String? address,
    String? profilePic,
    String? document1,
    String? document2,
    int? isActive,
    Pivot? pivot,
    List<Branch>? branches,
  }) = _Trainer;

  factory Trainer.fromJson(Map<String, dynamic> json) =>
      _$TrainerFromJson(json);
}

@freezed
class StudentDetail with _$StudentDetail {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory StudentDetail({
    int? id,
    String? name,
    dynamic parentName,
    int? userId,
    int? academyId,
    String? gender,
    DateTime? dob,
    DateTime? doj,
    String? email,
    String? whatsappNo,
    String? address,
    String? profilePic,
    int? isActive,
  }) = _StudentDetail;

  factory StudentDetail.fromJson(Map<String, dynamic> json) =>
      _$StudentDetailFromJson(json);
}

@freezed
class BatchFeeInvoice with _$BatchFeeInvoice {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BatchFeeInvoice({
    int? id,
    int? studentDetailId,
    int? academyId,
    int? branchId,
    String? branchName,
    int? batchId,
    String? batchName,
    String? courseName,
    String? subjectName,
    DateTime? paymentDueDate,
    String? payableAmount,
    int? reminderCount,
    int? writtenOffStatus,
    dynamic writtenOffDate,
    String? writtenOffAmount,
    dynamic writtenOffRemarks,
    dynamic writtenOffByType,
    dynamic writtenOffById,
    String? paymentStatus,
    String? feeType,
    int? month,
    int? year,
    String? currency,
    String? currencyCode,
    String? currencySymbol,
    int? cycle,
    int? monthClassesConductedCount,
    int? monthAttendancePresentCount,
    int? cycleAttendancePresentCount,
    String? pendingAmount,
    dynamic totalNoOfClasses,
    dynamic writtenOffBy,
    StudentDetail? studentDetail,
    List<dynamic>? payments,
    Batch? batch,
  }) = _BatchFeeInvoice;

  factory BatchFeeInvoice.fromJson(Map<String, dynamic> json) =>
      _$BatchFeeInvoiceFromJson(json);
}

@freezed
class ClassDetails with _$ClassDetails {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ClassDetails({
    String? status,
    int? batchId,
    String? batchName,
    String? branchName,
    String? startTime,
    String? endTime,
    String? timezone,
    List<String>? trainers,
    bool? rescheduled,
    dynamic classLink,
  }) = _ClassDetails;

  factory ClassDetails.fromJson(Map<String, dynamic> json) =>
      _$ClassDetailsFromJson(json);
}
