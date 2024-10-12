// To parse this JSON data, do
//
//     final studentDashboard = studentDashboardFromJson(jsonString);

import 'dart:convert';

import 'package:part_app/model/data_model/dashboard.dart';

StudentDashboard studentDashboardFromJson(String str) =>
    StudentDashboard.fromJson(json.decode(str));

String studentDashboardToJson(StudentDashboard data) =>
    json.encode(data.toJson());

class StudentDashboard {
  List<ClassDetails>? classes;
  List<BatchFeeInvoice>? batchFeeInvoices;
  List<AdmissionFeeInvoice>? admissionFeeInvoices;
  List<Banner>? banners;
  int? status;
  int? unreadNotificationsCount;

  StudentDashboard({
    this.classes,
    this.batchFeeInvoices,
    this.admissionFeeInvoices,
    this.status,
    this.banners,
    this.unreadNotificationsCount,
  });

  factory StudentDashboard.fromJson(Map<String, dynamic> json) =>
      StudentDashboard(
        classes: json["classes"] == null
            ? []
            : List<ClassDetails>.from(
                json["classes"]!.map((x) => ClassDetails.fromJson(x))),
        batchFeeInvoices: json["batch_fee_invoices"] == null
            ? []
            : List<BatchFeeInvoice>.from(json["batch_fee_invoices"]!
                .map((x) => BatchFeeInvoice.fromJson(x))),
        admissionFeeInvoices: json["admission_fee_invoices"] == null
            ? []
            : List<AdmissionFeeInvoice>.from(json["admission_fee_invoices"]!
                .map((x) => AdmissionFeeInvoice.fromJson(x))),
        banners: json["banners"] == null
            ? []
            : List<Banner>.from(
                json["banners"]!.map((x) => Banner.fromJson(x))),
        unreadNotificationsCount: json["unread_notifications_count"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "classes": classes == null
            ? []
            : List<dynamic>.from(classes!.map((x) => x.toJson())),
        "batch_fee_invoices": batchFeeInvoices == null
            ? []
            : List<dynamic>.from(batchFeeInvoices!.map((x) => x.toJson())),
        "admission_fee_invoices": admissionFeeInvoices == null
            ? []
            : List<dynamic>.from(admissionFeeInvoices!.map((x) => x.toJson())),
        "banners": banners == null
            ? []
            : List<dynamic>.from(banners!.map((x) => x.toJson())),
        "status": status,
        "unread_notifications_count": unreadNotificationsCount,
      };
}

class AdmissionFeeInvoice {
  int? id;
  int? studentDetailId;
  int? academyId;
  int? branchId;
  String? branchName;
  int? batchId;
  String? batchName;
  String? courseName;
  String? subjectName;
  String? payableAmount;
  int? reminderCount;
  int? writtenOffStatus;
  dynamic writtenOffDate;
  String? writtenOffAmount;
  dynamic writtenOffRemarks;
  dynamic writeOffByType;
  dynamic writeOffById;
  String? paymentStatus;
  String? feeType;
  String? currency;
  String? currencyCode;
  String? currencySymbol;
  String? pendingAmount;
  dynamic writeOffBy;
  StudentDetail? studentDetail;
  List<dynamic>? payments;
  List<dynamic>? paymentsTotal;
  Batch? batch;

  AdmissionFeeInvoice({
    this.id,
    this.studentDetailId,
    this.academyId,
    this.branchId,
    this.branchName,
    this.batchId,
    this.batchName,
    this.courseName,
    this.subjectName,
    this.payableAmount,
    this.reminderCount,
    this.writtenOffStatus,
    this.writtenOffDate,
    this.writtenOffAmount,
    this.writtenOffRemarks,
    this.writeOffByType,
    this.writeOffById,
    this.paymentStatus,
    this.feeType,
    this.currency,
    this.currencyCode,
    this.currencySymbol,
    this.pendingAmount,
    this.writeOffBy,
    this.studentDetail,
    this.payments,
    this.paymentsTotal,
    this.batch,
  });

