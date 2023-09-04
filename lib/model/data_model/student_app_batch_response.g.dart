// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_app_batch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StudentAppBatchResponse _$$_StudentAppBatchResponseFromJson(
        Map<String, dynamic> json) =>
    _$_StudentAppBatchResponse(
      branchName: json['branch_name'] as String?,
      batches: (json['batches'] as List<dynamic>?)
          ?.map(
              (e) => StudentAppBatchDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as int?,
    );

Map<String, dynamic> _$$_StudentAppBatchResponseToJson(
        _$_StudentAppBatchResponse instance) =>
    <String, dynamic>{
      'branch_name': instance.branchName,
      'batches': instance.batches,
      'status': instance.status,
    };

_$_StudentAppBatchDetail _$$_StudentAppBatchDetailFromJson(
        Map<String, dynamic> json) =>
    _$_StudentAppBatchDetail(
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

Map<String, dynamic> _$$_StudentAppBatchDetailToJson(
        _$_StudentAppBatchDetail instance) =>
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

_$_AdminDetail _$$_AdminDetailFromJson(Map<String, dynamic> json) =>
    _$_AdminDetail(
      id: json['id'] as int?,
      name: json['name'] as String?,
      userId: json['user_id'] as int?,
      profilePic: json['profile_pic'] as String?,
      whatsappNo: json['whatsapp_no'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      doj: json['doj'] == null ? null : DateTime.parse(json['doj'] as String),
      isActive: json['is_active'] as int?,
    );

Map<String, dynamic> _$$_AdminDetailToJson(_$_AdminDetail instance) =>
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

_$_StudentAppBatchInDetail _$$_StudentAppBatchInDetailFromJson(
        Map<String, dynamic> json) =>
    _$_StudentAppBatchInDetail(
      id: json['id'] as int?,
      batchId: json['batch_id'] as int?,
      day: json['day'] as int?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
    );

Map<String, dynamic> _$$_StudentAppBatchInDetailToJson(
        _$_StudentAppBatchInDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batch_id': instance.batchId,
      'day': instance.day,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };

_$_Branch _$$_BranchFromJson(Map<String, dynamic> json) => _$_Branch(
      id: json['id'] as int?,
      branchName: json['branch_name'] as String?,
      academyId: json['academy_id'] as int?,
    );

Map<String, dynamic> _$$_BranchToJson(_$_Branch instance) => <String, dynamic>{
      'id': instance.id,
      'branch_name': instance.branchName,
      'academy_id': instance.academyId,
    };

_$_CourseDetail _$$_CourseDetailFromJson(Map<String, dynamic> json) =>
    _$_CourseDetail(
      id: json['id'] as int?,
      courseName: json['course_name'] as String?,
    );

Map<String, dynamic> _$$_CourseDetailToJson(_$_CourseDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_name': instance.courseName,
    };

_$_StudentDetail _$$_StudentDetailFromJson(Map<String, dynamic> json) =>
    _$_StudentDetail(
      name: json['name'] as String?,
      feeAmount: json['fee_amount'] as int?,
      feeType: json['fee_type'] as String?,
      admissionFees: json['admission_fees'] as int?,
      noOfClasses: json['no_of_classes'] as int?,
      cycle: json['cycle'] as int?,
      paymentDueDate: json['payment_due_date'] as int?,
    );

Map<String, dynamic> _$$_StudentDetailToJson(_$_StudentDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'fee_amount': instance.feeAmount,
      'fee_type': instance.feeType,
      'admission_fees': instance.admissionFees,
      'no_of_classes': instance.noOfClasses,
      'cycle': instance.cycle,
      'payment_due_date': instance.paymentDueDate,
    };

_$_Subject _$$_SubjectFromJson(Map<String, dynamic> json) => _$_Subject(
      id: json['id'] as int?,
      subjectName: json['subject_name'] as String?,
    );

Map<String, dynamic> _$$_SubjectToJson(_$_Subject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject_name': instance.subjectName,
    };

_$_Trainer _$$_TrainerFromJson(Map<String, dynamic> json) => _$_Trainer(
      name: json['name'] as String?,
      profilePic: json['profile_pic'] as String?,
    );

Map<String, dynamic> _$$_TrainerToJson(_$_Trainer instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profile_pic': instance.profilePic,
    };
