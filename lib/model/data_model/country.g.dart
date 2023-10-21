// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Country _$$_CountryFromJson(Map<String, dynamic> json) => _$_Country(
      id: json['id'] as int,
      capital: json['capital'] as String?,
      citizenship: json['citizenship'] as String?,
      countryCode: json['country_code'] as String?,
      currency: json['currency'] as String?,
      currencyCode: json['currency_code'] as String?,
      currencySubUnit: json['currency_sub_unit'] as String?,
      currencySymbol: json['currency_symbol'] as String?,
      currencyDecimals: json['currency_decimals'] as int?,
      fullName: json['full_name'] as String?,
      iso31662: json['iso31662'] as String?,
      iso31663: json['iso31663'] as String?,
      name: json['name'] as String?,
      regionCode: json['region_code'] as String?,
      subRegionCode: json['sub_region_code'] as String?,
      eea: json['eea'] as int?,
      callingCode: json['calling_code'] as String?,
      flag: json['flag'] as String?,
      timezone: json['timezone'] as String?,
      isActive: json['is_active'] as int?,
    );

Map<String, dynamic> _$$_CountryToJson(_$_Country instance) =>
    <String, dynamic>{
      'id': instance.id,
      'capital': instance.capital,
      'citizenship': instance.citizenship,
      'country_code': instance.countryCode,
      'currency': instance.currency,
      'currency_code': instance.currencyCode,
      'currency_sub_unit': instance.currencySubUnit,
      'currency_symbol': instance.currencySymbol,
      'currency_decimals': instance.currencyDecimals,
      'full_name': instance.fullName,
      'iso31662': instance.iso31662,
      'iso31663': instance.iso31663,
      'name': instance.name,
      'region_code': instance.regionCode,
      'sub_region_code': instance.subRegionCode,
      'eea': instance.eea,
      'calling_code': instance.callingCode,
      'flag': instance.flag,
      'timezone': instance.timezone,
      'is_active': instance.isActive,
    };
