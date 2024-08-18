import 'dart:convert';

LeadsStatuses leadsStatusesFromJson(String str) =>
    LeadsStatuses.fromJson(json.decode(str));

String leadsStatusesToJson(LeadsStatuses data) => json.encode(data.toJson());

class LeadsStatuses {
  int? status;
  List<LeadStatus>? leadStatuses;

  LeadsStatuses({
    this.status,
    this.leadStatuses,
  });

  factory LeadsStatuses.fromJson(Map<String, dynamic> json) => LeadsStatuses(
        status: json["status"],
        leadStatuses: json["lead_statuses"] == null
            ? []
            : List<LeadStatus>.from(
                json["lead_statuses"]!.map((x) => LeadStatus.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "lead_statuses": leadStatuses == null
            ? []
            : List<dynamic>.from(leadStatuses!.map((x) => x.toJson())),
      };
}

class LeadStatus {
  int? id;
  String? leadStatus;
  int? leadsCount;
  String? slug;

  LeadStatus({
    this.id,
    this.leadStatus,
    this.leadsCount,
    this.slug,
  });

  factory LeadStatus.fromJson(Map<String, dynamic> json) => LeadStatus(
        id: json["id"],
        leadStatus: json["lead_status"],
        leadsCount: json["leads_count"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lead_status": leadStatus,
        "leads_count": leadsCount,
        "slug": slug,
      };
}
