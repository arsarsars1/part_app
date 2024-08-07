// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_attendence_of_month.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentAttendenceOfMonthImpl _$$StudentAttendenceOfMonthImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentAttendenceOfMonthImpl(
      status: (json['status'] as num?)?.toInt(),
      studentAttendance: (json['student_attendance'] as List<dynamic>?)
          ?.map((e) => StudentAttendances.fromJson(e as Map<String, dynamic>))
          .toList(),
      presentCount: (json['present_count'] as num?)?.toInt(),
      absentCount: (json['absent_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StudentAttendenceOfMonthImplToJson(
        _$StudentAttendenceOfMonthImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'student_attendance': instance.studentAttendance,
      'present_count': instance.presentCount,
      'absent_count': instance.absentCount,
    };

_$StudentAttendancesImpl _$$StudentAttendancesImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentAttendancesImpl(
      id: (json['id'] as num?)?.toInt(),
      conductedClassId: (json['conducted_class_id'] as num?)?.toInt(),
      studentDetailId: (json['student_detail_id'] as num?)?.toInt(),
      feeType: json['fee_type'] as String?,
      cycle: (json['cycle'] as num?)?.toInt(),
      isPresent: (json['is_present'] as num?)?.toInt(),
      conductedClass: json['conducted_class'] == null
          ? null
          : ConductedClasses.fromJson(
              json['conducted_class'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StudentAttendancesImplToJson(
        _$StudentAttendancesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conducted_class_id': instance.conductedClassId,
      'student_detail_id': instance.studentDetailId,
      'fee_type': instance.feeType,
      'cycle': instance.cycle,
      'is_present': instance.isPresent,
      'conducted_class': instance.conductedClass,
    };

_$ConductedClassesImpl _$$ConductedClassesImplFromJson(
        Map<String, dynamic> json) =>
    _$ConductedClassesImpl(
      id: (json['id'] as num?)?.toInt(),
      batchId: (json['batch_id'] as num?)?.toInt(),
      takenByType: json['taken_by_type'] as String?,
      takenById: (json['taken_by_id'] as num?)?.toInt(),
      updatedByType: json['updated_by_type'] as String?,
      updatedById: (json['updated_by_id'] as num?)?.toInt(),
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
          : By.fromJson(json['taken_by'] as Map<String, dynamic>),
      updatedBy: json['updated_by'] == null
          ? null
          : By.fromJson(json['updated_by'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ConductedClassesImplToJson(
        _$ConductedClassesImpl instance) =>
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
    };

_$ByImpl _$$ByImplFromJson(Map<String, dynamic> json) => _$ByImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$ByImplToJson(_$ByImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
