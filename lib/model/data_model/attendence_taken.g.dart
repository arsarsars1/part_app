// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendence_taken.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendenceTakenImpl _$$AttendenceTakenImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendenceTakenImpl(
      conductedClass: json['conducted_class'] == null
          ? null
          : ConductedClassDetails.fromJson(
              json['conducted_class'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AttendenceTakenImplToJson(
        _$AttendenceTakenImpl instance) =>
    <String, dynamic>{
      'conducted_class': instance.conductedClass,
      'status': instance.status,
    };

_$ConductedClassDetailsImpl _$$ConductedClassDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$ConductedClassDetailsImpl(
      id: (json['id'] as num?)?.toInt(),
      batchId: (json['batch_id'] as num?)?.toInt(),
      takenByType: json['taken_by_type'] as String?,
      takenById: (json['taken_by_id'] as num?)?.toInt(),
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

Map<String, dynamic> _$$ConductedClassDetailsImplToJson(
        _$ConductedClassDetailsImpl instance) =>
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

_$AttendanceDetailsImpl _$$AttendanceDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceDetailsImpl(
      id: (json['id'] as num?)?.toInt(),
      conductedClassId: (json['conducted_class_id'] as num?)?.toInt(),
      studentDetailId: (json['student_detail_id'] as num?)?.toInt(),
      feeType: json['fee_type'] as String?,
      cycle: (json['cycle'] as num?)?.toInt(),
      isPresent: (json['is_present'] as num?)?.toInt(),
      studentDetail: json['student_detail'] == null
          ? null
          : StudentDetail.fromJson(
              json['student_detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AttendanceDetailsImplToJson(
        _$AttendanceDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conducted_class_id': instance.conductedClassId,
      'student_detail_id': instance.studentDetailId,
      'fee_type': instance.feeType,
      'cycle': instance.cycle,
      'is_present': instance.isPresent,
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
    };

_$TakenByImpl _$$TakenByImplFromJson(Map<String, dynamic> json) =>
    _$TakenByImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$TakenByImplToJson(_$TakenByImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
