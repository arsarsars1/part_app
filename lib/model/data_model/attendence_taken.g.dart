// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendence_taken.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AttendenceTaken _$$_AttendenceTakenFromJson(Map<String, dynamic> json) =>
    _$_AttendenceTaken(
      conductedClass: json['conducted_class'] == null
          ? null
          : ConductedClassDetails.fromJson(
              json['conducted_class'] as Map<String, dynamic>),
      status: json['status'] as int?,
    );

Map<String, dynamic> _$$_AttendenceTakenToJson(_$_AttendenceTaken instance) =>
    <String, dynamic>{
      'conducted_class': instance.conductedClass,
      'status': instance.status,
    };

_$_ConductedClassDetails _$$_ConductedClassDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_ConductedClassDetails(
      id: json['id'] as int?,
      batchId: json['batch_id'] as int?,
      takenByType: json['taken_by_type'] as String?,
      takenById: json['taken_by_id'] as int?,
      updatedByType: json['updated_by_type'],
      updatedById: json['updated_by_id'],
      conductedOn: json['conducted_on'] == null
          ? null
          : DateTime.parse(json['conducted_on'] as String),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      takenBy: json['taken_by'] == null
          ? null
          : TakenBy.fromJson(json['taken_by'] as Map<String, dynamic>),
      updatedBy: json['updated_by'],
      attendances: (json['attendances'] as List<dynamic>?)
          ?.map((e) => AttendanceDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ConductedClassDetailsToJson(
        _$_ConductedClassDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batch_id': instance.batchId,
      'taken_by_type': instance.takenByType,
      'taken_by_id': instance.takenById,
      'updated_by_type': instance.updatedByType,
      'updated_by_id': instance.updatedById,
      'conducted_on': instance.conductedOn?.toIso8601String(),
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'taken_by': instance.takenBy,
      'updated_by': instance.updatedBy,
      'attendances': instance.attendances,
    };

_$_AttendanceDetails _$$_AttendanceDetailsFromJson(Map<String, dynamic> json) =>
    _$_AttendanceDetails(
      id: json['id'] as int?,
      conductedClassId: json['conducted_class_id'] as int?,
      studentDetailId: json['student_detail_id'] as int?,
      feeType: json['fee_type'] as String?,
      cycle: json['cycle'] as int?,
      isPresent: json['is_present'] as int?,
      studentDetail: json['student_detail'] == null
          ? null
          : StudentDetail.fromJson(
              json['student_detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AttendanceDetailsToJson(
        _$_AttendanceDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conducted_class_id': instance.conductedClassId,
      'student_detail_id': instance.studentDetailId,
      'fee_type': instance.feeType,
      'cycle': instance.cycle,
      'is_present': instance.isPresent,
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

_$_TakenBy _$$_TakenByFromJson(Map<String, dynamic> json) => _$_TakenBy(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_TakenByToJson(_$_TakenBy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
