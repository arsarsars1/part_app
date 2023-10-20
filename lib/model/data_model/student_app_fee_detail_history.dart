// To parse this JSON data, do
//
//     final studentAppFeeDetailHistory = studentAppFeeDetailHistoryFromJson(jsonString);

import 'dart:convert';

StudentAppFeeDetailHistory studentAppFeeDetailHistoryFromJson(String str) =>
    StudentAppFeeDetailHistory.fromJson(json.decode(str));

String studentAppFeeDetailHistoryToJson(StudentAppFeeDetailHistory data) =>
    json.encode(data.toJson());

class StudentAppFeeDetailHistory {
  int? status;
  BatchFeeInvoices? batchFeeInvoices;

  StudentAppFeeDetailHistory({
    this.status,
    this.batchFeeInvoices,
  });

  factory StudentAppFeeDetailHistory.fromJson(Map<String, dynamic> json) =>
      StudentAppFeeDetailHistory(
        status: json["status"],
        batchFeeInvoices: json["batch_fee_invoices"] == null
            ? null
            : BatchFeeInvoices.fromJson(json["batch_fee_invoices"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "batch_fee_invoices": batchFeeInvoices?.toJson(),
      };
}

class BatchFeeInvoices {
  int? currentPage;
  List<Invoice>? data;
  String? firstPageUrl;
  int? from;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;

  BatchFeeInvoices({
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

  factory BatchFeeInvoices.fromJson(Map<String, dynamic> json) =>
      BatchFeeInvoices(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<Invoice>.from(json["data"]!.map((x) => Invoice.fromJson(x))),
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

class Invoice {
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
  dynamic totalNoOfClasses;
  dynamic writtenOffBy;
  StudentDetail? studentDetail;
  List<Payment>? payments;

  Invoice({
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
  });

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
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
            : List<Payment>.from(
                json["payments"]!.map((x) => Payment.fromJson(x))),
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
        "payments": payments == null
            ? []
            : List<dynamic>.from(payments!.map((x) => x.toJson())),
      };
}

class Payment {
  int? id;
  int? batchFeeInvoiceId;
  DateTime? paymentDate;
  String? collectedByType;
  int? collectedById;
  String? amount;
  String? paymentMethod;
  dynamic transactionId;
  dynamic chequeNumber;
  int? isEdited;
  int? isDeleted;
  dynamic deletedByType;
  dynamic deletedById;
  CollectedBy? collectedBy;
  dynamic deletedBy;
  List<dynamic>? edits;

  Payment({
    this.id,
    this.batchFeeInvoiceId,
    this.paymentDate,
    this.collectedByType,
    this.collectedById,
    this.amount,
    this.paymentMethod,
    this.transactionId,
    this.chequeNumber,
    this.isEdited,
    this.isDeleted,
    this.deletedByType,
    this.deletedById,
    this.collectedBy,
    this.deletedBy,
    this.edits,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        batchFeeInvoiceId: json["batch_fee_invoice_id"],
        paymentDate: json["payment_date"] == null
            ? null
            : DateTime.parse(json["payment_date"]),
        collectedByType: json["collected_by_type"],
        collectedById: json["collected_by_id"],
        amount: json["amount"],
        paymentMethod: json["payment_method"],
        transactionId: json["transaction_id"],
        chequeNumber: json["cheque_number"],
        isEdited: json["is_edited"],
        isDeleted: json["is_deleted"],
        deletedByType: json["deleted_by_type"],
        deletedById: json["deleted_by_id"],
        collectedBy: json["collected_by"] == null
            ? null
            : CollectedBy.fromJson(json["collected_by"]),
        deletedBy: json["deleted_by"],
        edits: json["edits"] == null
            ? []
            : List<dynamic>.from(json["edits"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "batch_fee_invoice_id": batchFeeInvoiceId,
        "payment_date":
            "${paymentDate!.year.toString().padLeft(4, '0')}-${paymentDate!.month.toString().padLeft(2, '0')}-${paymentDate!.day.toString().padLeft(2, '0')}",
        "collected_by_type": collectedByType,
        "collected_by_id": collectedById,
        "amount": amount,
        "payment_method": paymentMethod,
        "transaction_id": transactionId,
        "cheque_number": chequeNumber,
        "is_edited": isEdited,
        "is_deleted": isDeleted,
        "deleted_by_type": deletedByType,
        "deleted_by_id": deletedById,
        "collected_by": collectedBy?.toJson(),
        "deleted_by": deletedBy,
        "edits": edits == null ? [] : List<dynamic>.from(edits!.map((x) => x)),
      };
}

class CollectedBy {
  String? name;
  int? userId;
  int? id;

  CollectedBy({
    this.name,
    this.userId,
    this.id,
  });

  factory CollectedBy.fromJson(Map<String, dynamic> json) => CollectedBy(
        name: json["name"],
        userId: json["user_id"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "user_id": userId,
        "id": id,
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
