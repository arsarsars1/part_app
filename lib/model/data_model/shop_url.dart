// To parse this JSON data, do
//
//     final shopUrl = shopUrlFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'shop_url.freezed.dart';
part 'shop_url.g.dart';

ShopUrl shopUrlFromJson(String str) => ShopUrl.fromJson(json.decode(str));

String shopUrlToJson(ShopUrl data) => json.encode(data.toJson());

@freezed
class ShopUrl with _$ShopUrl {
  const factory ShopUrl({
    String? url,
    int? status,
  }) = _ShopUrl;

  factory ShopUrl.fromJson(Map<String, dynamic> json) =>
      _$ShopUrlFromJson(json);
}
