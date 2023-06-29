// To parse this JSON data, do
//
//     final batchFeeInvoice = batchFeeInvoiceFromJson(jsonString);

import 'dart:convert';

import 'package:part_app/model/data_model/batch_fee_invoice_list.dart';

BatchFeeInvoice batchFeeInvoiceFromJson(String str) =>
    BatchFeeInvoice.fromJson(json.decode(str));

String batchFeeInvoiceToJson(BatchFeeInvoice data) =>
    json.encode(data.toJson());

class BatchFeeInvoice {
  int? status;
  Datum? batchFeeInvoice;

  BatchFeeInvoice({
    this.status,
    this.batchFeeInvoice,
  });

  factory BatchFeeInvoice.fromJson(Map<String, dynamic> json) =>
      BatchFeeInvoice(
        status: json["status"],
        batchFeeInvoice: json["batch_fee_invoice"] == null
            ? null
            : Datum.fromJson(json["batch_fee_invoice"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "batch_fee_invoice": batchFeeInvoice?.toJson(),
      };
}
