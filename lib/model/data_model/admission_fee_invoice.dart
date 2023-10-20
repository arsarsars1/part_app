// To parse this JSON data, do
//
//     final admissionFeeInvoice = admissionFeeInvoiceFromJson(jsonString);

import 'dart:convert';

AdmissionFeeInvoice admissionFeeInvoiceFromJson(String str) =>
    AdmissionFeeInvoice.fromJson(json.decode(str));

String admissionFeeInvoiceToJson(AdmissionFeeInvoice data) =>
    json.encode(data.toJson());

class AdmissionFeeInvoice {
  int? status;
  AdmissionFeeInvoiceClass? admissionFeeInvoice;

  AdmissionFeeInvoice({
    this.status,
    this.admissionFeeInvoice,
  });

  factory AdmissionFeeInvoice.fromJson(Map<String, dynamic> json) =>
      AdmissionFeeInvoice(
        status: json["status"],
        admissionFeeInvoice: json["admission_fee_invoice"] == null
            ? null
            : AdmissionFeeInvoiceClass.fromJson(json["admission_fee_invoice"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "admission_fee_invoice": admissionFeeInvoice?.toJson(),
      };
}

class AdmissionFeeInvoiceClass {
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
  DateTime? writtenOffDate;
  String? writtenOffAmount;
  String? writtenOffRemarks;
  String? writeOffByType;
  int? writeOffById;
  String? paymentStatus;
  String? feeType;
  String? currency;
  String? currencyCode;
  String? currencySymbol;
  String? pendingAmount;
  By? writeOffBy;
  StudentDetail? studentDetail;
  List<Payment>? payments;
  List<PaymentsTotal>? paymentsTotal;

  AdmissionFeeInvoiceClass({
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
  });

  factory AdmissionFeeInvoiceClass.fromJson(Map<String, dynamic> json) =>
      AdmissionFeeInvoiceClass(
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
        writtenOffDate: json["written_off_date"] == null
            ? null
            : DateTime.parse(json["written_off_date"]),
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
        writeOffBy: json["write_off_by"] == null
            ? null
            : By.fromJson(json["write_off_by"]),
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
        "payable_amount": payableAmount,
        "reminder_count": reminderCount,
        "written_off_status": writtenOffStatus,
        "written_off_date":
            "${writtenOffDate!.year.toString().padLeft(4, '0')}-${writtenOffDate!.month.toString().padLeft(2, '0')}-${writtenOffDate!.day.toString().padLeft(2, '0')}",
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
        "write_off_by": writeOffBy?.toJson(),
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
  int? admissionFeeInvoiceId;
  DateTime? paymentDate;
  String? collectedByType;
  int? collectedById;
  String? amount;
  String? paymentMethod;
  dynamic transactionId;
  dynamic chequeNumber;
  int? isEdited;
  int? isDeleted;
  String? deletedByType;
  int? deletedById;
  By? collectedBy;
  List<Edit>? edits;
  By? deletedBy;

  Payment({
    this.id,
    this.admissionFeeInvoiceId,
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
    this.edits,
    this.deletedBy,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        admissionFeeInvoiceId: json["admission_fee_invoice_id"],
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
        edits: json["edits"] == null
            ? []
            : List<Edit>.from(json["edits"]!.map((x) => Edit.fromJson(x))),
        deletedBy:
            json["deleted_by"] == null ? null : By.fromJson(json["deleted_by"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "admission_fee_invoice_id": admissionFeeInvoiceId,
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
        "edits": edits == null
            ? []
            : List<dynamic>.from(edits!.map((x) => x.toJson())),
        "deleted_by": deletedBy?.toJson(),
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
  String? previousAmount;
  DateTime? previousDate;
  String? newAmount;
  DateTime? newDate;
  String? reason;
  String? editedByType;
  int? editedById;
  int? isDeleted;
  String? deletedByType;
  int? deletedById;
  By? editedBy;
  By? deletedBy;

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
        editedBy:
            json["edited_by"] == null ? null : By.fromJson(json["edited_by"]),
        deletedBy:
            json["deleted_by"] == null ? null : By.fromJson(json["deleted_by"]),
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

class PaymentsTotal {
  int? admissionFeeInvoiceId;
  String? total;
  By? collectedBy;
  By? deletedBy;

  PaymentsTotal({
    this.admissionFeeInvoiceId,
    this.total,
    this.collectedBy,
    this.deletedBy,
  });

  factory PaymentsTotal.fromJson(Map<String, dynamic> json) => PaymentsTotal(
        admissionFeeInvoiceId: json["admission_fee_invoice_id"],
        total: json["total"],
        collectedBy: json["collected_by"] == null
            ? null
            : By.fromJson(json["collected_by"]),
        deletedBy:
            json["deleted_by"] == null ? null : By.fromJson(json["deleted_by"]),
      );

  Map<String, dynamic> toJson() => {
        "admission_fee_invoice_id": admissionFeeInvoiceId,
        "total": total,
        "collected_by": collectedBy?.toJson(),
        "deleted_by": deletedBy?.toJson(),
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
