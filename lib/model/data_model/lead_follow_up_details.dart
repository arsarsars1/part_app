// // ignore_for_file: invalid_annotation_target
//
// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'lead_follow_up_details.freezed.dart';
// part 'lead_follow_up_details.g.dart';
//
// @freezed
// abstract class LeadFollowUpDetails with _$LeadFollowUpDetailsFromJson {
//   @JsonSerializable(fieldRename: FieldRename.snake)
//   const factory LeadFollowUpDetails({
//     String? followUpStatus,
//     String? followUpDate,
//     String? followUpTime,
//     int? assignedToId,
//     String? assignedToType,
//     String? followUpComment,
//   }) = _LeadFollowUpDetails;
//
//   factory LeadFollowUpDetails.fromJson(Map<String, dynamic> json) =>
//       _$LeadFollowUpDetailsFromJson(json);
// }
