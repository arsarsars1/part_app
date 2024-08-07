// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrainerResponseImpl _$$TrainerResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TrainerResponseImpl(
      status: (json['status'] as num).toInt(),
      trainers: json['trainers'] == null
          ? null
          : Datum.fromJson(json['trainers'] as Map<String, dynamic>),
      trainer: json['trainer'] == null
          ? null
          : Trainer.fromJson(json['trainer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TrainerResponseImplToJson(
        _$TrainerResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'trainers': instance.trainers,
      'trainer': instance.trainer,
    };

_$DatumImpl _$$DatumImplFromJson(Map<String, dynamic> json) => _$DatumImpl(
      currentPage: (json['current_page'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Trainer.fromJson(e as Map<String, dynamic>))
          .toList(),
      from: (json['from'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      to: (json['to'] as num?)?.toInt(),
      nextPageUrl: json['next_page_url'] as String?,
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'from': instance.from,
      'per_page': instance.perPage,
      'to': instance.to,
      'next_page_url': instance.nextPageUrl,
    };

_$TrainerImpl _$$TrainerImplFromJson(Map<String, dynamic> json) =>
    _$TrainerImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      academyId: (json['academy_id'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      doj: json['doj'] == null ? null : DateTime.parse(json['doj'] as String),
      whatsappNo: json['whatsapp_no'] as String?,
      mobileNo: json['mobile_no'] as String?,
      countryCode: json['country_code'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      upiId: json['upi_id'] as String?,
      salaryType: json['salary_type'] as String?,
      address: json['address'] as String?,
      expertise: json['expertise'] as String?,
      salaryDate: (json['salary_date'] as num?)?.toInt(),
      salaryAmount: (json['salary_amount'] as num?)?.toInt(),
      profilePic: json['profile_pic'] as String?,
      profilePicType: json['profile_pic_type'] as String?,
      trainerDetailId: (json['trainer_detail_id'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      academy: json['academy'] == null
          ? null
          : Academy.fromJson(json['academy'] as Map<String, dynamic>),
      branches: (json['branches'] as List<dynamic>?)
          ?.map((e) => Branch.fromJson(e as Map<String, dynamic>))
          .toList(),
      document1: json['document_1'] as String?,
      document2: json['document_2'] as String?,
      trainerDetail: (json['trainer_detail'] as List<dynamic>?)
          ?.map((e) => Trainer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TrainerImplToJson(_$TrainerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'academy_id': instance.academyId,
      'gender': instance.gender,
      'dob': instance.dob?.toIso8601String(),
      'doj': instance.doj?.toIso8601String(),
      'whatsapp_no': instance.whatsappNo,
      'mobile_no': instance.mobileNo,
      'country_code': instance.countryCode,
      'name': instance.name,
      'email': instance.email,
      'upi_id': instance.upiId,
      'salary_type': instance.salaryType,
      'address': instance.address,
      'expertise': instance.expertise,
      'salary_date': instance.salaryDate,
      'salary_amount': instance.salaryAmount,
      'profile_pic': instance.profilePic,
      'profile_pic_type': instance.profilePicType,
      'trainer_detail_id': instance.trainerDetailId,
      'is_active': instance.isActive,
      'user': instance.user,
      'academy': instance.academy,
      'branches': instance.branches,
      'document_1': instance.document1,
      'document_2': instance.document2,
      'trainer_detail': instance.trainerDetail,
    };

_$DocumentImpl _$$DocumentImplFromJson(Map<String, dynamic> json) =>
    _$DocumentImpl(
      id: (json['id'] as num?)?.toInt(),
      documentIndex: (json['documentIndex'] as num?)?.toInt(),
      image: json['image'] as String?,
      ofType: json['ofType'] as String?,
      ofId: (json['ofId'] as num?)?.toInt(),
      isAvailable: (json['isAvailable'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DocumentImplToJson(_$DocumentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentIndex': instance.documentIndex,
      'image': instance.image,
      'ofType': instance.ofType,
      'ofId': instance.ofId,
      'isAvailable': instance.isAvailable,
    };
