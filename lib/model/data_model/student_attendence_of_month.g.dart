// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_attendence_of_month.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StudentAttendenceOfMonth _$$_StudentAttendenceOfMonthFromJson(
        Map<String, dynamic> json) =>
    _$_StudentAttendenceOfMonth(
      status: json['status'] as int?,
      studentAttendance: (json['student_attendance'] as List<dynamic>?)
          ?.map((e) => StudentAttendances.fromJson(e as Map<String, dynamic>))
          .toList(),
      presentCount: json['present_count'] as int?,
      absentCount: json['absent_count'] as int?,
    );

Map<String, dynamic> _$$_StudentAttendenceOfMonthToJson(
        _$_StudentAttendenceOfMonth instance) =>
    <String, dynamic>{
      'status': instance.status,
      'student_attendance': instance.studentAttendance,
      'present_count': instance.presentCount,
      'absent_count': instance.absentCount,
    };

_$_StudentAttendances _$$_StudentAttendancesFromJson(
        Map<String, dynamic> json) =>
    _$_StudentAttendances(
      id: json['id'] as int?,
      conductedClassId: json['conducted_class_id'] as int?,
      studentDetailId: json['student_detail_id'] as int?,
      feeType: json['fee_type'] as String?,
      cycle: json['cycle'] as int?,
      isPresent: json['is_present'] as int?,
      conductedClass: json['conducted_class'] == null
          ? null
          : ConductedClasses.fromJson(
              json['conducted_class'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StudentAttendancesToJson(
        _$_StudentAttendances instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conducted_class_id': instance.conductedClassId,
      'student_detail_id': instance.studentDetailId,
      'fee_type': instance.feeType,
      'cycle': instance.cycle,
      'is_present': instance.isPresent,
      'conducted_class': instance.conductedClass,
    };

_$_ConductedClasses _$$_ConductedClassesFromJson(Map<String, dynamic> json) =>
    _$_ConductedClasses(
      id: json['id'] as int?,
      batchId: json['batch_id'] as int?,
      takenByType: json['taken_by_type'] as String?,
      takenById: json['taken_by_id'] as int?,
      updatedByType: json['updated_by_type'] as String?,
      updatedById: json['updated_by_id'] as int?,
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

Map<String, dynamic> _$$_ConductedClassesToJson(_$_ConductedClasses instance) =>
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

_$_By _$$_ByFromJson(Map<String, dynamic> json) => _$_By(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_ByToJson(_$_By instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
