// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BatchRequest _$$_BatchRequestFromJson(Map<String, dynamic> json) =>
    _$_BatchRequest(
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
    );

Map<String, dynamic> _$$_BatchRequestToJson(_$_BatchRequest instance) =>
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
    };

_$_Days _$$_DaysFromJson(Map<String, dynamic> json) => _$_Days(
      day: json['day'] as int?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
    );

Map<String, dynamic> _$$_DaysToJson(_$_Days instance) => <String, dynamic>{
      'day': instance.day,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };
