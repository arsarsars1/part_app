// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_app_batch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentAppBatchResponseImpl _$$StudentAppBatchResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentAppBatchResponseImpl(
      branchName: json['branch_name'] as String?,
      batches: (json['batches'] as List<dynamic>?)
          ?.map(
              (e) => StudentAppBatchDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StudentAppBatchResponseImplToJson(
        _$StudentAppBatchResponseImpl instance) =>
    <String, dynamic>{
      'branch_name': instance.branchName,
      'batches': instance.batches,
      'status': instance.status,
    };

_$StudentAppBatchDetailImpl _$$StudentAppBatchDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentAppBatchDetailImpl(
      id: (json['id'] as num?)?.toInt(),
      batchName: json['batch_name'] as String?,
      academyId: (json['academy_id'] as num?)?.toInt(),
      branchId: (json['branch_id'] as num?)?.toInt(),
      courseId: (json['course_id'] as num?)?.toInt(),
      subjectId: (json['subject_id'] as num?)?.toInt(),
      batchStatus: json['batch_status'] as String?,
      feeAmount: (json['fee_amount'] as num?)?.toInt(),
      admissionFees: (json['admission_fees'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
      adminDetail: json['admin_detail'] == null
          ? null
          : AdminDetail.fromJson(json['admin_detail'] as Map<String, dynamic>),
      batchDetail: (json['batch_detail'] as List<dynamic>?)
          ?.map((e) =>
              StudentAppBatchInDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      trainers: (json['trainers'] as List<dynamic>?)
          ?.map((e) => Trainer.fromJson(e as Map<String, dynamic>))
          .toList(),
      course: json['course'] == null
          ? null
          : CourseDetail.fromJson(json['course'] as Map<String, dynamic>),
      subject: json['subject'] == null
          ? null
          : Subject.fromJson(json['subject'] as Map<String, dynamic>),
      branch: json['branch'] == null
          ? null
          : Branch.fromJson(json['branch'] as Map<String, dynamic>),
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => StudentDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StudentAppBatchDetailImplToJson(
        _$StudentAppBatchDetailImpl instance) =>
    <String, dynamic>{
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
      'admin_detail': instance.adminDetail,
      'batch_detail': instance.batchDetail,
      'trainers': instance.trainers,
      'course': instance.course,
      'subject': instance.subject,
      'branch': instance.branch,
      'students': instance.students,
    };

_$AdminDetailImpl _$$AdminDetailImplFromJson(Map<String, dynamic> json) =>
    _$AdminDetailImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      profilePic: json['profile_pic'] as String?,
      whatsappNo: json['whatsapp_no'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      doj: json['doj'] == null ? null : DateTime.parse(json['doj'] as String),
      isActive: (json['is_active'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AdminDetailImplToJson(_$AdminDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user_id': instance.userId,
      'profile_pic': instance.profilePic,
      'whatsapp_no': instance.whatsappNo,
      'email': instance.email,
      'gender': instance.gender,
      'dob': instance.dob?.toIso8601String(),
      'doj': instance.doj?.toIso8601String(),
      'is_active': instance.isActive,
    };

_$StudentAppBatchInDetailImpl _$$StudentAppBatchInDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentAppBatchInDetailImpl(
      id: (json['id'] as num?)?.toInt(),
      batchId: (json['batch_id'] as num?)?.toInt(),
      day: (json['day'] as num?)?.toInt(),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
    );

Map<String, dynamic> _$$StudentAppBatchInDetailImplToJson(
        _$StudentAppBatchInDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batch_id': instance.batchId,
      'day': instance.day,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };

_$BranchImpl _$$BranchImplFromJson(Map<String, dynamic> json) => _$BranchImpl(
      id: (json['id'] as num?)?.toInt(),
      branchName: json['branch_name'] as String?,
      academyId: (json['academy_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BranchImplToJson(_$BranchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_name': instance.branchName,
      'academy_id': instance.academyId,
    };

_$CourseDetailImpl _$$CourseDetailImplFromJson(Map<String, dynamic> json) =>
    _$CourseDetailImpl(
      id: (json['id'] as num?)?.toInt(),
      courseName: json['course_name'] as String?,
    );

Map<String, dynamic> _$$CourseDetailImplToJson(_$CourseDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_name': instance.courseName,
    };

_$StudentDetailImpl _$$StudentDetailImplFromJson(Map<String, dynamic> json) =>
    _$StudentDetailImpl(
      name: json['name'] as String?,
      feeAmount: (json['fee_amount'] as num?)?.toInt(),
      feeType: json['fee_type'] as String?,
      admissionFees: (json['admission_fees'] as num?)?.toInt(),
      noOfClasses: (json['no_of_classes'] as num?)?.toInt(),
      cycle: (json['cycle'] as num?)?.toInt(),
      paymentDueDate: (json['payment_due_date'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StudentDetailImplToJson(_$StudentDetailImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'fee_amount': instance.feeAmount,
      'fee_type': instance.feeType,
      'admission_fees': instance.admissionFees,
      'no_of_classes': instance.noOfClasses,
      'cycle': instance.cycle,
      'payment_due_date': instance.paymentDueDate,
    };

_$SubjectImpl _$$SubjectImplFromJson(Map<String, dynamic> json) =>
    _$SubjectImpl(
      id: (json['id'] as num?)?.toInt(),
      subjectName: json['subject_name'] as String?,
    );

Map<String, dynamic> _$$SubjectImplToJson(_$SubjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject_name': instance.subjectName,
    };

_$TrainerImpl _$$TrainerImplFromJson(Map<String, dynamic> json) =>
    _$TrainerImpl(
      name: json['name'] as String?,
      profilePic: json['profile_pic'] as String?,
    );

Map<String, dynamic> _$$TrainerImplToJson(_$TrainerImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profile_pic': instance.profilePic,
    };
