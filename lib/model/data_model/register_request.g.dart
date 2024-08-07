// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterRequestImpl _$$RegisterRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterRequestImpl(
      mobileNo: json['mobile_no'] as String?,
      countryCode: json['country_code'] as String?,
      whatsappNo: json['whatsapp_no'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      profilePic: json['profile_pic'] as String?,
      isTrainer: json['is_trainer'] as String?,
      profilePicType: json['profile_pic_type'] as String?,
      academyName: json['academy_name'] as String?,
      branchName: json['branch_name'] as String?,
      branchAddress: json['branch_address'] as String?,
      branchPincode: json['branch_pincode'] as String?,
      firebaseToken: json['firebase_token'] as String?,
      academyTypeId: (json['academy_type_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      countryId: (json['country_id'] as num?)?.toInt(),
      stateId: (json['state_id'] as num?)?.toInt(),
      districtId: (json['district_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RegisterRequestImplToJson(
        _$RegisterRequestImpl instance) =>
    <String, dynamic>{
      'mobile_no': instance.mobileNo,
      'country_code': instance.countryCode,
      'whatsapp_no': instance.whatsappNo,
      'email': instance.email,
      'gender': instance.gender,
      'dob': instance.dob,
      'profile_pic': instance.profilePic,
      'is_trainer': instance.isTrainer,
      'profile_pic_type': instance.profilePicType,
      'academy_name': instance.academyName,
      'branch_name': instance.branchName,
      'branch_address': instance.branchAddress,
      'branch_pincode': instance.branchPincode,
      'firebase_token': instance.firebaseToken,
      'academy_type_id': instance.academyTypeId,
      'name': instance.name,
      'country_id': instance.countryId,
      'state_id': instance.stateId,
      'district_id': instance.districtId,
    };
