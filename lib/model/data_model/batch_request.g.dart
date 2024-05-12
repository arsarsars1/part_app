// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BatchRequestImpl _$$BatchRequestImplFromJson(Map<String, dynamic> json) =>
    _$BatchRequestImpl(
      batchName: json['batch_name'] as String?,
      branchId: json['branch_id'] as int?,
      courseId: json['course_id'] as int?,
      subjectId: json['subject_id'] as int?,
      retainStudents: json['retain_students'] as int?,
      batchStatus: json['batch_status'] as String?,
      feeAmount: json['fee_amount'],
      admissionFees: json['admission_fees'],
      trainers: json['trainers[]'],
      days:
          (json['days[]'] as List<dynamic>?)?.map((e) => e as String).toList(),
      students: (json['students[]'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$BatchRequestImplToJson(_$BatchRequestImpl instance) =>
    <String, dynamic>{
      'batch_name': instance.batchName,
      'branch_id': instance.branchId,
      'course_id': instance.courseId,
      'subject_id': instance.subjectId,
      'retain_students': instance.retainStudents,
      'batch_status': instance.batchStatus,
      'fee_amount': instance.feeAmount,
      'admission_fees': instance.admissionFees,
      'trainers[]': instance.trainers,
      'days[]': instance.days,
      'students[]': instance.students,
    };

_$DaysImpl _$$DaysImplFromJson(Map<String, dynamic> json) => _$DaysImpl(
      day: json['day'] as int?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
    );

Map<String, dynamic> _$$DaysImplToJson(_$DaysImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };

_$StudentsDataImpl _$$StudentsDataImplFromJson(Map<String, dynamic> json) =>
    _$StudentsDataImpl(
      name: json['name'] as String?,
      mobileNo: json['mobile_no'] as String?,
    );

Map<String, dynamic> _$$StudentsDataImplToJson(_$StudentsDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mobile_no': instance.mobileNo,
    };
