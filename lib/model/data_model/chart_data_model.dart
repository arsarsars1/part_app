import 'dart:convert';

import 'package:part_app/model/data_model/lead_statuses.dart';

ChartDataModel chartDataModelFromJson(String str) =>
    ChartDataModel.fromJson(json.decode(str));

String chartDataModelToJson(ChartDataModel data) => json.encode(data.toJson());

class ChartDataModel {
  int? status;
  int? todaysFollowUp;
  List<LeadStatus>? chartData;

  ChartDataModel({
    this.status,
    this.todaysFollowUp,
    this.chartData,
  });

  factory ChartDataModel.fromJson(Map<String, dynamic> json) => ChartDataModel(
        status: json["status"],
        todaysFollowUp: json["todays_follow_up"],
        chartData: json["chart_data"] == null
            ? []
            : List<LeadStatus>.from(
                json["chart_data"]!.map((x) => LeadStatus.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "todays_follow_up": todaysFollowUp,
        "chart_data": chartData == null
            ? []
            : List<LeadStatus>.from(
                chartData!.map((x) => x.toJson()),
              ),
      };
}
