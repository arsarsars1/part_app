// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DistrictImpl _$$DistrictImplFromJson(Map<String, dynamic> json) =>
    _$DistrictImpl(
      message: json['message'] as String?,
      id: (json['id'] as num).toInt(),
      districtName: json['district_name'] as String?,
      stateName: json['state_name'] as String?,
    );

Map<String, dynamic> _$$DistrictImplToJson(_$DistrictImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'id': instance.id,
      'district_name': instance.districtName,
      'state_name': instance.stateName,
    };
