// To parse this JSON data, do
//
//     final dashboard = dashboardFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard.freezed.dart';
part 'dashboard.g.dart';

Dashboard dashboardFromJson(String str) => Dashboard.fromJson(json.decode(str));

String dashboardToJson(Dashboard data) => json.encode(data.toJson());

@freezed
abstract class Dashboard with _$Dashboard {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Dashboard({
    int? status,
    int? unreadNotificationsCount,
    int? totalStudents,
    String? totalPaymentsDaily,
    String? totalPaymentsMonthly,
    List<Banner>? banners,
  }) = _Dashboard;

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
}

@freezed
abstract class Banner with _$Banner {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Banner({
    int? id,
    String? description,
    String? imageUrl,
    String? extUrl,
    String? extUrlButtonText,
    DateTime? startTime,
    DateTime? endTime,
    int? order,
    int? academyTypeId,
    int? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Banner;

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);
}
