// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserResponse _$$_UserResponseFromJson(Map<String, dynamic> json) =>
    _$_UserResponse(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
      message: json['message'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$$_UserResponseToJson(_$_UserResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'message': instance.message,
      'status': instance.status,
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      name: json['name'] as String?,
      countryCode: json['country_code'] as String?,
      mobileNo: json['mobile_no'] as String?,
      firebaseToken: json['firebase_token'] as String?,
      isActive: json['is_active'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      adminDetail: json['admin_detail'] == null
          ? null
          : Admin.fromJson(json['admin_detail'] as Map<String, dynamic>),
      trainerDetail: (json['trainer_detail'] as List<dynamic>?)
          ?.map((e) => Trainer.fromJson(e as Map<String, dynamic>))
          .toList(),
      studentDetail: (json['student_detail'] as List<dynamic>?)
          ?.map((e) => StudentDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      managerDetail: json['manager_detail'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_code': instance.countryCode,
      'mobile_no': instance.mobileNo,
      'firebase_token': instance.firebaseToken,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'admin_detail': instance.adminDetail,
      'trainer_detail': instance.trainerDetail,
      'student_detail': instance.studentDetail,
      'manager_detail': instance.managerDetail,
    };

_$_Admin _$$_AdminFromJson(Map<String, dynamic> json) => _$_Admin(
      id: json['id'] as int,
      name: json['name'] as String?,
      userId: json['user_id'] as int?,
      whatsappNo: json['whatsapp_no'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      doj: json['doj'] == null ? null : DateTime.parse(json['doj'] as String),
      profilePic: json['profile_pic'] as String?,
      profilePicType: json['profile_pic_type'] as String?,
      isActive: json['is_active'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      academy: json['academy'] == null
          ? null
          : Academy.fromJson(json['academy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AdminToJson(_$_Admin instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user_id': instance.userId,
      'whatsapp_no': instance.whatsappNo,
      'email': instance.email,
      'gender': instance.gender,
      'dob': instance.dob?.toIso8601String(),
      'doj': instance.doj?.toIso8601String(),
      'profile_pic': instance.profilePic,
      'profile_pic_type': instance.profilePicType,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'academy': instance.academy,
    };

_$_Academy _$$_AcademyFromJson(Map<String, dynamic> json) => _$_Academy(
      id: json['id'] as int,
      academyName: json['academy_name'] as String?,
      countryId: json['country_id'] as int?,
      userId: json['user_id'] as int?,
      stateId: json['state_id'] as int?,
      districtId: json['district_id'] as int?,
      academyTypeId: json['academy_type_id'] as int?,
      membershipId: json['membership_id'] as int?,
      subscriptionDateTime: json['subscription_date_time'] == null
          ? null
          : DateTime.parse(json['subscription_date_time'] as String),
      paidOnDate: json['paid_on_date'] == null
          ? null
          : DateTime.parse(json['paid_on_date'] as String),
      validTillDate: json['valid_till_date'] == null
          ? null
          : DateTime.parse(json['valid_till_date'] as String),
      maxNoOfStudents: json['max_no_of_students'] as int?,
      maxNoOfBranches: json['max_no_of_branches'] as int?,
      createdBy: json['created_by'] as int?,
      updatedBy: json['updated_by'],
      createdFrom: json['created_from'] as String?,
      isActive: json['is_active'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_AcademyToJson(_$_Academy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'academy_name': instance.academyName,
      'country_id': instance.countryId,
      'user_id': instance.userId,
      'state_id': instance.stateId,
      'district_id': instance.districtId,
      'academy_type_id': instance.academyTypeId,
      'membership_id': instance.membershipId,
      'subscription_date_time':
          instance.subscriptionDateTime?.toIso8601String(),
      'paid_on_date': instance.paidOnDate?.toIso8601String(),
      'valid_till_date': instance.validTillDate?.toIso8601String(),
      'max_no_of_students': instance.maxNoOfStudents,
      'max_no_of_branches': instance.maxNoOfBranches,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_from': instance.createdFrom,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
