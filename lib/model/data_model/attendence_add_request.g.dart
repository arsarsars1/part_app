// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendence_add_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AttendenceAddRequest _$$_AttendenceAddRequestFromJson(
        Map<String, dynamic> json) =>
    _$_AttendenceAddRequest(
      conductedOn: json['conducted_on'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      attendance: (json['attendance[]'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_AttendenceAddRequestToJson(
        _$_AttendenceAddRequest instance) =>
    <String, dynamic>{
      'conducted_on': instance.conductedOn,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'attendance[]': instance.attendance,
    };

_$_Attendance _$$_AttendanceFromJson(Map<String, dynamic> json) =>
    _$_Attendance(
      studentDetailId: json['student_detail_id'] as int?,
      isPresent: json['is_present'] as int?,
    );

Map<String, dynamic> _$$_AttendanceToJson(_$_Attendance instance) =>
    <String, dynamic>{
      'student_detail_id': instance.studentDetailId,
      'is_present': instance.isPresent,
    };
