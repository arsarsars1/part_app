// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BatchResponse _$$_BatchResponseFromJson(Map<String, dynamic> json) =>
    _$_BatchResponse(
      status: json['status'] as int?,
      batches: json['batches'] == null
          ? null
          : Datum.fromJson(json['batches'] as Map<String, dynamic>),
      batch: json['batch'] == null
          ? null
          : Batch.fromJson(json['batch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BatchResponseToJson(_$_BatchResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'batches': instance.batches,
      'batch': instance.batch,
    };

_$_Datum _$$_DatumFromJson(Map<String, dynamic> json) => _$_Datum(
      currentPage: json['current_page'] as int?,
      data: (json['data'] as List<dynamic>)
          .map((e) => Batch.fromJson(e as Map<String, dynamic>))
          .toList(),
      from: json['from'] as int?,
      perPage: json['per_page'] as int?,
      to: json['to'] as int?,
    );

Map<String, dynamic> _$$_DatumToJson(_$_Datum instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'from': instance.from,
      'per_page': instance.perPage,
      'to': instance.to,
    };

_$_Batch _$$_BatchFromJson(Map<String, dynamic> json) => _$_Batch(
      id: json['id'] as int?,
      batchName: json['batch_name'] as String?,
      academyId: json['academy_id'] as int?,
      branchId: json['branch_id'] as int?,
      courseId: json['course_id'] as int?,
      subjectId: json['subject_id'] as int?,
      batchStatus: json['batch_status'] as String?,
      feeAmount: json['fee_amount'] as int?,
      admissionFees: json['admission_fees'] as int?,
      isActive: json['is_active'] as int?,
      batchDetail: (json['batch_detail'] as List<dynamic>?)
          ?.map((e) => BatchDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      trainers: (json['trainers'] as List<dynamic>?)
          ?.map((e) => Trainer.fromJson(e as Map<String, dynamic>))
          .toList(),
      course: json['course'] == null
          ? null
          : Course.fromJson(json['course'] as Map<String, dynamic>),
      subject: json['subject'] == null
          ? null
          : Course.fromJson(json['subject'] as Map<String, dynamic>),
      branch: json['branch'] == null
          ? null
          : Branch.fromJson(json['branch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BatchToJson(_$_Batch instance) => <String, dynamic>{
      'id': instance.id,
      'batch_name': instance.batchName,
      'academy_id': instance.academyId,
      'branch_id': instance.branchId,
      'course_id': instance.courseId,
      'subject_id': instance.subjectId,
      'batch_status': instance.batchStatus,
      'fee_amount': instance.feeAmount,
      'admission_fees': instance.admissionFees,
      'is_active': instance.isActive,
      'batch_detail': instance.batchDetail,
      'trainers': instance.trainers,
      'course': instance.course,
      'subject': instance.subject,
      'branch': instance.branch,
    };

_$_BatchDetail _$$_BatchDetailFromJson(Map<String, dynamic> json) =>
    _$_BatchDetail(
      id: json['id'] as int?,
      batchId: json['batch_id'] as int?,
      day: json['day'] as int?,
      previousDate: json['previous_date'] == null
          ? null
          : DateTime.parse(json['previous_date'] as String),
      newDate: json['new_date'] == null
          ? null
          : DateTime.parse(json['new_date'] as String),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      isActive: json['is_active'] as int?,
    );

Map<String, dynamic> _$$_BatchDetailToJson(_$_BatchDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batch_id': instance.batchId,
      'day': instance.day,
      'previous_date': instance.previousDate?.toIso8601String(),
      'new_date': instance.newDate?.toIso8601String(),
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'is_active': instance.isActive,
    };
