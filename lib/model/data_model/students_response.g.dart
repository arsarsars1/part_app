// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StudentsResponse _$$_StudentsResponseFromJson(Map<String, dynamic> json) =>
    _$_StudentsResponse(
      status: json['status'] as int?,
      activeStudentsCount: json['active_students_count'] as int?,
      students: json['students'] == null
          ? null
          : Students.fromJson(json['students'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StudentsResponseToJson(_$_StudentsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'active_students_count': instance.activeStudentsCount,
      'students': instance.students,
    };

_$_Students _$$_StudentsFromJson(Map<String, dynamic> json) => _$_Students(
      currentPage: json['current_page'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Student.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      nextPageUrl: json['next_page_url'] as String?,
      from: json['from'] as int?,
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      to: json['to'] as int?,
    );

Map<String, dynamic> _$$_StudentsToJson(_$_Students instance) =>
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

_$_StudentResponse _$$_StudentResponseFromJson(Map<String, dynamic> json) =>
    _$_StudentResponse(
      status: json['status'] as int?,
      student: json['student'] == null
          ? null
          : Student.fromJson(json['student'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_StudentResponseToJson(_$_StudentResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'student': instance.student,
      'message': instance.message,
    };

_$_Student _$$_StudentFromJson(Map<String, dynamic> json) => _$_Student(
      id: json['id'] as int?,
      countryCode: json['country_code'] as String?,
      mobileNo: json['mobile_no'] as String?,
      isActive: json['is_active'] as int?,
      mobileUnique: json['mobile_unique'] as String?,
      studentDetail: (json['student_detail'] as List<dynamic>?)
          ?.map((e) => StudentDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StudentToJson(_$_Student instance) =>
    <String, dynamic>{
      'id': instance.id,
      'country_code': instance.countryCode,
      'mobile_no': instance.mobileNo,
      'is_active': instance.isActive,
      'mobile_unique': instance.mobileUnique,
      'student_detail': instance.studentDetail,
    };

_$_StudentDetail _$$_StudentDetailFromJson(Map<String, dynamic> json) =>
    _$_StudentDetail(
      id: json['id'] as int?,
      name: json['name'] as String?,
      parentName: json['parent_name'] as String?,
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
      batches: (json['batches'] as List<dynamic>?)
          ?.map((e) => Batch.fromJson(e as Map<String, dynamic>))
          .toList(),
      pivot: json['pivot'] == null
          ? null
          : PivotClass.fromJson(json['pivot'] as Map<String, dynamic>),
      academy: json['academy'] == null
          ? null
          : Academy.fromJson(json['academy'] as Map<String, dynamic>),
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
      'batches': instance.batches,
      'pivot': instance.pivot,
      'academy': instance.academy,
    };
