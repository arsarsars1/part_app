// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResponseImpl _$$UserResponseImplFromJson(Map<String, dynamic> json) =>
    _$UserResponseImpl(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
      message: json['message'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserResponseImplToJson(_$UserResponseImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'message': instance.message,
      'status': instance.status,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      countryCode: json['country_code'] as String?,
      mobileNo: json['mobile_no'] as String?,
      firebaseToken: json['firebase_token'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
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

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
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

_$AdminImpl _$$AdminImplFromJson(Map<String, dynamic> json) => _$AdminImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      whatsappNo: json['whatsapp_no'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      doj: json['doj'] == null ? null : DateTime.parse(json['doj'] as String),
      profilePic: json['profile_pic'] as String?,
      profilePicType: json['profile_pic_type'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
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

Map<String, dynamic> _$$AdminImplToJson(_$AdminImpl instance) =>
    <String, dynamic>{
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

_$AcademyImpl _$$AcademyImplFromJson(Map<String, dynamic> json) =>
    _$AcademyImpl(
      id: (json['id'] as num).toInt(),
      academyName: json['academy_name'] as String?,
      countryId: (json['country_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      stateId: (json['state_id'] as num?)?.toInt(),
      districtId: (json['district_id'] as num?)?.toInt(),
      academyTypeId: (json['academy_type_id'] as num?)?.toInt(),
      membershipId: (json['membership_id'] as num?)?.toInt(),
      subscriptionDateTime: json['subscription_date_time'] == null
          ? null
          : DateTime.parse(json['subscription_date_time'] as String),
      paidOnDate: json['paid_on_date'] == null
          ? null
          : DateTime.parse(json['paid_on_date'] as String),
      validTillDate: json['valid_till_date'] == null
          ? null
          : DateTime.parse(json['valid_till_date'] as String),
      maxNoOfStudents: (json['max_no_of_students'] as num?)?.toInt(),
      maxNoOfBranches: (json['max_no_of_branches'] as num?)?.toInt(),
      createdBy: (json['created_by'] as num?)?.toInt(),
      updatedBy: json['updated_by'],
      createdFrom: json['created_from'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      membership: json['membership'] == null
          ? null
          : MembershipDetails.fromJson(
              json['membership'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AcademyImplToJson(_$AcademyImpl instance) =>
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
      'membership': instance.membership,
    };

_$MembershipDetailsImpl _$$MembershipDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$MembershipDetailsImpl(
      id: (json['id'] as num?)?.toInt(),
      membershipType: json['membership_type'] as String?,
      countryId: (json['country_id'] as num?)?.toInt(),
      period: json['period'] as String?,
      paymentType: json['payment_type'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      maxNoOfStudents: (json['max_no_of_students'] as num?)?.toInt(),
      maxNoOfBatches: (json['max_no_of_batches'] as num?)?.toInt(),
      maxNoOfBranches: (json['max_no_of_branches'] as num?)?.toInt(),
      isDiscounted: (json['is_discounted'] as num?)?.toInt(),
      discountType: json['discount_type'],
      discountAmount: (json['discount_amount'] as num?)?.toInt(),
      discountPercentage: json['discount_percentage'],
      sgst: (json['sgst'] as num?)?.toInt(),
      cgst: (json['cgst'] as num?)?.toInt(),
      finalAmount: (json['final_amount'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MembershipDetailsImplToJson(
        _$MembershipDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'membership_type': instance.membershipType,
      'country_id': instance.countryId,
      'period': instance.period,
      'payment_type': instance.paymentType,
      'duration': instance.duration,
      'amount': instance.amount,
      'max_no_of_students': instance.maxNoOfStudents,
      'max_no_of_batches': instance.maxNoOfBatches,
      'max_no_of_branches': instance.maxNoOfBranches,
      'is_discounted': instance.isDiscounted,
      'discount_type': instance.discountType,
      'discount_amount': instance.discountAmount,
      'discount_percentage': instance.discountPercentage,
      'sgst': instance.sgst,
      'cgst': instance.cgst,
      'final_amount': instance.finalAmount,
      'is_active': instance.isActive,
    };
