// To parse this JSON data, do
//
//     final salarySlip = salarySlipFromJson(jsonString);

import 'dart:convert';

import 'package:part_app/model/data_model/trainer_salary_slip.dart';

SalarySlip salarySlipFromJson(String str) =>
    SalarySlip.fromJson(json.decode(str));

String salarySlipToJson(SalarySlip data) => json.encode(data.toJson());

class SalarySlip {
  int? status;
  Data? salarySlip;

  SalarySlip({
    this.status,
    this.salarySlip,
  });

  factory SalarySlip.fromJson(Map<String, dynamic> json) => SalarySlip(
        status: json["status"],
        salarySlip: json["salary_slip"] == null
            ? null
            : Data.fromJson(json["salary_slip"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "salary_slip": salarySlip?.toJson(),
      };
}
