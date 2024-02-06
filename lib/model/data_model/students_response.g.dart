// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentsResponseImpl _$$StudentsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentsResponseImpl(
      status: json['status'] as int?,
      activeStudentsCount: json['active_students_count'] as int?,
      students: json['students'] == null
          ? null
          : Students.fromJson(json['students'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StudentsResponseImplToJson(
        _$StudentsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'active_students_count': instance.activeStudentsCount,
      'students': instance.students,
    };

_$StudentsImpl _$$StudentsImplFromJson(Map<String, dynamic> json) =>
    _$StudentsImpl(
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
      status: json['status'] as int?,
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
      id: json['id'] as int?,
      countryCode: json['country_code'] as String?,
      mobileNo: json['mobile_no'] as String?,
      isActive: json['is_active'] as int?,
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
    };
