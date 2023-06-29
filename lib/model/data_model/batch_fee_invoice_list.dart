// To parse this JSON data, do
//
//     final batchFeeInvoiceList = batchFeeInvoiceListFromJson(jsonString);

import 'dart:convert';

BatchFeeInvoiceList batchFeeInvoiceListFromJson(String str) =>
    BatchFeeInvoiceList.fromJson(json.decode(str));

String batchFeeInvoiceListToJson(BatchFeeInvoiceList data) =>
    json.encode(data.toJson());

class BatchFeeInvoiceList {
  int? status;
  BatchFeeInvoices? batchFeeInvoices;

  BatchFeeInvoiceList({
    this.status,
    this.batchFeeInvoices,
  });

  factory BatchFeeInvoiceList.fromJson(Map<String, dynamic> json) =>
      BatchFeeInvoiceList(
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
  List<Datum>? data;
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
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
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

class Datum {
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
  int? payableAmount;
  int? reminderCount;
  int? writtenOffStatus;
  DateTime? writtenOffDate;
  int? writtenOffAmount;
  String? writtenOffRemarks;
  String? writtenOffByType;
  int? writtenOffById;
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
  int? pendingAmount;
  dynamic totalNoOfClasses;
  By? writtenOffBy;
  StudentDetail? studentDetail;
  List<Payment>? payments;
  List<PaymentsTotal>? paymentsTotal;

  Datum({
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
    this.paymentsTotal,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
        writtenOffDate: json["written_off_date"] == null
            ? null
            : DateTime.parse(json["written_off_date"]),
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
        writtenOffBy: json["written_off_by"] == null
            ? null
            : By.fromJson(json["written_off_by"]),
        studentDetail: json["student_detail"] == null
            ? null
            : StudentDetail.fromJson(json["student_detail"]),
        payments: json["payments"] == null
            ? []
            : List<Payment>.from(
                json["payments"]!.map((x) => Payment.fromJson(x))),
        paymentsTotal: json["payments_total"] == null
            ? []
            : List<PaymentsTotal>.from(
                json["payments_total"]!.map((x) => PaymentsTotal.fromJson(x))),
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
        "written_off_date":
            "${writtenOffDate!.year.toString().padLeft(4, '0')}-${writtenOffDate!.month.toString().padLeft(2, '0')}-${writtenOffDate!.day.toString().padLeft(2, '0')}",
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
        "written_off_by": writtenOffBy?.toJson(),
        "student_detail": studentDetail?.toJson(),
        "payments": payments == null
            ? []
            : List<dynamic>.from(payments!.map((x) => x.toJson())),
        "payments_total": paymentsTotal == null
            ? []
            : List<dynamic>.from(paymentsTotal!.map((x) => x.toJson())),
      };
}

class Payment {
  int? id;
  int? batchFeeInvoiceId;
  DateTime? paymentDate;
  String? collectedByType;
  int? collectedById;
  int? amount;
  String? paymentMethod;
  dynamic transactionId;
  dynamic chequeNumber;
  int? isEdited;
  int? isDeleted;
  String? deletedByType;
  int? deletedById;
  By? collectedBy;
  By? deletedBy;
  List<Edit>? edits;

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
            : By.fromJson(json["collected_by"]),
        deletedBy:
            json["deleted_by"] == null ? null : By.fromJson(json["deleted_by"]),
        edits: json["edits"] == null
            ? []
            : List<Edit>.from(json["edits"]!.map((x) => Edit.fromJson(x))),
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
        "deleted_by": deletedBy?.toJson(),
        "edits": edits == null
            ? []
            : List<dynamic>.from(edits!.map((x) => x.toJson())),
      };
}

class By {
  String? name;
  int? userId;
  int? id;

  By({
    this.name,
    this.userId,
    this.id,
  });

  factory By.fromJson(Map<String, dynamic> json) => By(
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

class Edit {
  int? id;
  int? batchFeePaymentId;
  int? previousAmount;
  DateTime? previousDate;
  int? newAmount;
  DateTime? newDate;
  String? reason;
  String? editedByType;
  int? editedById;
  int? isDeleted;
  String? deletedByType;
  int? deletedById;
  TedBy? editedBy;
  TedBy? deletedBy;

  Edit({
    this.id,
    this.batchFeePaymentId,
    this.previousAmount,
    this.previousDate,
    this.newAmount,
    this.newDate,
    this.reason,
    this.editedByType,
    this.editedById,
    this.isDeleted,
    this.deletedByType,
    this.deletedById,
    this.editedBy,
    this.deletedBy,
  });

  factory Edit.fromJson(Map<String, dynamic> json) => Edit(
        id: json["id"],
        batchFeePaymentId: json["batch_fee_payment_id"],
        previousAmount: json["previous_amount"],
        previousDate: json["previous_date"] == null
            ? null
            : DateTime.parse(json["previous_date"]),
        newAmount: json["new_amount"],
        newDate:
            json["new_date"] == null ? null : DateTime.parse(json["new_date"]),
        reason: json["reason"],
        editedByType: json["edited_by_type"],
        editedById: json["edited_by_id"],
        isDeleted: json["is_deleted"],
        deletedByType: json["deleted_by_type"],
        deletedById: json["deleted_by_id"],
        editedBy: json["edited_by"] == null
            ? null
            : TedBy.fromJson(json["edited_by"]),
        deletedBy: json["deleted_by"] == null
            ? null
            : TedBy.fromJson(json["deleted_by"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "batch_fee_payment_id": batchFeePaymentId,
        "previous_amount": previousAmount,
        "previous_date":
            "${previousDate!.year.toString().padLeft(4, '0')}-${previousDate!.month.toString().padLeft(2, '0')}-${previousDate!.day.toString().padLeft(2, '0')}",
        "new_amount": newAmount,
        "new_date":
            "${newDate!.year.toString().padLeft(4, '0')}-${newDate!.month.toString().padLeft(2, '0')}-${newDate!.day.toString().padLeft(2, '0')}",
        "reason": reason,
        "edited_by_type": editedByType,
        "edited_by_id": editedById,
        "is_deleted": isDeleted,
        "deleted_by_type": deletedByType,
        "deleted_by_id": deletedById,
        "edited_by": editedBy?.toJson(),
        "deleted_by": deletedBy?.toJson(),
      };
}

class TedBy {
  String? name;
  int? id;

  TedBy({
    this.name,
    this.id,
  });

  factory TedBy.fromJson(Map<String, dynamic> json) => TedBy(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

class PaymentsTotal {
  int? batchFeeInvoiceId;
  String? total;
  dynamic collectedBy;
  dynamic deletedBy;
  List<dynamic>? edits;

  PaymentsTotal({
    this.batchFeeInvoiceId,
    this.total,
    this.collectedBy,
    this.deletedBy,
    this.edits,
  });

  factory PaymentsTotal.fromJson(Map<String, dynamic> json) => PaymentsTotal(
        batchFeeInvoiceId: json["batch_fee_invoice_id"],
        total: json["total"],
        collectedBy: json["collected_by"],
        deletedBy: json["deleted_by"],
        edits: json["edits"] == null
            ? []
            : List<dynamic>.from(json["edits"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "batch_fee_invoice_id": batchFeeInvoiceId,
        "total": total,
        "collected_by": collectedBy,
        "deleted_by": deletedBy,
        "edits": edits == null ? [] : List<dynamic>.from(edits!.map((x) => x)),
      };
}

class StudentDetail {
  int? id;
  String? name;
  dynamic parentName;
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
