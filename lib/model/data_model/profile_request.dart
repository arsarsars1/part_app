import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

class ProfileRequest {
  final String? name;

  final File? image;

  final String? email;

  @JsonKey(name: 'country_code')
  final String? countryCode;

  @JsonKey(name: 'whatsapp_no')
  final String? whatsappNo;

  @JsonKey(name: 'mobile_no')
  final String? mobileNo;

  final String? dob;

  ProfileRequest({
    this.name,
    this.image,
    this.countryCode,
    this.email,
    this.whatsappNo,
    this.mobileNo,
    this.dob,
  });
}
