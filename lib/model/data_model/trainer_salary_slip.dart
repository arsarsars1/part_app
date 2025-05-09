// To parse this JSON data, do
//
//     final trainerSalarySlip = trainerSalarySlipFromJson(jsonString);

import 'dart:convert';

TrainerSalarySlip trainerSalarySlipFromJson(String str) =>
    TrainerSalarySlip.fromJson(json.decode(str));

String trainerSalarySlipToJson(TrainerSalarySlip data) =>
    json.encode(data.toJson());

class TrainerSalarySlip {
  int? status;
  SalarySlips? salarySlips;

  TrainerSalarySlip({
    this.status,
    this.salarySlips,
  });

  factory TrainerSalarySlip.fromJson(Map<String, dynamic> json) =>
      TrainerSalarySlip(
        status: json["status"],
        salarySlips: json["salary_slips"] == null
            ? null
            : SalarySlips.fromJson(json["salary_slips"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "salary_slips": salarySlips?.toJson(),
      };
}

class SalarySlips {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;

  SalarySlips({
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

  factory SalarySlips.fromJson(Map<String, dynamic> json) => SalarySlips(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
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

class Data {
  int? id;
  int? trainerDetailId;
  int? academyId;
  int? month;
  int? year;
  String? salaryAmount;
  String? paymentStatus;
  DateTime? salaryDueDate;
  int? writtenOffStatus;
  DateTime? writtenOffDate;
  String? writtenOffAmount;
  String? writtenOffRemarks;
  String? writtenOffByType;
  int? writtenOffById;
  String? currency;
  String? currencyCode;
  String? currencySymbol;
  String? pendingAmount;
  List<PaymentsTotal>? paymentsTotal;
  By? writtenOffBy;
  List<Payment>? payments;
  TrainerDetail? trainerDetail;

  Data({
    this.id,
    this.trainerDetailId,
    this.academyId,
    this.month,
    this.year,
    this.salaryAmount,
    this.paymentStatus,
    this.salaryDueDate,
    this.writtenOffStatus,
    this.writtenOffDate,
    this.writtenOffAmount,
    this.writtenOffRemarks,
    this.writtenOffByType,
    this.writtenOffById,
    this.currency,
    this.currencyCode,
    this.currencySymbol,
    this.pendingAmount,
    this.paymentsTotal,
    this.writtenOffBy,
    this.payments,
    this.trainerDetail,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        trainerDetailId: json["trainer_detail_id"],
        academyId: json["academy_id"],
        month: json["month"],
        year: json["year"],
        salaryAmount: json["salary_amount"],
        paymentStatus: json["payment_status"],
        salaryDueDate: json["salary_due_date"] == null
            ? null
            : DateTime.parse(json["salary_due_date"]),
        writtenOffStatus: json["written_off_status"],
        writtenOffDate: json["written_off_date"] == null
            ? null
            : DateTime.parse(json["written_off_date"]),
        writtenOffAmount: json["written_off_amount"],
        writtenOffRemarks: json["written_off_remarks"],
        writtenOffByType: json["written_off_by_type"],
        writtenOffById: json["written_off_by_id"],
        currency: json["currency"],
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        pendingAmount: json["pending_amount"],
        paymentsTotal: json["payments_total"] == null
            ? []
            : List<PaymentsTotal>.from(
                json["payments_total"]!.map((x) => PaymentsTotal.fromJson(x))),
        writtenOffBy: json["written_off_by"] == null
            ? null
            : By.fromJson(json["written_off_by"]),
        payments: json["payments"] == null
            ? []
            : List<Payment>.from(
                json["payments"]!.map((x) => Payment.fromJson(x))),
        trainerDetail: json["trainer_detail"] == null
            ? null
            : TrainerDetail.fromJson(json["trainer_detail"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "trainer_detail_id": trainerDetailId,
        "academy_id": academyId,
        "month": month,
        "year": year,
        "salary_amount": salaryAmount,
        "payment_status": paymentStatus,
        "salary_due_date":
            "${salaryDueDate!.year.toString().padLeft(4, '0')}-${salaryDueDate!.month.toString().padLeft(2, '0')}-${salaryDueDate!.day.toString().padLeft(2, '0')}",
        "written_off_status": writtenOffStatus,
        "written_off_date":
            "${writtenOffDate!.year.toString().padLeft(4, '0')}-${writtenOffDate!.month.toString().padLeft(2, '0')}-${writtenOffDate!.day.toString().padLeft(2, '0')}",
        "written_off_amount": writtenOffAmount,
        "written_off_remarks": writtenOffRemarks,
        "written_off_by_type": writtenOffByType,
        "written_off_by_id": writtenOffById,
        "currency": currency,
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "pending_amount": pendingAmount,
        "payments_total": paymentsTotal == null
            ? []
            : List<dynamic>.from(paymentsTotal!.map((x) => x.toJson())),
        "written_off_by": writtenOffBy?.toJson(),
        "payments": payments == null
            ? []
            : List<dynamic>.from(payments!.map((x) => x.toJson())),
        "trainer_detail": trainerDetail?.toJson(),
      };
}

class Payment {
  int? id;
  int? trainerSalarySlipId;
  DateTime? paymentDate;
  String? collectedByType;
  int? collectedById;
  String? amount;
  String? paymentMethod;
  int? isEdited;
  int? isDeleted;
  String? deletedByType;
  int? deletedById;
  By? collectedBy;
  List<Edit>? edits;
  By? deletedBy;

  Payment({
    this.id,
    this.trainerSalarySlipId,
    this.paymentDate,
    this.collectedByType,
    this.collectedById,
    this.amount,
    this.paymentMethod,
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
        trainerSalarySlipId: json["trainer_salary_slip_id"],
        paymentDate: json["payment_date"] == null
            ? null
            : DateTime.parse(json["payment_date"]),
        collectedByType: json["collected_by_type"],
        collectedById: json["collected_by_id"],
        amount: json["amount"],
        paymentMethod: json["payment_method"],
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
        "trainer_salary_slip_id": trainerSalarySlipId,
        "payment_date":
            "${paymentDate!.year.toString().padLeft(4, '0')}-${paymentDate!.month.toString().padLeft(2, '0')}-${paymentDate!.day.toString().padLeft(2, '0')}",
        "collected_by_type": collectedByType,
        "collected_by_id": collectedById,
        "amount": amount,
        "payment_method": paymentMethod,
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
  int? trainerSalaryPaymentId;
  String? previousAmount;
  DateTime? previousDate;
  String? newAmount;
  DateTime? newDate;
  String? reason;
  int? isDeleted;
  String? editedByType;
  int? editedById;
  dynamic deletedByType;
  dynamic deletedById;
  DateTime? createdAt;
  DateTime? updatedAt;
  EditedBy? editedBy;
  dynamic deletedBy;

  Edit({
    this.id,
    this.trainerSalaryPaymentId,
    this.previousAmount,
    this.previousDate,
    this.newAmount,
    this.newDate,
    this.reason,
    this.isDeleted,
    this.editedByType,
    this.editedById,
    this.deletedByType,
    this.deletedById,
    this.createdAt,
    this.updatedAt,
    this.editedBy,
    this.deletedBy,
  });

  factory Edit.fromJson(Map<String, dynamic> json) => Edit(
        id: json["id"],
        trainerSalaryPaymentId: json["trainer_salary_payment_id"],
        previousAmount: json["previous_amount"],
        previousDate: json["previous_date"] == null
            ? null
            : DateTime.parse(json["previous_date"]),
        newAmount: json["new_amount"],
        newDate:
            json["new_date"] == null ? null : DateTime.parse(json["new_date"]),
        reason: json["reason"],
        isDeleted: json["is_deleted"],
        editedByType: json["edited_by_type"],
        editedById: json["edited_by_id"],
        deletedByType: json["deleted_by_type"],
        deletedById: json["deleted_by_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        editedBy: json["edited_by"] == null
            ? null
            : EditedBy.fromJson(json["edited_by"]),
        deletedBy: json["deleted_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "trainer_salary_payment_id": trainerSalaryPaymentId,
        "previous_amount": previousAmount,
        "previous_date":
            "${previousDate!.year.toString().padLeft(4, '0')}-${previousDate!.month.toString().padLeft(2, '0')}-${previousDate!.day.toString().padLeft(2, '0')}",
        "new_amount": newAmount,
        "new_date":
            "${newDate!.year.toString().padLeft(4, '0')}-${newDate!.month.toString().padLeft(2, '0')}-${newDate!.day.toString().padLeft(2, '0')}",
        "reason": reason,
        "is_deleted": isDeleted,
        "edited_by_type": editedByType,
        "edited_by_id": editedById,
        "deleted_by_type": deletedByType,
        "deleted_by_id": deletedById,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "edited_by": editedBy?.toJson(),
        "deleted_by": deletedBy,
      };
}

class EditedBy {
  int? id;
  String? name;
  int? userId;
  String? whatsappNo;
  String? email;
  String? gender;
  DateTime? dob;
  DateTime? doj;
  String? profilePic;
  int? isActive;

  EditedBy({
    this.id,
    this.name,
    this.userId,
    this.whatsappNo,
    this.email,
    this.gender,
    this.dob,
    this.doj,
    this.profilePic,
    this.isActive,
  });

  factory EditedBy.fromJson(Map<String, dynamic> json) => EditedBy(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
        whatsappNo: json["whatsapp_no"],
        email: json["email"],
        gender: json["gender"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        doj: json["doj"] == null ? null : DateTime.parse(json["doj"]),
        profilePic: json["profile_pic"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_id": userId,
        "whatsapp_no": whatsappNo,
        "email": email,
        "gender": gender,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "doj": doj?.toIso8601String(),
        "profile_pic": profilePic,
        "is_active": isActive,
      };
}

class PaymentsTotal {
  int? trainerSalarySlipId;
  String? total;
  dynamic collectedBy;
  List<dynamic>? edits;
  dynamic deletedBy;

  PaymentsTotal({
    this.trainerSalarySlipId,
    this.total,
    this.collectedBy,
    this.edits,
    this.deletedBy,
  });

  factory PaymentsTotal.fromJson(Map<String, dynamic> json) => PaymentsTotal(
        trainerSalarySlipId: json["trainer_salary_slip_id"],
        total: json["total"],
        collectedBy: json["collected_by"],
        edits: json["edits"] == null
            ? []
            : List<dynamic>.from(json["edits"]!.map((x) => x)),
        deletedBy: json["deleted_by"],
      );

  Map<String, dynamic> toJson() => {
        "trainer_salary_slip_id": trainerSalarySlipId,
        "total": total,
        "collected_by": collectedBy,
        "edits": edits == null ? [] : List<dynamic>.from(edits!.map((x) => x)),
        "deleted_by": deletedBy,
      };
}

class TrainerDetail {
  int? id;
  String? name;
  int? userId;
  int? academyId;
  String? gender;
  DateTime? dob;
  DateTime? doj;
  String? whatsappNo;
  String? email;
  dynamic upiId;
  String? salaryType;
  int? salaryDate;
  int? salaryAmount;
  String? expertise;
  String? address;
  String? profilePic;
  dynamic document1;
  dynamic document2;
  int? isActive;

  TrainerDetail({
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
  });

  factory TrainerDetail.fromJson(Map<String, dynamic> json) => TrainerDetail(
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
      };
}
