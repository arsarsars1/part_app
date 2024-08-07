// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendence_add_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendenceAddRequestImpl _$$AttendenceAddRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendenceAddRequestImpl(
      conductedOn: json['conducted_on'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      attendance: (json['attendance[]'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$AttendenceAddRequestImplToJson(
        _$AttendenceAddRequestImpl instance) =>
    <String, dynamic>{
      'conducted_on': instance.conductedOn,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'attendance[]': instance.attendance,
    };

_$AttendanceImpl _$$AttendanceImplFromJson(Map<String, dynamic> json) =>
    _$AttendanceImpl(
      studentDetailId: (json['student_detail_id'] as num?)?.toInt(),
      isPresent: (json['is_present'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AttendanceImplToJson(_$AttendanceImpl instance) =>
    <String, dynamic>{
      'student_detail_id': instance.studentDetailId,
      'is_present': instance.isPresent,
    };
