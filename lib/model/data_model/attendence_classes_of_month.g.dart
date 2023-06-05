// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendence_classes_of_month.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AttendenceClassesOfMonth _$$_AttendenceClassesOfMonthFromJson(
        Map<String, dynamic> json) =>
    _$_AttendenceClassesOfMonth(
      status: json['status'] as int?,
      classes: (json['classes'] as List<dynamic>?)
          ?.map((e) => Class.fromJson(e as Map<String, dynamic>))
          .toList(),
      batch: json['batch'] == null
          ? null
          : Batch.fromJson(json['batch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AttendenceClassesOfMonthToJson(
        _$_AttendenceClassesOfMonth instance) =>
    <String, dynamic>{
      'status': instance.status,
      'classes': instance.classes,
      'batch': instance.batch,
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
      activeStudentsCount: json['active_students_count'] as int?,
      inactiveStudentsCount: json['inactive_students_count'] as int?,
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
      'active_students_count': instance.activeStudentsCount,
      'inactive_students_count': instance.inactiveStudentsCount,
      'batch_detail': instance.batchDetail,
      'trainers': instance.trainers,
      'course': instance.course,
      'subject': instance.subject,
      'branch': instance.branch,
      'students': instance.students,
    };

_$_BatchDetail _$$_BatchDetailFromJson(Map<String, dynamic> json) =>
    _$_BatchDetail(
      id: json['id'] as int?,
      batchId: json['batch_id'] as int?,
      day: json['day'] as int?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      isActive: json['is_active'] as int?,
    );

Map<String, dynamic> _$$_BatchDetailToJson(_$_BatchDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batch_id': instance.batchId,
      'day': instance.day,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'is_active': instance.isActive,
    };

_$_Branch _$$_BranchFromJson(Map<String, dynamic> json) => _$_Branch(
      id: json['id'] as int?,
      branchName: json['branch_name'] as String?,
      address: json['address'] as String?,
      pincode: json['pincode'] as int?,
      currency: json['currency'] as String?,
      stateId: json['state_id'] as int?,
      districtId: json['district_id'] as int?,
      countryId: json['country_id'] as int?,
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      state: json['state'] == null
          ? null
          : State.fromJson(json['state'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : District.fromJson(json['district'] as Map<String, dynamic>),
      timezone: json['timezone'] == null
          ? null
          : Timezone.fromJson(json['timezone'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BranchToJson(_$_Branch instance) => <String, dynamic>{
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

_$_Country _$$_CountryFromJson(Map<String, dynamic> json) => _$_Country(
      id: json['id'] as int?,
      name: json['name'] as String?,
      currency: json['currency'] as String?,
      currencySymbol: json['currency_symbol'] as String?,
      currencyCode: json['currency_code'] as String?,
      timezone: json['timezone'] as String?,
      currencySubUnit: json['currency_sub_unit'] as String?,
    );

Map<String, dynamic> _$$_CountryToJson(_$_Country instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'currency': instance.currency,
      'currency_symbol': instance.currencySymbol,
      'currency_code': instance.currencyCode,
      'timezone': instance.timezone,
      'currency_sub_unit': instance.currencySubUnit,
    };

_$_District _$$_DistrictFromJson(Map<String, dynamic> json) => _$_District(
      id: json['id'] as int?,
      districtName: json['district_name'] as String?,
    );

Map<String, dynamic> _$$_DistrictToJson(_$_District instance) =>
    <String, dynamic>{
      'id': instance.id,
      'district_name': instance.districtName,
    };

_$_State _$$_StateFromJson(Map<String, dynamic> json) => _$_State(
      id: json['id'] as int?,
      stateName: json['state_name'] as String?,
    );

Map<String, dynamic> _$$_StateToJson(_$_State instance) => <String, dynamic>{
      'id': instance.id,
      'state_name': instance.stateName,
    };

_$_Timezone _$$_TimezoneFromJson(Map<String, dynamic> json) => _$_Timezone(
      id: json['id'] as int?,
      timezone: json['timezone'] as String?,
    );

Map<String, dynamic> _$$_TimezoneToJson(_$_Timezone instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timezone': instance.timezone,
    };

_$_Course _$$_CourseFromJson(Map<String, dynamic> json) => _$_Course(
      id: json['id'] as int?,
      academyTypeId: json['academy_type_id'] as int?,
      courseName: json['course_name'] as String?,
      isActive: json['is_active'] as int?,
    );

Map<String, dynamic> _$$_CourseToJson(_$_Course instance) => <String, dynamic>{
      'id': instance.id,
      'academy_type_id': instance.academyTypeId,
      'course_name': instance.courseName,
      'is_active': instance.isActive,
    };

_$_Subject _$$_SubjectFromJson(Map<String, dynamic> json) => _$_Subject(
      id: json['id'] as int?,
      courseId: json['course_id'] as int?,
      subjectName: json['subject_name'] as String?,
      isActive: json['is_active'] as int?,
    );

Map<String, dynamic> _$$_SubjectToJson(_$_Subject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.courseId,
      'subject_name': instance.subjectName,
      'is_active': instance.isActive,
    };

_$_Class _$$_ClassFromJson(Map<String, dynamic> json) => _$_Class(
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      rescheduled: json['rescheduled'] as bool?,
      conducted: json['conducted'] as bool?,
    );

Map<String, dynamic> _$$_ClassToJson(_$_Class instance) => <String, dynamic>{
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'date': instance.date?.toIso8601String(),
      'rescheduled': instance.rescheduled,
      'conducted': instance.conducted,
    };
