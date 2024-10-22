// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'manager_request.freezed.dart';
part 'manager_request.g.dart';

@freezed
abstract class ManagerRequest with _$ManagerRequest {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ManagerRequest({
    List<String>? branchId,
    String? name,
    String? mobileNo,
    int? countryCode,
    String? gender,
    String? dob,
    String? doj,
    String? whatsappNo,
    String? email,
    String? salaryType,
    String? salaryDate,
    String? salaryAmount,
    String? upiId,
    String? address,
  }) = _ManagerRequest;

  factory ManagerRequest.fromJson(Map<String, dynamic> json) =>
      _$ManagerRequestFromJson(json);
}
