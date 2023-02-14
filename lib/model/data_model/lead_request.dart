import 'package:freezed_annotation/freezed_annotation.dart';

part 'lead_request.freezed.dart';
part 'lead_request.g.dart';

@freezed
abstract class LeadRequest with _$LeadRequest {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory LeadRequest({
    int? branchId,
    int? batchId,
    String? leadStatus,
    String? name,
    String? mobileNo,
    String? gender,
    String? age,
    String? whatsappNo,
    String? email,
    String? followUpDate,
    String? followUpTime,
    int? assignedToId,
    String? assignedToType,
    String? followUpComment,
  }) = _LeadRequest;

  factory LeadRequest.fromJson(Map<String, dynamic> json) =>
      _$LeadRequestFromJson(json);
}
