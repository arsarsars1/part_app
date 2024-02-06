// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MembershipImpl _$$MembershipImplFromJson(Map<String, dynamic> json) =>
    _$MembershipImpl(
      id: json['id'] as int,
      membershipType: json['membership_type'] as String?,
      period: json['period'] as String?,
      paymentType: json['payment_type'] as String?,
      duration: json['duration'] as int?,
      amount: json['amount'] as int?,
      finalAmount: json['final_amount'] as int?,
      maxNoOfStudents: json['max_no_of_students'] as int?,
      maxNoOfBranches: json['max_no_of_branches'] as int?,
      isActive: json['is_active'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$MembershipImplToJson(_$MembershipImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'membership_type': instance.membershipType,
      'period': instance.period,
      'payment_type': instance.paymentType,
      'duration': instance.duration,
      'amount': instance.amount,
      'final_amount': instance.finalAmount,
      'max_no_of_students': instance.maxNoOfStudents,
      'max_no_of_branches': instance.maxNoOfBranches,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
