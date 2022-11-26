// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trainer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TrainerResponse _$$_TrainerResponseFromJson(Map<String, dynamic> json) =>
    _$_TrainerResponse(
      status: json['status'] as int,
      trainers: json['trainers'] == null
          ? null
          : Datum.fromJson(json['trainers'] as Map<String, dynamic>),
      trainer: json['trainer'] == null
          ? null
          : Trainer.fromJson(json['trainer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TrainerResponseToJson(_$_TrainerResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'trainers': instance.trainers,
      'trainer': instance.trainer,
    };

_$_Datum _$$_DatumFromJson(Map<String, dynamic> json) => _$_Datum(
      currentPage: json['current_page'] as int?,
      data: (json['data'] as List<dynamic>)
          .map((e) => Trainer.fromJson(e as Map<String, dynamic>))
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

_$_Trainer _$$_TrainerFromJson(Map<String, dynamic> json) => _$_Trainer(
      id: json['id'] as int,
      userId: json['user_id'] as int?,
      academyId: json['academy_id'] as int?,
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
      salaryDate: json['salary_date'] as int?,
      salaryAmount: json['salary_amount'] as int?,
      profilePic: json['profile_pic'] as String?,
      profilePicType: json['profile_pic_type'] as String?,
      isActive: json['is_active'] as int?,
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

Map<String, dynamic> _$$_TrainerToJson(_$_Trainer instance) =>
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
      'is_active': instance.isActive,
      'user': instance.user,
      'academy': instance.academy,
      'branches': instance.branches,
      'document_1': instance.document1,
      'document_2': instance.document2,
      'trainer_detail': instance.trainerDetail,
    };

_$_Document _$$_DocumentFromJson(Map<String, dynamic> json) => _$_Document(
      id: json['id'] as int?,
      documentIndex: json['documentIndex'] as int?,
      image: json['image'] as String?,
      ofType: json['ofType'] as String?,
      ofId: json['ofId'] as int?,
      isAvailable: json['isAvailable'] as int?,
    );

Map<String, dynamic> _$$_DocumentToJson(_$_Document instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentIndex': instance.documentIndex,
      'image': instance.image,
      'ofType': instance.ofType,
      'ofId': instance.ofId,
      'isAvailable': instance.isAvailable,
    };
