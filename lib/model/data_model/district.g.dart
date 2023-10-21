// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_District _$$_DistrictFromJson(Map<String, dynamic> json) => _$_District(
      message: json['message'] as String?,
      id: json['id'] as int,
      districtName: json['district_name'] as String?,
      stateName: json['state_name'] as String?,
    );

Map<String, dynamic> _$$_DistrictToJson(_$_District instance) =>
    <String, dynamic>{
      'message': instance.message,
      'id': instance.id,
      'district_name': instance.districtName,
      'state_name': instance.stateName,
    };
