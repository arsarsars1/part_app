// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StudentDashboard _$$_StudentDashboardFromJson(Map<String, dynamic> json) =>
    _$_StudentDashboard(
      classes: (json['classes'] as List<dynamic>?)
          ?.map((e) => ClassDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      batchFeeInvoices: (json['batch_fee_invoices'] as List<dynamic>?)
          ?.map((e) => BatchFeeInvoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      admissionFeeInvoice: json['admission_fee_invoice'] == null
          ? null
          : AdmissionFeeInvoice.fromJson(
              json['admission_fee_invoice'] as Map<String, dynamic>),
      status: json['status'] as int?,
    );

Map<String, dynamic> _$$_StudentDashboardToJson(_$_StudentDashboard instance) =>
    <String, dynamic>{
      'classes': instance.classes,
      'batch_fee_invoices': instance.batchFeeInvoices,
      'admission_fee_invoice': instance.admissionFeeInvoice,
      'status': instance.status,
    };

_$_AdmissionFeeInvoice _$$_AdmissionFeeInvoiceFromJson(
        Map<String, dynamic> json) =>
    _$_AdmissionFeeInvoice(
      id: json['id'] as int?,
      studentDetailId: json['student_detail_id'] as int?,
      academyId: json['academy_id'] as int?,
      branchId: json['branch_id'] as int?,
      branchName: json['branch_name'] as String?,
      batchId: json['batch_id'] as int?,
      batchName: json['batch_name'] as String?,
      courseName: json['course_name'] as String?,
      subjectName: json['subject_name'] as String?,
      payableAmount: json['payable_amount'] as String?,
      reminderCount: json['reminder_count'] as int?,
      writtenOffStatus: json['written_off_status'] as int?,
      writtenOffDate: json['written_off_date'],
      writtenOffAmount: json['written_off_amount'] as String?,
      writtenOffRemarks: json['written_off_remarks'],
      writeOffByType: json['write_off_by_type'],
      writeOffById: json['write_off_by_id'],
      paymentStatus: json['payment_status'] as String?,
      feeType: json['fee_type'] as String?,
      currency: json['currency'] as String?,
      currencyCode: json['currency_code'] as String?,
      currencySymbol: json['currency_symbol'] as String?,
      pendingAmount: json['pending_amount'] as String?,
      writeOffBy: json['write_off_by'],
      studentDetail: json['student_detail'] == null
          ? null
          : StudentDetail.fromJson(
              json['student_detail'] as Map<String, dynamic>),
      payments: json['payments'] as List<dynamic>?,
      paymentsTotal: json['payments_total'] as List<dynamic>?,
      batch: json['batch'] == null
          ? null
          : Batch.fromJson(json['batch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AdmissionFeeInvoiceToJson(
        _$_AdmissionFeeInvoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_detail_id': instance.studentDetailId,
      'academy_id': instance.academyId,
      'branch_id': instance.branchId,
      'branch_name': instance.branchName,
      'batch_id': instance.batchId,
      'batch_name': instance.batchName,
      'course_name': instance.courseName,
      'subject_name': instance.subjectName,
      'payable_amount': instance.payableAmount,
      'reminder_count': instance.reminderCount,
      'written_off_status': instance.writtenOffStatus,
      'written_off_date': instance.writtenOffDate,
      'written_off_amount': instance.writtenOffAmount,
      'written_off_remarks': instance.writtenOffRemarks,
      'write_off_by_type': instance.writeOffByType,
      'write_off_by_id': instance.writeOffById,
      'payment_status': instance.paymentStatus,
      'fee_type': instance.feeType,
      'currency': instance.currency,
      'currency_code': instance.currencyCode,
      'currency_symbol': instance.currencySymbol,
      'pending_amount': instance.pendingAmount,
      'write_off_by': instance.writeOffBy,
      'student_detail': instance.studentDetail,
      'payments': instance.payments,
      'payments_total': instance.paymentsTotal,
      'batch': instance.batch,
    };

_$_Batch _$$_BatchFromJson(Map<String, dynamic> json) => _$_Batch(
      id: json['id'] as int?,
      batchName: json['batch_name'] as String?,
      academyId: json['academy_id'] as int?,
      branchId: json['branch_id'] as int?,
      courseId: json['course_id'] as int?,
      subjectId: json['subject_id'] as int?,
      batchStatus: json['batch_status'] as String?,
      feeAmount: json['fee_amount'] as int?,
      admissionFees: json['admission_fees'] as int?,
      isActive: json['is_active'] as int?,
      batchDetail: (json['batch_detail'] as List<dynamic>?)
          ?.map((e) => BatchDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      trainers: (json['trainers'] as List<dynamic>?)
          ?.map((e) => Trainer.fromJson(e as Map<String, dynamic>))
          .toList(),
      course: json['course'] == null
          ? null
          : Course.fromJson(json['course'] as Map<String, dynamic>),
      subject: json['subject'] == null
          ? null
          : Subject.fromJson(json['subject'] as Map<String, dynamic>),
      branch: json['branch'] == null
          ? null
          : Branch.fromJson(json['branch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BatchToJson(_$_Batch instance) => <String, dynamic>{
      'id': instance.id,
      'batch_name': instance.batchName,
      'academy_id': instance.academyId,
      'branch_id': instance.branchId,
      'course_id': instance.courseId,
      'subject_id': instance.subjectId,
      'batch_status': instance.batchStatus,
      'fee_amount': instance.feeAmount,
      'admission_fees': instance.admissionFees,
      'is_active': instance.isActive,
      'batch_detail': instance.batchDetail,
      'trainers': instance.trainers,
      'course': instance.course,
      'subject': instance.subject,
      'branch': instance.branch,
    };

_$_BatchDetail _$$_BatchDetailFromJson(Map<String, dynamic> json) =>
    _$_BatchDetail(
      id: json['id'] as int?,
      batchId: json['batch_id'] as int?,
      day: json['day'] as int?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      isActive: json['is_active'] as int?,
    );

Map<String, dynamic> _$$_BatchDetailToJson(_$_BatchDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batch_id': instance.batchId,
      'day': instance.day,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'is_active': instance.isActive,
    };

_$_Branch _$$_BranchFromJson(Map<String, dynamic> json) => _$_Branch(
      id: json['id'] as int?,
      branchName: json['branch_name'] as String?,
      address: json['address'] as String?,
      pincode: json['pincode'] as int?,
      currency: json['currency'] as String?,
      stateId: json['state_id'] as int?,
      districtId: json['district_id'] as int?,
      countryId: json['country_id'] as int?,
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      state: json['state'] == null
          ? null
          : StateDetails.fromJson(json['state'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : District.fromJson(json['district'] as Map<String, dynamic>),
      timezone: json['timezone'] == null
          ? null
          : Timezone.fromJson(json['timezone'] as Map<String, dynamic>),
      academyId: json['academy_id'] as int?,
      managerDetailId: json['manager_detail_id'] as int?,
      isActive: json['is_active'] as int?,
      pivot: json['pivot'] == null
          ? null
          : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BranchToJson(_$_Branch instance) => <String, dynamic>{
      'id': instance.id,
      'branch_name': instance.branchName,
      'address': instance.address,
      'pincode': instance.pincode,
      'currency': instance.currency,
      'state_id': instance.stateId,
      'district_id': instance.districtId,
      'country_id': instance.countryId,
      'country': instance.country,
      'state': instance.state,
      'district': instance.district,
      'timezone': instance.timezone,
      'academy_id': instance.academyId,
      'manager_detail_id': instance.managerDetailId,
      'is_active': instance.isActive,
      'pivot': instance.pivot,
    };

_$_Country _$$_CountryFromJson(Map<String, dynamic> json) => _$_Country(
      id: json['id'] as int?,
      name: json['name'] as String?,
      currency: json['currency'] as String?,
      currencySymbol: json['currency_symbol'] as String?,
      currencyCode: json['currency_code'] as String?,
      timezone: json['timezone'] as String?,
      currencySubUnit: json['currency_sub_unit'] as String?,
    );

Map<String, dynamic> _$$_CountryToJson(_$_Country instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'currency': instance.currency,
      'currency_symbol': instance.currencySymbol,
      'currency_code': instance.currencyCode,
      'timezone': instance.timezone,
      'currency_sub_unit': instance.currencySubUnit,
    };

_$_District _$$_DistrictFromJson(Map<String, dynamic> json) => _$_District(
      id: json['id'] as int?,
      districtName: json['district_name'] as String?,
    );

Map<String, dynamic> _$$_DistrictToJson(_$_District instance) =>
    <String, dynamic>{
      'id': instance.id,
      'district_name': instance.districtName,
    };

_$_Pivot _$$_PivotFromJson(Map<String, dynamic> json) => _$_Pivot(
      trainerDetailId: json['trainer_detail_id'] as int?,
      branchId: json['branch_id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      batchId: json['batch_id'] as int?,
    );

Map<String, dynamic> _$$_PivotToJson(_$_Pivot instance) => <String, dynamic>{
      'trainer_detail_id': instance.trainerDetailId,
      'branch_id': instance.branchId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'batch_id': instance.batchId,
    };

_$_StateDetails _$$_StateDetailsFromJson(Map<String, dynamic> json) =>
    _$_StateDetails(
      id: json['id'] as int?,
      stateName: json['state_name'] as String?,
    );

Map<String, dynamic> _$$_StateDetailsToJson(_$_StateDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state_name': instance.stateName,
    };

_$_Timezone _$$_TimezoneFromJson(Map<String, dynamic> json) => _$_Timezone(
      id: json['id'] as int?,
      timezone: json['timezone'] as String?,
    );

Map<String, dynamic> _$$_TimezoneToJson(_$_Timezone instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timezone': instance.timezone,
    };

_$_Course _$$_CourseFromJson(Map<String, dynamic> json) => _$_Course(
      id: json['id'] as int?,
      academyTypeId: json['academy_type_id'] as int?,
      courseName: json['course_name'] as String?,
      isActive: json['is_active'] as int?,
    );

Map<String, dynamic> _$$_CourseToJson(_$_Course instance) => <String, dynamic>{
      'id': instance.id,
      'academy_type_id': instance.academyTypeId,
      'course_name': instance.courseName,
      'is_active': instance.isActive,
    };

_$_Subject _$$_SubjectFromJson(Map<String, dynamic> json) => _$_Subject(
      id: json['id'] as int?,
      courseId: json['course_id'] as int?,
      subjectName: json['subject_name'] as String?,
      isActive: json['is_active'] as int?,
    );

Map<String, dynamic> _$$_SubjectToJson(_$_Subject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'subject_name': instance.subjectName,
      'is_active': instance.isActive,
    };

_$_Trainer _$$_TrainerFromJson(Map<String, dynamic> json) => _$_Trainer(
      id: json['id'] as int?,
      name: json['name'] as String?,
      userId: json['user_id'] as int?,
      academyId: json['academy_id'] as int?,
      gender: json['gender'] as String?,
      dob: json['dob'],
      doj: json['doj'] == null ? null : DateTime.parse(json['doj'] as String),
      whatsappNo: json['whatsapp_no'],
      email: json['email'] as String?,
      upiId: json['upi_id'],
      salaryType: json['salary_type'] as String?,
      salaryDate: json['salary_date'] as int?,
      salaryAmount: json['salary_amount'] as int?,
      expertise: json['expertise'],
      address: json['address'] as String?,
      profilePic: json['profile_pic'] as String?,
      document1: json['document1'] as String?,
      document2: json['document2'] as String?,
      isActive: json['is_active'] as int?,
      pivot: json['pivot'] == null
          ? null
          : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
      branches: (json['branches'] as List<dynamic>?)
          ?.map((e) => Branch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TrainerToJson(_$_Trainer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user_id': instance.userId,
      'academy_id': instance.academyId,
      'gender': instance.gender,
      'dob': instance.dob,
      'doj': instance.doj?.toIso8601String(),
      'whatsapp_no': instance.whatsappNo,
      'email': instance.email,
      'upi_id': instance.upiId,
      'salary_type': instance.salaryType,
      'salary_date': instance.salaryDate,
      'salary_amount': instance.salaryAmount,
      'expertise': instance.expertise,
      'address': instance.address,
      'profile_pic': instance.profilePic,
      'document1': instance.document1,
      'document2': instance.document2,
      'is_active': instance.isActive,
      'pivot': instance.pivot,
      'branches': instance.branches,
    };

_$_StudentDetail _$$_StudentDetailFromJson(Map<String, dynamic> json) =>
    _$_StudentDetail(
      id: json['id'] as int?,
      name: json['name'] as String?,
      parentName: json['parent_name'],
      userId: json['user_id'] as int?,
      academyId: json['academy_id'] as int?,
      gender: json['gender'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      doj: json['doj'] == null ? null : DateTime.parse(json['doj'] as String),
      email: json['email'] as String?,
      whatsappNo: json['whatsapp_no'] as String?,
      address: json['address'] as String?,
      profilePic: json['profile_pic'] as String?,
      isActive: json['is_active'] as int?,
    );

Map<String, dynamic> _$$_StudentDetailToJson(_$_StudentDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parent_name': instance.parentName,
      'user_id': instance.userId,
      'academy_id': instance.academyId,
      'gender': instance.gender,
      'dob': instance.dob?.toIso8601String(),
      'doj': instance.doj?.toIso8601String(),
      'email': instance.email,
      'whatsapp_no': instance.whatsappNo,
      'address': instance.address,
      'profile_pic': instance.profilePic,
      'is_active': instance.isActive,
    };

_$_BatchFeeInvoice _$$_BatchFeeInvoiceFromJson(Map<String, dynamic> json) =>
    _$_BatchFeeInvoice(
      id: json['id'] as int?,
      studentDetailId: json['student_detail_id'] as int?,
      academyId: json['academy_id'] as int?,
      branchId: json['branch_id'] as int?,
      branchName: json['branch_name'] as String?,
      batchId: json['batch_id'] as int?,
      batchName: json['batch_name'] as String?,
      courseName: json['course_name'] as String?,
      subjectName: json['subject_name'] as String?,
      paymentDueDate: json['payment_due_date'] == null
          ? null
          : DateTime.parse(json['payment_due_date'] as String),
      payableAmount: json['payable_amount'] as String?,
      reminderCount: json['reminder_count'] as int?,
      writtenOffStatus: json['written_off_status'] as int?,
      writtenOffDate: json['written_off_date'],
      writtenOffAmount: json['written_off_amount'] as String?,
      writtenOffRemarks: json['written_off_remarks'],
      writtenOffByType: json['written_off_by_type'],
      writtenOffById: json['written_off_by_id'],
      paymentStatus: json['payment_status'] as String?,
      feeType: json['fee_type'] as String?,
      month: json['month'] as int?,
      year: json['year'] as int?,
      currency: json['currency'] as String?,
      currencyCode: json['currency_code'] as String?,
      currencySymbol: json['currency_symbol'] as String?,
      cycle: json['cycle'] as int?,
      monthClassesConductedCount: json['month_classes_conducted_count'] as int?,
      monthAttendancePresentCount:
          json['month_attendance_present_count'] as int?,
      cycleAttendancePresentCount:
          json['cycle_attendance_present_count'] as int?,
      pendingAmount: json['pending_amount'] as String?,
      totalNoOfClasses: json['total_no_of_classes'],
      writtenOffBy: json['written_off_by'],
      studentDetail: json['student_detail'] == null
          ? null
          : StudentDetail.fromJson(
              json['student_detail'] as Map<String, dynamic>),
      payments: json['payments'] as List<dynamic>?,
      batch: json['batch'] == null
          ? null
          : Batch.fromJson(json['batch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BatchFeeInvoiceToJson(_$_BatchFeeInvoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_detail_id': instance.studentDetailId,
      'academy_id': instance.academyId,
      'branch_id': instance.branchId,
      'branch_name': instance.branchName,
      'batch_id': instance.batchId,
      'batch_name': instance.batchName,
      'course_name': instance.courseName,
      'subject_name': instance.subjectName,
      'payment_due_date': instance.paymentDueDate?.toIso8601String(),
      'payable_amount': instance.payableAmount,
      'reminder_count': instance.reminderCount,
      'written_off_status': instance.writtenOffStatus,
      'written_off_date': instance.writtenOffDate,
      'written_off_amount': instance.writtenOffAmount,
      'written_off_remarks': instance.writtenOffRemarks,
      'written_off_by_type': instance.writtenOffByType,
      'written_off_by_id': instance.writtenOffById,
      'payment_status': instance.paymentStatus,
      'fee_type': instance.feeType,
      'month': instance.month,
      'year': instance.year,
      'currency': instance.currency,
      'currency_code': instance.currencyCode,
      'currency_symbol': instance.currencySymbol,
      'cycle': instance.cycle,
      'month_classes_conducted_count': instance.monthClassesConductedCount,
      'month_attendance_present_count': instance.monthAttendancePresentCount,
      'cycle_attendance_present_count': instance.cycleAttendancePresentCount,
      'pending_amount': instance.pendingAmount,
      'total_no_of_classes': instance.totalNoOfClasses,
      'written_off_by': instance.writtenOffBy,
      'student_detail': instance.studentDetail,
      'payments': instance.payments,
      'batch': instance.batch,
    };

_$_ClassDetails _$$_ClassDetailsFromJson(Map<String, dynamic> json) =>
    _$_ClassDetails(
      status: json['status'] as String?,
      batchId: json['batch_id'] as int?,
      batchName: json['batch_name'] as String?,
      branchName: json['branch_name'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      timezone: json['timezone'] as String?,
      trainers: (json['trainers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      rescheduled: json['rescheduled'] as bool?,
      classLink: json['class_link'],
    );

Map<String, dynamic> _$$_ClassDetailsToJson(_$_ClassDetails instance) =>
    <String, dynamic>{
      'status': instance.status,
      'batch_id': instance.batchId,
      'batch_name': instance.batchName,
      'branch_name': instance.branchName,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'timezone': instance.timezone,
      'trainers': instance.trainers,
      'rescheduled': instance.rescheduled,
      'class_link': instance.classLink,
    };
