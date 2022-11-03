import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_request.freezed.dart';
part 'trainer_request.g.dart';

@freezed
abstract class TrainerRequest with _$TrainerRequest {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TrainerRequest({
    String? name,
    String? mobileNo,
    int? countryCode,
    String? gender,
    String? dob,
    String? doj,
    String? whatsappNo,
    String? email,
    String? salaryType,
    int? salaryDate,
    String? salaryAmount,
    List<int>? branchId,
    String? upiId,
  }) = _TrainerRequest;

  factory TrainerRequest.fromJson(Map<String, dynamic> json) =>
      _$TrainerRequestFromJson(json);
}
