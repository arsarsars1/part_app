// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BatchResponseImpl _$$BatchResponseImplFromJson(Map<String, dynamic> json) =>
    _$BatchResponseImpl(
      status: json['status'] as int?,
      batches: json['batches'] == null
          ? null
          : Datum.fromJson(json['batches'] as Map<String, dynamic>),
      batch: json['batch'] == null
          ? null
          : Batch.fromJson(json['batch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BatchResponseImplToJson(_$BatchResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'batches': instance.batches,
      'batch': instance.batch,
    };

_$StudentsBatchResponseImpl _$$StudentsBatchResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StudentsBatchResponseImpl(
      status: json['status'] as int?,
      batches: (json['batches'] as List<dynamic>?)
          ?.map((e) => Batch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StudentsBatchResponseImplToJson(
        _$StudentsBatchResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'batches': instance.batches,
    };

_$DatumImpl _$$DatumImplFromJson(Map<String, dynamic> json) => _$DatumImpl(
      currentPage: json['current_page'] as int?,
      data: (json['data'] as List<dynamic>)
          .map((e) => Batch.fromJson(e as Map<String, dynamic>))
          .toList(),
      from: json['from'] as int?,
      perPage: json['per_page'] as int?,
      nextPageUrl: json['next_page_url'] as String?,
      to: json['to'] as int?,
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'from': instance.from,
      'per_page': instance.perPage,
      'next_page_url': instance.nextPageUrl,
      'to': instance.to,
    };

_$BatchImpl _$$BatchImplFromJson(Map<String, dynamic> json) => _$BatchImpl(
      id: json['id'] as int?,
      batchName: json['batch_name'] as String?,
      academyId: json['academy_id'] as int?,
      branchId: json['branch_id'] as int?,
      courseId: json['course_id'] as int?,
      subjectId: json['subject_id'] as int?,
      batchStatus: json['batch_status'] as String?,
      shareToken: json['share_token'] as String?,
      feeAmount: json['fee_amount'] as int?,
      activeStudentsCount: json['active_students_count'] as int?,
      inactiveStudentsCount: json['inactive_students_count'] as int?,
      admissionFees: json['admission_fees'] as int?,
      isActive: json['is_active'] as int?,
      pivot: json['pivot'] == null
          ? null
          : PivotClass.fromJson(json['pivot'] as Map<String, dynamic>),
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

Map<String, dynamic> _$$BatchImplToJson(_$BatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batch_name': instance.batchName,
      'academy_id': instance.academyId,
      'branch_id': instance.branchId,
      'course_id': instance.courseId,
      'subject_id': instance.subjectId,
      'batch_status': instance.batchStatus,
      'share_token': instance.shareToken,
      'fee_amount': instance.feeAmount,
      'active_students_count': instance.activeStudentsCount,
      'inactive_students_count': instance.inactiveStudentsCount,
      'admission_fees': instance.admissionFees,
      'is_active': instance.isActive,
      'pivot': instance.pivot,
      'batch_detail': instance.batchDetail,
      'trainers': instance.trainers,
      'course': instance.course,
      'subject': instance.subject,
      'branch': instance.branch,
    };

_$BatchDetailImpl _$$BatchDetailImplFromJson(Map<String, dynamic> json) =>
    _$BatchDetailImpl(
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

Map<String, dynamic> _$$BatchDetailImplToJson(_$BatchDetailImpl instance) =>
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

_$PivotClassImpl _$$PivotClassImplFromJson(Map<String, dynamic> json) =>
    _$PivotClassImpl(
      studentDetailId: json['student_detail_id'] as int?,
      batchId: json['batch_id'] as int?,
      noOfClasses: json['no_of_classes'],
      feeType: json['fee_type'] as String?,
      feeAmount: json['fee_amount'] as int?,
      admissionFees: json['admission_fees'] as int?,
      cycle: json['cycle'] as int?,
      doj: json['doj'] == null ? null : DateTime.parse(json['doj'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PivotClassImplToJson(_$PivotClassImpl instance) =>
    <String, dynamic>{
      'student_detail_id': instance.studentDetailId,
      'batch_id': instance.batchId,
      'no_of_classes': instance.noOfClasses,
      'fee_type': instance.feeType,
      'fee_amount': instance.feeAmount,
      'admission_fees': instance.admissionFees,
      'cycle': instance.cycle,
      'doj': instance.doj?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
