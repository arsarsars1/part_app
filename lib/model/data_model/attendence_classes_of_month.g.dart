// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendence_classes_of_month.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendenceClassDetailsesOfMonthImpl
    _$$AttendenceClassDetailsesOfMonthImplFromJson(Map<String, dynamic> json) =>
        _$AttendenceClassDetailsesOfMonthImpl(
          status: (json['status'] as num?)?.toInt(),
          classes: (json['classes'] as List<dynamic>?)
              ?.map((e) => ClassDetails.fromJson(e as Map<String, dynamic>))
              .toList(),
          batch: json['batch'] == null
              ? null
              : Batch.fromJson(json['batch'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$AttendenceClassDetailsesOfMonthImplToJson(
        _$AttendenceClassDetailsesOfMonthImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'classes': instance.classes,
      'batch': instance.batch,
    };

_$BatchImpl _$$BatchImplFromJson(Map<String, dynamic> json) => _$BatchImpl(
      id: (json['id'] as num?)?.toInt(),
      batchName: json['batch_name'] as String?,
      academyId: (json['academy_id'] as num?)?.toInt(),
      branchId: (json['branch_id'] as num?)?.toInt(),
      courseId: (json['course_id'] as num?)?.toInt(),
      subjectId: (json['subject_id'] as num?)?.toInt(),
      batchStatus: json['batch_status'] as String?,
      feeAmount: (json['fee_amount'] as num?)?.toInt(),
      admissionFees: (json['admission_fees'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
      activeStudentsCount: (json['active_students_count'] as num?)?.toInt(),
      inactiveStudentsCount: (json['inactive_students_count'] as num?)?.toInt(),
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
          : Subject.fromJson(json['subject'] as Map<String, dynamic>),
      branch: json['branch'] == null
          ? null
          : Branch.fromJson(json['branch'] as Map<String, dynamic>),
      students: (json['students'] as List<dynamic>?)
          ?.map((e) => Student.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'fee_amount': instance.feeAmount,
      'admission_fees': instance.admissionFees,
      'is_active': instance.isActive,
      'active_students_count': instance.activeStudentsCount,
      'inactive_students_count': instance.inactiveStudentsCount,
      'batch_detail': instance.batchDetail,
      'trainers': instance.trainers,
      'course': instance.course,
      'subject': instance.subject,
      'branch': instance.branch,
      'students': instance.students,
    };

_$BatchDetailImpl _$$BatchDetailImplFromJson(Map<String, dynamic> json) =>
    _$BatchDetailImpl(
      id: (json['id'] as num?)?.toInt(),
      batchId: (json['batch_id'] as num?)?.toInt(),
      day: (json['day'] as num?)?.toInt(),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BatchDetailImplToJson(_$BatchDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batch_id': instance.batchId,
      'day': instance.day,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'is_active': instance.isActive,
    };

_$BranchImpl _$$BranchImplFromJson(Map<String, dynamic> json) => _$BranchImpl(
      id: (json['id'] as num?)?.toInt(),
      branchName: json['branch_name'] as String?,
      address: json['address'] as String?,
      pincode: (json['pincode'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      stateId: (json['state_id'] as num?)?.toInt(),
      districtId: (json['district_id'] as num?)?.toInt(),
      countryId: (json['country_id'] as num?)?.toInt(),
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      state: json['state'] == null
          ? null
          : StateDetails.fromJson(json['state'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : District.fromJson(json['district'] as Map<String, dynamic>),
      timezone: json['timezone'] == null
          ? null
          : Timezone.fromJson(json['timezone'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BranchImplToJson(_$BranchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branch_name': instance.branchName,
      'address': instance.address,
      'pincode': instance.pincode,
      'currency': instance.currency,
      'state_id': instance.stateId,
      'district_id': instance.districtId,
      'country_id': instance.countryId,
      'country': instance.country,
      'state': instance.state,
      'district': instance.district,
      'timezone': instance.timezone,
    };

_$CountryImpl _$$CountryImplFromJson(Map<String, dynamic> json) =>
    _$CountryImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      currency: json['currency'] as String?,
      currencySymbol: json['currency_symbol'] as String?,
      currencyCode: json['currency_code'] as String?,
      timezone: json['timezone'] as String?,
      currencySubUnit: json['currency_sub_unit'] as String?,
    );

Map<String, dynamic> _$$CountryImplToJson(_$CountryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'currency': instance.currency,
      'currency_symbol': instance.currencySymbol,
      'currency_code': instance.currencyCode,
      'timezone': instance.timezone,
      'currency_sub_unit': instance.currencySubUnit,
    };

_$DistrictImpl _$$DistrictImplFromJson(Map<String, dynamic> json) =>
    _$DistrictImpl(
      id: (json['id'] as num?)?.toInt(),
      districtName: json['district_name'] as String?,
    );

Map<String, dynamic> _$$DistrictImplToJson(_$DistrictImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'district_name': instance.districtName,
    };

_$StateDetailsImpl _$$StateDetailsImplFromJson(Map<String, dynamic> json) =>
    _$StateDetailsImpl(
      id: (json['id'] as num?)?.toInt(),
      stateName: json['state_name'] as String?,
    );

Map<String, dynamic> _$$StateDetailsImplToJson(_$StateDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state_name': instance.stateName,
    };

_$TimezoneImpl _$$TimezoneImplFromJson(Map<String, dynamic> json) =>
    _$TimezoneImpl(
      id: (json['id'] as num?)?.toInt(),
      timezone: json['timezone'] as String?,
    );

Map<String, dynamic> _$$TimezoneImplToJson(_$TimezoneImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timezone': instance.timezone,
    };

_$CourseImpl _$$CourseImplFromJson(Map<String, dynamic> json) => _$CourseImpl(
      id: (json['id'] as num?)?.toInt(),
      academyTypeId: (json['academy_type_id'] as num?)?.toInt(),
      courseName: json['course_name'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CourseImplToJson(_$CourseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'academy_type_id': instance.academyTypeId,
      'course_name': instance.courseName,
      'is_active': instance.isActive,
    };

_$SubjectImpl _$$SubjectImplFromJson(Map<String, dynamic> json) =>
    _$SubjectImpl(
      id: (json['id'] as num?)?.toInt(),
      courseId: (json['course_id'] as num?)?.toInt(),
      subjectName: json['subject_name'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SubjectImplToJson(_$SubjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'subject_name': instance.subjectName,
      'is_active': instance.isActive,
    };

_$ClassDetailsImpl _$$ClassDetailsImplFromJson(Map<String, dynamic> json) =>
    _$ClassDetailsImpl(
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      rescheduled: json['rescheduled'] as bool?,
      conducted: json['conducted'] as bool?,
    );

Map<String, dynamic> _$$ClassDetailsImplToJson(_$ClassDetailsImpl instance) =>
    <String, dynamic>{
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'date': instance.date?.toIso8601String(),
      'rescheduled': instance.rescheduled,
      'conducted': instance.conducted,
    };
