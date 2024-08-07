// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentRequestImpl _$$StudentRequestImplFromJson(Map<String, dynamic> json) =>
    _$StudentRequestImpl(
      name: json['name'] as String?,
      mobileNo: json['mobile_no'] as String?,
      countryCode: (json['country_code'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      doj: json['doj'] as String?,
      whatsappNo: json['whatsapp_no'] as String?,
      email: json['email'] as String?,
      feeType: json['fee_type'] as String?,
      feeAmount: json['fee_amount'],
      admissionFees: json['admission_fees'],
      batchId: (json['batch_id'] as num?)?.toInt(),
      isParent: (json['is_parent'] as num?)?.toInt(),
      isCourseFeesPaid: (json['is_course_fees_paid'] as num?)?.toInt(),
      isAdmissionFeesPaid: (json['is_admission_fees_paid'] as num?)?.toInt(),
      noOfClasses: (json['no_of_classes'] as num?)?.toInt(),
      paymentDueDate: (json['payment_due_date'] as num?)?.toInt(),
      address: json['address'] as String?,
      parentName: json['parent_name'] as String?,
    );

Map<String, dynamic> _$$StudentRequestImplToJson(
        _$StudentRequestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mobile_no': instance.mobileNo,
      'country_code': instance.countryCode,
      'gender': instance.gender,
      'dob': instance.dob,
      'doj': instance.doj,
      'whatsapp_no': instance.whatsappNo,
      'email': instance.email,
      'fee_type': instance.feeType,
      'fee_amount': instance.feeAmount,
      'admission_fees': instance.admissionFees,
      'batch_id': instance.batchId,
      'is_parent': instance.isParent,
      'is_course_fees_paid': instance.isCourseFeesPaid,
      'is_admission_fees_paid': instance.isAdmissionFeesPaid,
      'no_of_classes': instance.noOfClasses,
      'payment_due_date': instance.paymentDueDate,
      'address': instance.address,
      'parent_name': instance.parentName,
    };
