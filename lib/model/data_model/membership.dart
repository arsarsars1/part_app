import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'membership.freezed.dart';
part 'membership.g.dart';

List<Membership> membershipFromJson(String str) =>
    List<Membership>.from(json.decode(str).map((x) => Membership.fromJson(x)));

String membershipToJson(List<Membership> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
abstract class Membership with _$Membership {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Membership({
    required int id,
    String? membershipType,
    String? period,
    String? paymentType,
    int? duration,
    int? amount,
    int? finalAmount,
    int? maxNoOfStudents,
    int? maxNoOfBranches,
    int? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Membership;

  factory Membership.fromJson(Map<String, dynamic> json) =>
      _$MembershipFromJson(json);
}
