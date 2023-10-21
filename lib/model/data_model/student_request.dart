// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'student_request.freezed.dart';
part 'student_request.g.dart';

@freezed
abstract class StudentRequest with _$StudentRequest {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory StudentRequest({
    String? name,
    String? mobileNo,
    int? countryCode,
    String? gender,
    String? dob,
    String? doj,
    String? whatsappNo,
    String? email,
    String? feeType,
    dynamic feeAmount,
    dynamic admissionFees,
    int? batchId,
    int? isParent,
    int? isCourseFeesPaid,
    int? isAdmissionFeesPaid,
    int? noOfClasses,
    int? paymentDueDate,
    String? address,
    String? parentName,
  }) = _StudentRequest;

  factory StudentRequest.fromJson(Map<String, dynamic> json) =>
      _$StudentRequestFromJson(json);
}
