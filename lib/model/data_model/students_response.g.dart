// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentsResponseImpl _$$StudentsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentsResponseImpl(
      status: (json['status'] as num?)?.toInt(),
      activeStudentsCount: (json['active_students_count'] as num?)?.toInt(),
      inactiveStudentsCount: (json['inactive_students_count'] as num?)?.toInt(),
      students: json['students'] == null
          ? null
          : Students.fromJson(json['students'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StudentsResponseImplToJson(
        _$StudentsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'active_students_count': instance.activeStudentsCount,
      'inactive_students_count': instance.inactiveStudentsCount,
      'students': instance.students,
    };

_$StudentsImpl _$$StudentsImplFromJson(Map<String, dynamic> json) =>
    _$StudentsImpl(
      currentPage: (json['current_page'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Student.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      nextPageUrl: json['next_page_url'] as String?,
      from: (json['from'] as num?)?.toInt(),
      path: json['path'] as String?,
      perPage: (json['per_page'] as num?)?.toInt(),
      to: (json['to'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StudentsImplToJson(_$StudentsImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'first_page_url': instance.firstPageUrl,
      'next_page_url': instance.nextPageUrl,
      'from': instance.from,
      'path': instance.path,
      'per_page': instance.perPage,
      'to': instance.to,
    };

_$StudentResponseImpl _$$StudentResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentResponseImpl(
      status: (json['status'] as num?)?.toInt(),
      student: json['student'] == null
          ? null
          : Student.fromJson(json['student'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$StudentResponseImplToJson(
        _$StudentResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'student': instance.student,
      'message': instance.message,
    };

_$StudentImpl _$$StudentImplFromJson(Map<String, dynamic> json) =>
    _$StudentImpl(
      id: (json['id'] as num?)?.toInt(),
      countryCode: json['country_code'] as String?,
      mobileNo: json['mobile_no'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
      mobileUnique: json['mobile_unique'] as String?,
      studentDetail: (json['student_detail'] as List<dynamic>?)
          ?.map((e) => StudentDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StudentImplToJson(_$StudentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country_code': instance.countryCode,
      'mobile_no': instance.mobileNo,
      'is_active': instance.isActive,
      'mobile_unique': instance.mobileUnique,
      'student_detail': instance.studentDetail,
    };

_$StudentDetailImpl _$$StudentDetailImplFromJson(Map<String, dynamic> json) =>
    _$StudentDetailImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      parentName: json['parent_name'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      academyId: (json['academy_id'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      doj: json['doj'] == null ? null : DateTime.parse(json['doj'] as String),
      email: json['email'] as String?,
      whatsappNo: json['whatsapp_no'] as String?,
      address: json['address'] as String?,
      profilePic: json['profile_pic'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
      batches: (json['batches'] as List<dynamic>?)
          ?.map((e) => Batch.fromJson(e as Map<String, dynamic>))
          .toList(),
      pivot: json['pivot'] == null
          ? null
          : PivotClass.fromJson(json['pivot'] as Map<String, dynamic>),
      academy: json['academy'] == null
          ? null
          : Academy.fromJson(json['academy'] as Map<String, dynamic>),
      discontinuedBatches: (json['discontinued_batches'] as List<dynamic>?)
          ?.map((e) => DiscontinuedBatch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StudentDetailImplToJson(_$StudentDetailImpl instance) =>
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
      'batches': instance.batches,
      'pivot': instance.pivot,
      'academy': instance.academy,
      'discontinued_batches': instance.discontinuedBatches,
    };

_$DiscontinuedBatchImpl _$$DiscontinuedBatchImplFromJson(
        Map<String, dynamic> json) =>
    _$DiscontinuedBatchImpl(
      id: (json['id'] as num?)?.toInt(),
      batchName: json['batchName'] as String?,
      academyId: (json['academyId'] as num?)?.toInt(),
      branchId: (json['branchId'] as num?)?.toInt(),
      courseId: (json['courseId'] as num?)?.toInt(),
      subjectId: (json['subjectId'] as num?)?.toInt(),
      batchStatus: json['batchStatus'] as String?,
      feeAmount: (json['feeAmount'] as num?)?.toInt(),
      admissionFees: (json['admissionFees'] as num?)?.toInt(),
      shareToken: json['shareToken'] as String?,
      isActive: (json['isActive'] as num?)?.toInt(),
      pivot: json['pivot'] == null
          ? null
          : PivotClass.fromJson(json['pivot'] as Map<String, dynamic>),
      course: json['course'] == null
          ? null
          : Course1.fromJson(json['course'] as Map<String, dynamic>),
      subject: json['subject'] == null
          ? null
          : Subject1.fromJson(json['subject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DiscontinuedBatchImplToJson(
        _$DiscontinuedBatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batchName': instance.batchName,
      'academyId': instance.academyId,
      'branchId': instance.branchId,
      'courseId': instance.courseId,
      'subjectId': instance.subjectId,
      'batchStatus': instance.batchStatus,
      'feeAmount': instance.feeAmount,
      'admissionFees': instance.admissionFees,
      'shareToken': instance.shareToken,
      'isActive': instance.isActive,
      'pivot': instance.pivot,
      'course': instance.course,
      'subject': instance.subject,
    };

_$Course1Impl _$$Course1ImplFromJson(Map<String, dynamic> json) =>
    _$Course1Impl(
      id: (json['id'] as num?)?.toInt(),
      academyTypeId: (json['academyTypeId'] as num?)?.toInt(),
      courseName: json['courseName'] as String?,
      isActive: (json['isActive'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$Course1ImplToJson(_$Course1Impl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'academyTypeId': instance.academyTypeId,
      'courseName': instance.courseName,
      'isActive': instance.isActive,
    };

_$Subject1Impl _$$Subject1ImplFromJson(Map<String, dynamic> json) =>
    _$Subject1Impl(
      id: (json['id'] as num?)?.toInt(),
      courseId: (json['courseId'] as num?)?.toInt(),
      subjectName: json['subjectName'] as String?,
      isActive: (json['isActive'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$Subject1ImplToJson(_$Subject1Impl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'subjectName': instance.subjectName,
      'isActive': instance.isActive,
    };
