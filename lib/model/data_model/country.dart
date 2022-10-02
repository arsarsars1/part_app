import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'country.freezed.dart';
part 'country.g.dart';

List<Country> countriesFromJson(String str) =>
    List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countriesToJson(List<Country> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class Country with _$Country {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Country({
    required int id,
    String? capital,
    String? citizenship,
    String? countryCode,
    String? currency,
    String? currencyCode,
    String? currencySubUnit,
    String? currencySymbol,
    int? currencyDecimals,
    String? fullName,
    String? iso31662,
    String? iso31663,
    String? name,
    String? regionCode,
    String? subRegionCode,
    int? eea,
    String? callingCode,
    String? flag,
    String? timezone,
    int? isActive,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}
