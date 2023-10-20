// To parse this JSON data, do
//
//     final calenderEventsList = calenderEventsListFromJson(jsonString);

import 'dart:convert';

CalenderEventsList calenderEventsListFromJson(String str) =>
    CalenderEventsList.fromJson(json.decode(str));

String calenderEventsListToJson(CalenderEventsList data) =>
    json.encode(data.toJson());

class CalenderEventsList {
  Data? data;
  int? status;

  CalenderEventsList({
    this.data,
    this.status,
  });

  factory CalenderEventsList.fromJson(Map<String, dynamic> json) =>
      CalenderEventsList(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "status": status,
      };
}

class Data {
  String? feePayments;
  List<TrainerSalaryPayment>? trainerSalaryPayments;
  List<ScheduledClass>? scheduledClasses;
  List<ScheduledClass>? rescheduledClasses;
  List<StudentsJoined>? studentsJoined;
  List<TrainersJoined>? trainersJoined;
  List<Lead>? followUpLeads;
  List<Lead>? newLeads;

  Data({
    this.feePayments,
    this.trainerSalaryPayments,
    this.scheduledClasses,
    this.rescheduledClasses,
    this.studentsJoined,
    this.trainersJoined,
    this.followUpLeads,
    this.newLeads,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        feePayments: json["fee_payments"],
        trainerSalaryPayments: json["trainer_salary_payments"] == null
            ? []
            : List<TrainerSalaryPayment>.from(json["trainer_salary_payments"]!
                .map((x) => TrainerSalaryPayment.fromJson(x))),
        scheduledClasses: json["scheduled_classes"] == null
            ? []
            : List<ScheduledClass>.from(json["scheduled_classes"]!
                .map((x) => ScheduledClass.fromJson(x))),
        rescheduledClasses: json["rescheduled_classes"] == null
            ? []
            : List<ScheduledClass>.from(json["rescheduled_classes"]!
                .map((x) => ScheduledClass.fromJson(x))),
        studentsJoined: json["students_joined"] == null
            ? []
            : List<StudentsJoined>.from(json["students_joined"]!
                .map((x) => StudentsJoined.fromJson(x))),
        trainersJoined: json["trainers_joined"] == null
            ? []
            : List<TrainersJoined>.from(json["trainers_joined"]!
                .map((x) => TrainersJoined.fromJson(x))),
        followUpLeads: json["follow_up_leads"] == null
            ? []
            : List<Lead>.from(
                json["follow_up_leads"]!.map((x) => Lead.fromJson(x))),
        newLeads: json["new_leads"] == null
            ? []
            : List<Lead>.from(json["new_leads"]!.map((x) => Lead.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fee_payments": feePayments,
        "trainer_salary_payments": trainerSalaryPayments == null
            ? []
            : List<dynamic>.from(trainerSalaryPayments!.map((x) => x.toJson())),
        "scheduled_classes": scheduledClasses == null
            ? []
            : List<dynamic>.from(scheduledClasses!.map((x) => x.toJson())),
        "rescheduled_classes": rescheduledClasses == null
            ? []
            : List<dynamic>.from(rescheduledClasses!.map((x) => x)),
        "students_joined": studentsJoined == null
            ? []
            : List<dynamic>.from(studentsJoined!.map((x) => x.toJson())),
        "trainers_joined": trainersJoined == null
            ? []
            : List<dynamic>.from(trainersJoined!.map((x) => x.toJson())),
        "follow_up_leads": followUpLeads == null
            ? []
            : List<dynamic>.from(followUpLeads!.map((x) => x.toJson())),
        "new_leads": newLeads == null
            ? []
            : List<dynamic>.from(newLeads!.map((x) => x.toJson())),
      };
}

class Lead {
  int? id;
  int? academyId;
  String? name;
  String? age;
  String? gender;
  String? countryCode;
  String? mobileNo;
  dynamic whatsapp;
  int? branchId;
  int? batchId;
  String? leadStatus;
  String? assignedToType;
  int? assignedToId;
  DateTime? addedOn;
  FollowUpLeadBranch? branch;
  FollowUpLeadBatch? batch;
  AssignedTo? assignedTo;
  List<FollowUp>? followUps;

  Lead({
    this.id,
    this.academyId,
    this.name,
    this.age,
    this.gender,
    this.countryCode,
    this.mobileNo,
    this.whatsapp,
    this.branchId,
    this.batchId,
    this.leadStatus,
    this.assignedToType,
    this.assignedToId,
    this.addedOn,
    this.branch,
    this.batch,
    this.assignedTo,
    this.followUps,
  });

  factory Lead.fromJson(Map<String, dynamic> json) => Lead(
        id: json["id"],
        academyId: json["academy_id"],
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        countryCode: json["country_code"],
        mobileNo: json["mobile_no"],
        whatsapp: json["whatsapp"],
        branchId: json["branch_id"],
        batchId: json["batch_id"],
        leadStatus: json["lead_status"],
        assignedToType: json["assigned_to_type"],
        assignedToId: json["assigned_to_id"],
        addedOn:
            json["added_on"] == null ? null : DateTime.parse(json["added_on"]),
        branch: json["branch"] == null
            ? null
            : FollowUpLeadBranch.fromJson(json["branch"]),
        batch: json["batch"] == null
            ? null
            : FollowUpLeadBatch.fromJson(json["batch"]),
        assignedTo: json["assigned_to"] == null
            ? null
            : AssignedTo.fromJson(json["assigned_to"]),
        followUps: json["follow_ups"] == null
            ? []
            : List<FollowUp>.from(
                json["follow_ups"]!.map((x) => FollowUp.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "academy_id": academyId,
        "name": name,
        "age": age,
        "gender": gender,
        "country_code": countryCode,
        "mobile_no": mobileNo,
        "whatsapp": whatsapp,
        "branch_id": branchId,
        "batch_id": batchId,
        "lead_status": leadStatus,
        "assigned_to_type": assignedToType,
        "assigned_to_id": assignedToId,
        "added_on": addedOn?.toIso8601String(),
        "branch": branch?.toJson(),
        "batch": batch?.toJson(),
        "assigned_to": assignedTo?.toJson(),
        "follow_ups": followUps == null
            ? []
            : List<dynamic>.from(followUps!.map((x) => x.toJson())),
      };
}

class AssignedTo {
  int? id;
  String? name;

  AssignedTo({
    this.id,
    this.name,
  });

  factory AssignedTo.fromJson(Map<String, dynamic> json) => AssignedTo(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class FollowUpLeadBatch {
  int? id;
  String? batchName;

  FollowUpLeadBatch({
    this.id,
    this.batchName,
  });

  factory FollowUpLeadBatch.fromJson(Map<String, dynamic> json) =>
      FollowUpLeadBatch(
        id: json["id"],
        batchName: json["batch_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "batch_name": batchName,
      };
}

class FollowUpLeadBranch {
  int? id;
  String? branchName;
  int? stateId;
  int? districtId;
  StateDetail? state;
  District? district;
  dynamic timezone;

  FollowUpLeadBranch({
    this.id,
    this.branchName,
    this.stateId,
    this.districtId,
    this.state,
    this.district,
    this.timezone,
  });

  factory FollowUpLeadBranch.fromJson(Map<String, dynamic> json) =>
      FollowUpLeadBranch(
        id: json["id"],
        branchName: json["branch_name"],
        stateId: json["state_id"],
        districtId: json["district_id"],
        state:
            json["state"] == null ? null : StateDetail.fromJson(json["state"]),
        district: json["district"] == null
            ? null
            : District.fromJson(json["district"]),
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "branch_name": branchName,
        "state_id": stateId,
        "district_id": districtId,
        "state": state?.toJson(),
        "district": district?.toJson(),
        "timezone": timezone,
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

class StateDetail {
  int? id;
  String? stateName;

  StateDetail({
    this.id,
    this.stateName,
  });

  factory StateDetail.fromJson(Map<String, dynamic> json) => StateDetail(
        id: json["id"],
        stateName: json["state_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "state_name": stateName,
      };
}

class FollowUp {
  int? id;
  int? leadId;
  String? assignedToType;
  int? assignedToId;
  DateTime? followUpDate;
  String? followUpTime;
  String? followUpComment;
  String? followUpStatus;
  AssignedTo? assignedTo;

  FollowUp({
    this.id,
    this.leadId,
    this.assignedToType,
    this.assignedToId,
    this.followUpDate,
    this.followUpTime,
    this.followUpComment,
    this.followUpStatus,
    this.assignedTo,
  });

  factory FollowUp.fromJson(Map<String, dynamic> json) => FollowUp(
        id: json["id"],
        leadId: json["lead_id"],
        assignedToType: json["assigned_to_type"],
        assignedToId: json["assigned_to_id"],
        followUpDate: json["follow_up_date"] == null
            ? null
            : DateTime.parse(json["follow_up_date"]),
        followUpTime: json["follow_up_time"],
        followUpComment: json["follow_up_comment"],
        followUpStatus: json["follow_up_status"],
        assignedTo: json["assigned_to"] == null
            ? null
            : AssignedTo.fromJson(json["assigned_to"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lead_id": leadId,
        "assigned_to_type": assignedToType,
        "assigned_to_id": assignedToId,
        "follow_up_date":
            "${followUpDate!.year.toString().padLeft(4, '0')}-${followUpDate!.month.toString().padLeft(2, '0')}-${followUpDate!.day.toString().padLeft(2, '0')}",
        "follow_up_time": followUpTime,
        "follow_up_comment": followUpComment,
        "follow_up_status": followUpStatus,
        "assigned_to": assignedTo?.toJson(),
      };
}

class ScheduledClass {
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

  ScheduledClass({
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

  factory ScheduledClass.fromJson(Map<String, dynamic> json) => ScheduledClass(
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

class StudentsJoined {
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
  List<StudentsJoinedBatch>? batches;

  StudentsJoined({
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
    this.batches,
  });

  factory StudentsJoined.fromJson(Map<String, dynamic> json) => StudentsJoined(
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
        batches: json["batches"] == null
            ? []
            : List<StudentsJoinedBatch>.from(
                json["batches"]!.map((x) => StudentsJoinedBatch.fromJson(x))),
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
        "batches": batches == null
            ? []
            : List<dynamic>.from(batches!.map((x) => x.toJson())),
      };
}

class StudentsJoinedBatch {
  String? batchName;
  int? branchId;
  PurplePivot? pivot;
  List<dynamic>? batchDetail;
  List<dynamic>? trainers;
  dynamic course;
  dynamic subject;
  BatchBranch? branch;

  StudentsJoinedBatch({
    this.batchName,
    this.branchId,
    this.pivot,
    this.batchDetail,
    this.trainers,
    this.course,
    this.subject,
    this.branch,
  });

  factory StudentsJoinedBatch.fromJson(Map<String, dynamic> json) =>
      StudentsJoinedBatch(
        batchName: json["batch_name"],
        branchId: json["branch_id"],
        pivot:
            json["pivot"] == null ? null : PurplePivot.fromJson(json["pivot"]),
        batchDetail: json["batch_detail"] == null
            ? []
            : List<dynamic>.from(json["batch_detail"]!.map((x) => x)),
        trainers: json["trainers"] == null
            ? []
            : List<dynamic>.from(json["trainers"]!.map((x) => x)),
        course: json["course"],
        subject: json["subject"],
        branch: json["branch"] == null
            ? null
            : BatchBranch.fromJson(json["branch"]),
      );

  Map<String, dynamic> toJson() => {
        "batch_name": batchName,
        "branch_id": branchId,
        "pivot": pivot?.toJson(),
        "batch_detail": batchDetail == null
            ? []
            : List<dynamic>.from(batchDetail!.map((x) => x)),
        "trainers":
            trainers == null ? [] : List<dynamic>.from(trainers!.map((x) => x)),
        "course": course,
        "subject": subject,
        "branch": branch?.toJson(),
      };
}

class BatchBranch {
  int? id;
  String? branchName;
  dynamic country;
  dynamic state;
  dynamic district;
  dynamic timezone;
  BranchPivot? pivot;

  BatchBranch({
    this.id,
    this.branchName,
    this.country,
    this.state,
    this.district,
    this.timezone,
    this.pivot,
  });

  factory BatchBranch.fromJson(Map<String, dynamic> json) => BatchBranch(
        id: json["id"],
        branchName: json["branch_name"],
        country: json["country"],
        state: json["state"],
        district: json["district"],
        timezone: json["timezone"],
        pivot:
            json["pivot"] == null ? null : BranchPivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "branch_name": branchName,
        "country": country,
        "state": state,
        "district": district,
        "timezone": timezone,
        "pivot": pivot?.toJson(),
      };
}

class BranchPivot {
  int? trainerDetailId;
  int? batchId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? branchId;

  BranchPivot({
    this.trainerDetailId,
    this.batchId,
    this.createdAt,
    this.updatedAt,
    this.branchId,
  });

  factory BranchPivot.fromJson(Map<String, dynamic> json) => BranchPivot(
        trainerDetailId: json["trainer_detail_id"],
        batchId: json["batch_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        branchId: json["branch_id"],
      );

  Map<String, dynamic> toJson() => {
        "trainer_detail_id": trainerDetailId,
        "batch_id": batchId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "branch_id": branchId,
      };
}

class PurplePivot {
  int? studentDetailId;
  int? batchId;
  int? feeAmount;
  int? admissionFees;
  String? feeType;
  int? cycle;
  int? noOfClasses;
  DateTime? doj;
  DateTime? createdAt;
  DateTime? updatedAt;

  PurplePivot({
    this.studentDetailId,
    this.batchId,
    this.feeAmount,
    this.admissionFees,
    this.feeType,
    this.cycle,
    this.noOfClasses,
    this.doj,
    this.createdAt,
    this.updatedAt,
  });

  factory PurplePivot.fromJson(Map<String, dynamic> json) => PurplePivot(
        studentDetailId: json["student_detail_id"],
        batchId: json["batch_id"],
        feeAmount: json["fee_amount"],
        admissionFees: json["admission_fees"],
        feeType: json["fee_type"],
        cycle: json["cycle"],
        noOfClasses: json["no_of_classes"],
        doj: json["doj"] == null ? null : DateTime.parse(json["doj"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "student_detail_id": studentDetailId,
        "batch_id": batchId,
        "fee_amount": feeAmount,
        "admission_fees": admissionFees,
        "fee_type": feeType,
        "cycle": cycle,
        "no_of_classes": noOfClasses,
        "doj":
            "${doj!.year.toString().padLeft(4, '0')}-${doj!.month.toString().padLeft(2, '0')}-${doj!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class TrainerSalaryPayment {
  int? id;
  int? trainerSalarySlipId;
  DateTime? paymentDate;
  String? collectedByType;
  int? collectedById;
  String? amount;
  String? paymentMethod;
  int? isEdited;
  int? isDeleted;
  dynamic deletedByType;
  dynamic deletedById;
  CollectedBy? collectedBy;
  List<dynamic>? edits;
  dynamic deletedBy;
  TrainerSalarySlip? trainerSalarySlip;

  TrainerSalaryPayment({
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
    this.trainerSalarySlip,
  });

  factory TrainerSalaryPayment.fromJson(Map<String, dynamic> json) =>
      TrainerSalaryPayment(
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
            : CollectedBy.fromJson(json["collected_by"]),
        edits: json["edits"] == null
            ? []
            : List<dynamic>.from(json["edits"]!.map((x) => x)),
        deletedBy: json["deleted_by"],
        trainerSalarySlip: json["trainer_salary_slip"] == null
            ? null
            : TrainerSalarySlip.fromJson(json["trainer_salary_slip"]),
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
        "edits": edits == null ? [] : List<dynamic>.from(edits!.map((x) => x)),
        "deleted_by": deletedBy,
        "trainer_salary_slip": trainerSalarySlip?.toJson(),
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

class TrainerSalarySlip {
  int? id;
  int? trainerDetailId;
  int? academyId;
  int? month;
  int? year;
  String? salaryAmount;
  String? paymentStatus;
  DateTime? salaryDueDate;
  int? writtenOffStatus;
  dynamic writtenOffDate;
  String? writtenOffAmount;
  dynamic writtenOffRemarks;
  dynamic writtenOffByType;
  dynamic writtenOffById;
  String? currency;
  String? currencyCode;
  String? currencySymbol;
  dynamic writtenOffBy;
  TrainerDetail? trainerDetail;

  TrainerSalarySlip({
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
    this.writtenOffBy,
    this.trainerDetail,
  });

  factory TrainerSalarySlip.fromJson(Map<String, dynamic> json) =>
      TrainerSalarySlip(
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
        writtenOffDate: json["written_off_date"],
        writtenOffAmount: json["written_off_amount"],
        writtenOffRemarks: json["written_off_remarks"],
        writtenOffByType: json["written_off_by_type"],
        writtenOffById: json["written_off_by_id"],
        currency: json["currency"],
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        writtenOffBy: json["written_off_by"],
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
        "written_off_date": writtenOffDate,
        "written_off_amount": writtenOffAmount,
        "written_off_remarks": writtenOffRemarks,
        "written_off_by_type": writtenOffByType,
        "written_off_by_id": writtenOffById,
        "currency": currency,
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "written_off_by": writtenOffBy,
        "trainer_detail": trainerDetail?.toJson(),
      };
}

class TrainerDetail {
  int? id;
  String? name;
  List<BatchBranch>? branches;
  List<TrainerDetailBatch>? batches;

  TrainerDetail({
    this.id,
    this.name,
    this.branches,
    this.batches,
  });

  factory TrainerDetail.fromJson(Map<String, dynamic> json) => TrainerDetail(
        id: json["id"],
        name: json["name"],
        branches: json["branches"] == null
            ? []
            : List<BatchBranch>.from(
                json["branches"]!.map((x) => BatchBranch.fromJson(x))),
        batches: json["batches"] == null
            ? []
            : List<TrainerDetailBatch>.from(
                json["batches"]!.map((x) => TrainerDetailBatch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "branches": branches == null
            ? []
            : List<dynamic>.from(branches!.map((x) => x.toJson())),
        "batches": batches == null
            ? []
            : List<dynamic>.from(batches!.map((x) => x.toJson())),
      };
}

class TrainerDetailBatch {
  String? batchName;
  BranchPivot? pivot;
  List<dynamic>? batchDetail;
  List<dynamic>? trainers;
  dynamic course;
  dynamic subject;
  dynamic branch;

  TrainerDetailBatch({
    this.batchName,
    this.pivot,
    this.batchDetail,
    this.trainers,
    this.course,
    this.subject,
    this.branch,
  });

  factory TrainerDetailBatch.fromJson(Map<String, dynamic> json) =>
      TrainerDetailBatch(
        batchName: json["batch_name"],
        pivot:
            json["pivot"] == null ? null : BranchPivot.fromJson(json["pivot"]),
        batchDetail: json["batch_detail"] == null
            ? []
            : List<dynamic>.from(json["batch_detail"]!.map((x) => x)),
        trainers: json["trainers"] == null
            ? []
            : List<dynamic>.from(json["trainers"]!.map((x) => x)),
        course: json["course"],
        subject: json["subject"],
        branch: json["branch"],
      );

  Map<String, dynamic> toJson() => {
        "batch_name": batchName,
        "pivot": pivot?.toJson(),
        "batch_detail": batchDetail == null
            ? []
            : List<dynamic>.from(batchDetail!.map((x) => x)),
        "trainers":
            trainers == null ? [] : List<dynamic>.from(trainers!.map((x) => x)),
        "course": course,
        "subject": subject,
        "branch": branch,
      };
}

class TrainersJoined {
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
  String? document1;
  String? document2;
  int? isActive;
  List<TrainersJoinedBranch>? branches;

  TrainersJoined({
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
    this.branches,
  });

  factory TrainersJoined.fromJson(Map<String, dynamic> json) => TrainersJoined(
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
        branches: json["branches"] == null
            ? []
            : List<TrainersJoinedBranch>.from(
                json["branches"]!.map((x) => TrainersJoinedBranch.fromJson(x))),
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
        "branches": branches == null
            ? []
            : List<dynamic>.from(branches!.map((x) => x.toJson())),
      };
}

class TrainersJoinedBranch {
  int? id;
  String? branchName;
  int? academyId;
  int? countryId;
  dynamic managerDetailId;
  int? stateId;
  int? districtId;
  String? address;
  int? pincode;
  String? currency;
  int? isActive;
  BranchPivot? pivot;
  Country? country;
  StateDetail? state;
  District? district;
  Timezone? timezone;

  TrainersJoinedBranch({
    this.id,
    this.branchName,
    this.academyId,
    this.countryId,
    this.managerDetailId,
    this.stateId,
    this.districtId,
    this.address,
    this.pincode,
    this.currency,
    this.isActive,
    this.pivot,
    this.country,
    this.state,
    this.district,
    this.timezone,
  });

  factory TrainersJoinedBranch.fromJson(Map<String, dynamic> json) =>
      TrainersJoinedBranch(
        id: json["id"],
        branchName: json["branch_name"],
        academyId: json["academy_id"],
        countryId: json["country_id"],
        managerDetailId: json["manager_detail_id"],
        stateId: json["state_id"],
        districtId: json["district_id"],
        address: json["address"],
        pincode: json["pincode"],
        currency: json["currency"],
        isActive: json["is_active"],
        pivot:
            json["pivot"] == null ? null : BranchPivot.fromJson(json["pivot"]),
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
        state:
            json["state"] == null ? null : StateDetail.fromJson(json["state"]),
        district: json["district"] == null
            ? null
            : District.fromJson(json["district"]),
        timezone: json["timezone"] == null
            ? null
            : Timezone.fromJson(json["timezone"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "branch_name": branchName,
        "academy_id": academyId,
        "country_id": countryId,
        "manager_detail_id": managerDetailId,
        "state_id": stateId,
        "district_id": districtId,
        "address": address,
        "pincode": pincode,
        "currency": currency,
        "is_active": isActive,
        "pivot": pivot?.toJson(),
        "country": country?.toJson(),
        "state": state?.toJson(),
        "district": district?.toJson(),
        "timezone": timezone?.toJson(),
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
