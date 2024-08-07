// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardImpl _$$DashboardImplFromJson(Map<String, dynamic> json) =>
    _$DashboardImpl(
      status: (json['status'] as num?)?.toInt(),
      totalStudents: (json['total_students'] as num?)?.toInt(),
      totalPaymentsDaily: json['total_payments_daily'] as String?,
      totalPaymentsMonthly: json['total_payments_monthly'] as String?,
      banners: (json['banners'] as List<dynamic>?)
          ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DashboardImplToJson(_$DashboardImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'total_students': instance.totalStudents,
      'total_payments_daily': instance.totalPaymentsDaily,
      'total_payments_monthly': instance.totalPaymentsMonthly,
      'banners': instance.banners,
    };

_$BannerImpl _$$BannerImplFromJson(Map<String, dynamic> json) => _$BannerImpl(
      id: (json['id'] as num?)?.toInt(),
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      extUrl: json['ext_url'] as String?,
      extUrlButtonText: json['ext_url_button_text'] as String?,
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time'] as String),
      endTime: json['end_time'] == null
          ? null
          : DateTime.parse(json['end_time'] as String),
      order: (json['order'] as num?)?.toInt(),
      academyTypeId: (json['academy_type_id'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$BannerImplToJson(_$BannerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'ext_url': instance.extUrl,
      'ext_url_button_text': instance.extUrlButtonText,
      'start_time': instance.startTime?.toIso8601String(),
      'end_time': instance.endTime?.toIso8601String(),
      'order': instance.order,
      'academy_type_id': instance.academyTypeId,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