  factory AdmissionFeeInvoice.fromJson(Map<String, dynamic> json) =>
      AdmissionFeeInvoice(
        id: json["id"],
        studentDetailId: json["student_detail_id"],
        academyId: json["academy_id"],
        branchId: json["branch_id"],
        branchName: json["branch_name"],
        batchId: json["batch_id"],
        batchName: json["batch_name"],
        courseName: json["course_name"],
        subjectName: json["subject_name"],
        payableAmount: json["payable_amount"],
        reminderCount: json["reminder_count"],
        writtenOffStatus: json["written_off_status"],
        writtenOffDate: json["written_off_date"],
        writtenOffAmount: json["written_off_amount"],
        writtenOffRemarks: json["written_off_remarks"],
        writeOffByType: json["write_off_by_type"],
        writeOffById: json["write_off_by_id"],
        paymentStatus: json["payment_status"],
        feeType: json["fee_type"],
        currency: json["currency"],
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        pendingAmount: json["pending_amount"],
        writeOffBy: json["write_off_by"],
        studentDetail: json["student_detail"] == null
            ? null
            : StudentDetail.fromJson(json["student_detail"]),
        payments: json["payments"] == null
            ? []
            : List<dynamic>.from(json["payments"]!.map((x) => x)),
        paymentsTotal: json["payments_total"] == null
            ? []
            : List<dynamic>.from(json["payments_total"]!.map((x) => x)),
        batch: json["batch"] == null ? null : Batch.fromJson(json["batch"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "student_detail_id": studentDetailId,
        "academy_id": academyId,
        "branch_id": branchId,
        "branch_name": branchName,
        "batch_id": batchId,
        "batch_name": batchName,
        "course_name": courseName,
        "subject_name": subjectName,
        "payable_amount": payableAmount,
        "reminder_count": reminderCount,
        "written_off_status": writtenOffStatus,
        "written_off_date": writtenOffDate,
        "written_off_amount": writtenOffAmount,
        "written_off_remarks": writtenOffRemarks,
        "write_off_by_type": writeOffByType,
        "write_off_by_id": writeOffById,
        "payment_status": paymentStatus,
        "fee_type": feeType,
        "currency": currency,
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "pending_amount": pendingAmount,
        "write_off_by": writeOffBy,
        "student_detail": studentDetail?.toJson(),
        "payments":
            payments == null ? [] : List<dynamic>.from(payments!.map((x) => x)),
        "payments_total": paymentsTotal == null
            ? []
            : List<dynamic>.from(paymentsTotal!.map((x) => x)),
        "batch": batch?.toJson(),
      };
}

class Batch {
  int? id;
  String? batchName;
  int? academyId;
  int? branchId;
  int? courseId;
  int? subjectId;
  String? batchStatus;
  int? feeAmount;
  int? admissionFees;
  int? isActive;
  List<BatchDetail>? batchDetail;
  List<Trainer>? trainers;
  Course? course;
  Subject? subject;
  Branch? branch;

  Batch({
    this.id,
    this.batchName,
    this.academyId,
    this.branchId,
    this.courseId,
    this.subjectId,
    this.batchStatus,
    this.feeAmount,
    this.admissionFees,
    this.isActive,
    this.batchDetail,
    this.trainers,
    this.course,
    this.subject,
    this.branch,
  });

  factory Batch.fromJson(Map<String, dynamic> json) => Batch(
        id: json["id"],
        batchName: json["batch_name"],
        academyId: json["academy_id"],
        branchId: json["branch_id"],
        courseId: json["course_id"],
        subjectId: json["subject_id"],
        batchStatus: json["batch_status"],
        feeAmount: json["fee_amount"],
        admissionFees: json["admission_fees"],
        isActive: json["is_active"],
        batchDetail: json["batch_detail"] == null
            ? []
            : List<BatchDetail>.from(
                json["batch_detail"]!.map((x) => BatchDetail.fromJson(x))),
        trainers: json["trainers"] == null
            ? []
            : List<Trainer>.from(
                json["trainers"]!.map((x) => Trainer.fromJson(x))),
        course: json["course"] == null ? null : Course.fromJson(json["course"]),
        subject:
            json["subject"] == null ? null : Subject.fromJson(json["subject"]),
        branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "batch_name": batchName,
        "academy_id": academyId,
        "branch_id": branchId,
        "course_id": courseId,
        "subject_id": subjectId,
        "batch_status": batchStatus,
        "fee_amount": feeAmount,
        "admission_fees": admissionFees,
        "is_active": isActive,
        "batch_detail": batchDetail == null
            ? []
            : List<dynamic>.from(batchDetail!.map((x) => x.toJson())),
        "trainers": trainers == null
            ? []
            : List<dynamic>.from(trainers!.map((x) => x.toJson())),
        "course": course?.toJson(),
        "subject": subject?.toJson(),
        "branch": branch?.toJson(),
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

class Branch {
  int? id;
  String? branchName;
  String? address;
  int? pincode;
  String? currency;
  int? stateId;
  int? districtId;
  int? countryId;
  Country? country;
  StateDetails? state;
  District? district;
  Timezone? timezone;
  int? academyId;
  dynamic managerDetailId;
  int? isActive;
  Pivot? pivot;

  Branch({
    this.id,
    this.branchName,
    this.address,
    this.pincode,
    this.currency,
    this.stateId,
    this.districtId,
    this.countryId,
    this.country,
    this.state,
    this.district,
    this.timezone,
    this.academyId,
    this.managerDetailId,
    this.isActive,
    this.pivot,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        branchName: json["branch_name"],
        address: json["address"],
        pincode: json["pincode"],
        currency: json["currency"],
        stateId: json["state_id"],
        districtId: json["district_id"],
        countryId: json["country_id"],
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
        state:
            json["state"] == null ? null : StateDetails.fromJson(json["state"]),
        district: json["district"] == null
            ? null
            : District.fromJson(json["district"]),
        timezone: json["timezone"] == null
            ? null
            : Timezone.fromJson(json["timezone"]),
        academyId: json["academy_id"],
        managerDetailId: json["manager_detail_id"],
        isActive: json["is_active"],
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "branch_name": branchName,
        "address": address,
        "pincode": pincode,
        "currency": currency,
        "state_id": stateId,
        "district_id": districtId,
        "country_id": countryId,
        "country": country?.toJson(),
        "state": state?.toJson(),
        "district": district?.toJson(),
        "timezone": timezone?.toJson(),
        "academy_id": academyId,
        "manager_detail_id": managerDetailId,
        "is_active": isActive,
        "pivot": pivot?.toJson(),
      };
}

class Country {
  int? id;
  String? name;
  String? currency;
  String? currencySymbol;
  String? currencyCode;
  String? timezone;
  String? currencySubUnit;

  Country({
    this.id,
    this.name,
    this.currency,
    this.currencySymbol,
    this.currencyCode,
    this.timezone,
    this.currencySubUnit,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        currency: json["currency"],
        currencySymbol: json["currency_symbol"],
        currencyCode: json["currency_code"],
        timezone: json["timezone"],
        currencySubUnit: json["currency_sub_unit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "currency": currency,
        "currency_symbol": currencySymbol,
        "currency_code": currencyCode,
        "timezone": timezone,
        "currency_sub_unit": currencySubUnit,
      };
}

class District {
  int? id;
  String? districtName;

  District({
    this.id,
    this.districtName,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"],
        districtName: json["district_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "district_name": districtName,
      };
}

class Pivot {
  int? trainerDetailId;
  int? branchId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? batchId;

  Pivot({
    this.trainerDetailId,
    this.branchId,
    this.createdAt,
    this.updatedAt,
    this.batchId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        trainerDetailId: json["trainer_detail_id"],
        branchId: json["branch_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        batchId: json["batch_id"],
      );

  Map<String, dynamic> toJson() => {
        "trainer_detail_id": trainerDetailId,
        "branch_id": branchId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "batch_id": batchId,
      };
}

class StateDetails {
  int? id;
  String? stateName;

  StateDetails({
    this.id,
    this.stateName,
  });

  factory StateDetails.fromJson(Map<String, dynamic> json) => StateDetails(
        id: json["id"],
        stateName: json["state_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "state_name": stateName,
      };
}

class Timezone {
  int? id;
  String? timezone;

  Timezone({
    this.id,
    this.timezone,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        id: json["id"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "timezone": timezone,
      };
}

class Course {
  int? id;
  int? academyTypeId;
  String? courseName;
  int? isActive;

  Course({
    this.id,
    this.academyTypeId,
    this.courseName,
    this.isActive,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        academyTypeId: json["academy_type_id"],
        courseName: json["course_name"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "academy_type_id": academyTypeId,
        "course_name": courseName,
        "is_active": isActive,
      };
}

class Subject {
  int? id;
  int? courseId;
  String? subjectName;
  int? isActive;

  Subject({
    this.id,
    this.courseId,
    this.subjectName,
    this.isActive,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        courseId: json["course_id"],
        subjectName: json["subject_name"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "subject_name": subjectName,
        "is_active": isActive,
      };
}

class Trainer {
  int? id;
  String? name;
  int? userId;
  int? academyId;
  String? gender;
  DateTime? dob;
  DateTime? doj;
  String? whatsappNo;
  String? email;
  String? upiId;
  String? salaryType;
  int? salaryDate;
  int? salaryAmount;
  String? expertise;
  String? address;
  String? profilePic;
  dynamic document1;
  dynamic document2;
  int? isActive;
  Pivot? pivot;
  List<Branch>? branches;

  Trainer({
    this.id,
    this.name,
    this.userId,
    this.academyId,
    this.gender,
    this.dob,
    this.doj,
    this.whatsappNo,
    this.email,
    this.upiId,
    this.salaryType,
    this.salaryDate,
    this.salaryAmount,
    this.expertise,
    this.address,
    this.profilePic,
    this.document1,
    this.document2,
    this.isActive,
    this.pivot,
    this.branches,
  });

  factory Trainer.fromJson(Map<String, dynamic> json) => Trainer(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        academyId: json["academy_id"],
        gender: json["gender"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        doj: json["doj"] == null ? null : DateTime.parse(json["doj"]),
        whatsappNo: json["whatsapp_no"],
        email: json["email"],
        upiId: json["upi_id"],
        salaryType: json["salary_type"],
        salaryDate: json["salary_date"],
        salaryAmount: json["salary_amount"],
        expertise: json["expertise"],
        address: json["address"],
        profilePic: json["profile_pic"],
        document1: json["document_1"],
        document2: json["document_2"],
        isActive: json["is_active"],
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
        branches: json["branches"] == null
            ? []
            : List<Branch>.from(
                json["branches"]!.map((x) => Branch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_id": userId,
        "academy_id": academyId,
        "gender": gender,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "doj":
            "${doj!.year.toString().padLeft(4, '0')}-${doj!.month.toString().padLeft(2, '0')}-${doj!.day.toString().padLeft(2, '0')}",
        "whatsapp_no": whatsappNo,
        "email": email,
        "upi_id": upiId,
        "salary_type": salaryType,
        "salary_date": salaryDate,
        "salary_amount": salaryAmount,
        "expertise": expertise,
        "address": address,
        "profile_pic": profilePic,
        "document_1": document1,
        "document_2": document2,
        "is_active": isActive,
        "pivot": pivot?.toJson(),
        "branches": branches == null
            ? []
            : List<dynamic>.from(branches!.map((x) => x.toJson())),
      };
}

class StudentDetail {
  int? id;
  String? name;
  String? parentName;
  int? userId;
  int? academyId;
  String? gender;
  DateTime? dob;
  DateTime? doj;
  String? email;
  String? whatsappNo;
  String? address;
  String? profilePic;
  int? isActive;

  StudentDetail({
    this.id,
    this.name,
    this.parentName,
    this.userId,
    this.academyId,
    this.gender,
    this.dob,
    this.doj,
    this.email,
    this.whatsappNo,
    this.address,
    this.profilePic,
    this.isActive,
  });

  factory StudentDetail.fromJson(Map<String, dynamic> json) => StudentDetail(
        id: json["id"],
        name: json["name"],
        parentName: json["parent_name"],
        userId: json["user_id"],
        academyId: json["academy_id"],
        gender: json["gender"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        doj: json["doj"] == null ? null : DateTime.parse(json["doj"]),
        email: json["email"],
        whatsappNo: json["whatsapp_no"],
        address: json["address"],
        profilePic: json["profile_pic"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_name": parentName,
        "user_id": userId,
        "academy_id": academyId,
        "gender": gender,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "doj":
            "${doj!.year.toString().padLeft(4, '0')}-${doj!.month.toString().padLeft(2, '0')}-${doj!.day.toString().padLeft(2, '0')}",
        "email": email,
        "whatsapp_no": whatsappNo,
        "address": address,
        "profile_pic": profilePic,
        "is_active": isActive,
      };
}

class BatchFeeInvoice {
  int? id;
  int? studentDetailId;
  int? academyId;
  int? branchId;
  String? branchName;
  int? batchId;
  String? batchName;
  String? courseName;
  String? subjectName;
  DateTime? paymentDueDate;
  String? payableAmount;
  int? reminderCount;
  int? writtenOffStatus;
  dynamic writtenOffDate;
  String? writtenOffAmount;
  dynamic writtenOffRemarks;
  dynamic writtenOffByType;
  dynamic writtenOffById;
  String? paymentStatus;
  String? feeType;
  int? month;
  int? year;
  String? currency;
  String? currencyCode;
  String? currencySymbol;
  int? cycle;
  int? monthClassesConductedCount;
  int? monthAttendancePresentCount;
  int? cycleAttendancePresentCount;
  String? pendingAmount;
  int? totalNoOfClasses;
  dynamic writtenOffBy;
  StudentDetail? studentDetail;
  List<dynamic>? payments;
  Batch? batch;

  BatchFeeInvoice({
    this.id,
    this.studentDetailId,
    this.academyId,
    this.branchId,
    this.branchName,
    this.batchId,
    this.batchName,
    this.courseName,
    this.subjectName,
    this.paymentDueDate,
    this.payableAmount,
    this.reminderCount,
    this.writtenOffStatus,
    this.writtenOffDate,
    this.writtenOffAmount,
    this.writtenOffRemarks,
    this.writtenOffByType,
    this.writtenOffById,
    this.paymentStatus,
    this.feeType,
    this.month,
    this.year,
    this.currency,
    this.currencyCode,
    this.currencySymbol,
    this.cycle,
    this.monthClassesConductedCount,
    this.monthAttendancePresentCount,
    this.cycleAttendancePresentCount,
    this.pendingAmount,
    this.totalNoOfClasses,
    this.writtenOffBy,
    this.studentDetail,
    this.payments,
    this.batch,
  });

  factory BatchFeeInvoice.fromJson(Map<String, dynamic> json) =>
      BatchFeeInvoice(
        id: json["id"],
        studentDetailId: json["student_detail_id"],
        academyId: json["academy_id"],
        branchId: json["branch_id"],
        branchName: json["branch_name"],
        batchId: json["batch_id"],
        batchName: json["batch_name"],
        courseName: json["course_name"],
        subjectName: json["subject_name"],
        paymentDueDate: json["payment_due_date"] == null
            ? null
            : DateTime.parse(json["payment_due_date"]),
        payableAmount: json["payable_amount"],
        reminderCount: json["reminder_count"],
        writtenOffStatus: json["written_off_status"],
        writtenOffDate: json["written_off_date"],
        writtenOffAmount: json["written_off_amount"],
        writtenOffRemarks: json["written_off_remarks"],
        writtenOffByType: json["written_off_by_type"],
        writtenOffById: json["written_off_by_id"],
        paymentStatus: json["payment_status"],
        feeType: json["fee_type"],
        month: json["month"],
        year: json["year"],
        currency: json["currency"],
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        cycle: json["cycle"],
        monthClassesConductedCount: json["month_classes_conducted_count"],
        monthAttendancePresentCount: json["month_attendance_present_count"],
        cycleAttendancePresentCount: json["cycle_attendance_present_count"],
        pendingAmount: json["pending_amount"],
        totalNoOfClasses: json["total_no_of_classes"],
        writtenOffBy: json["written_off_by"],
        studentDetail: json["student_detail"] == null
            ? null
            : StudentDetail.fromJson(json["student_detail"]),
        payments: json["payments"] == null
            ? []
            : List<dynamic>.from(json["payments"]!.map((x) => x)),
        batch: json["batch"] == null ? null : Batch.fromJson(json["batch"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "student_detail_id": studentDetailId,
        "academy_id": academyId,
        "branch_id": branchId,
        "branch_name": branchName,
        "batch_id": batchId,
        "batch_name": batchName,
        "course_name": courseName,
        "subject_name": subjectName,
        "payment_due_date":
            "${paymentDueDate!.year.toString().padLeft(4, '0')}-${paymentDueDate!.month.toString().padLeft(2, '0')}-${paymentDueDate!.day.toString().padLeft(2, '0')}",
        "payable_amount": payableAmount,
        "reminder_count": reminderCount,
        "written_off_status": writtenOffStatus,
        "written_off_date": writtenOffDate,
        "written_off_amount": writtenOffAmount,
        "written_off_remarks": writtenOffRemarks,
        "written_off_by_type": writtenOffByType,
        "written_off_by_id": writtenOffById,
        "payment_status": paymentStatus,
        "fee_type": feeType,
        "month": month,
        "year": year,
        "currency": currency,
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "cycle": cycle,
        "month_classes_conducted_count": monthClassesConductedCount,
        "month_attendance_present_count": monthAttendancePresentCount,
        "cycle_attendance_present_count": cycleAttendancePresentCount,
        "pending_amount": pendingAmount,
        "total_no_of_classes": totalNoOfClasses,
        "written_off_by": writtenOffBy,
        "student_detail": studentDetail?.toJson(),
        "payments":
            payments == null ? [] : List<dynamic>.from(payments!.map((x) => x)),
        "batch": batch?.toJson(),
      };
}

class ClassDetails {
  String? status;
  int? batchId;
  String? batchName;
  String? branchName;
  String? startTime;
  String? endTime;
  String? timezone;
  List<String>? trainers;
  bool? rescheduled;
  dynamic classLink;

  ClassDetails({
    this.status,
    this.batchId,
    this.batchName,
    this.branchName,
    this.startTime,
    this.endTime,
    this.timezone,
    this.trainers,
    this.rescheduled,
    this.classLink,
  });

  factory ClassDetails.fromJson(Map<String, dynamic> json) => ClassDetails(
        status: json["status"],
        batchId: json["batch_id"],
        batchName: json["batch_name"],
        branchName: json["branch_name"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        timezone: json["timezone"],
        trainers: json["trainers"] == null
            ? []
            : List<String>.from(json["trainers"]!.map((x) => x)),
        rescheduled: json["rescheduled"],
        classLink: json["class_link"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "batch_id": batchId,
        "batch_name": batchName,
        "branch_name": branchName,
        "start_time": startTime,
        "end_time": endTime,
        "timezone": timezone,
        "trainers":
            trainers == null ? [] : List<dynamic>.from(trainers!.map((x) => x)),
        "rescheduled": rescheduled,
        "class_link": classLink,
      };
}
