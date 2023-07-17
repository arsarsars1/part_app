// To parse this JSON data, do
//
//     final feeDetailHistory = feeDetailHistoryFromJson(jsonString);

import 'dart:convert';

import 'package:part_app/model/data_model/batch_fee_invoice_list.dart';

FeeDetailHistory feeDetailHistoryFromJson(String str) =>
    FeeDetailHistory.fromJson(json.decode(str));

String feeDetailHistoryToJson(FeeDetailHistory data) =>
    json.encode(data.toJson());

class FeeDetailHistory {
  int? status;
  FeeDetailHistoryClass? feeDetailHistory;

  FeeDetailHistory({
    this.status,
    this.feeDetailHistory,
  });

  factory FeeDetailHistory.fromJson(Map<String, dynamic> json) =>
      FeeDetailHistory(
        status: json["status"],
        feeDetailHistory: json["fee_detail_history"] == null
            ? null
            : FeeDetailHistoryClass.fromJson(json["fee_detail_history"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "fee_detail_history": feeDetailHistory?.toJson(),
      };
}

class FeeDetailHistoryClass {
  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;

  FeeDetailHistoryClass({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
  });

  factory FeeDetailHistoryClass.fromJson(Map<String, dynamic> json) =>
      FeeDetailHistoryClass(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
      };
}
