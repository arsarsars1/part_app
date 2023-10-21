// To parse this JSON data, do
//
//     final studentAppBranches = studentAppBranchesFromJson(jsonString);

import 'dart:convert';

StudentAppBranches studentAppBranchesFromJson(String str) =>
    StudentAppBranches.fromJson(json.decode(str));

String studentAppBranchesToJson(StudentAppBranches data) =>
    json.encode(data.toJson());

class StudentAppBranches {
  Branches? branches;
  int? status;

  StudentAppBranches({
    this.branches,
    this.status,
  });

  factory StudentAppBranches.fromJson(Map<String, dynamic> json) =>
      StudentAppBranches(
        branches: json["branches"] == null
            ? null
            : Branches.fromJson(json["branches"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "branches": branches?.toJson(),
        "status": status,
      };
}

class Branches {
  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;

  Branches({
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

  factory Branches.fromJson(Map<String, dynamic> json) => Branches(
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

class Datum {
  int? id;
  String? branchName;
  int? academyId;
  int? countryId;
  int? managerDetailId;
  int? stateId;
  int? districtId;
  String? address;
  int? pincode;
  String? currency;
  int? isActive;
  Country? country;
  StateDetails? state;
  District? district;
  Timezone? timezone;

  Datum({
    this.id,
    this.branchName,
    this.academyId,
    this.countryId,
    this.managerDetailId,
    this.stateId,
    this.districtId,
    this.address,
    this.pincode,
    this.currency,
    this.isActive,
    this.country,
    this.state,
    this.district,
    this.timezone,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        branchName: json["branch_name"],
        academyId: json["academy_id"],
        countryId: json["country_id"],
        managerDetailId: json["manager_detail_id"],
        stateId: json["state_id"],
        districtId: json["district_id"],
        address: json["address"],
        pincode: json["pincode"],
        currency: json["currency"],
        isActive: json["is_active"],
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
        state: json["state"] == null ? null : StateDetails.fromJson(json["state"]),
        district: json["district"] == null
            ? null
            : District.fromJson(json["district"]),
        timezone: json["timezone"] == null
            ? null
            : Timezone.fromJson(json["timezone"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "branch_name": branchName,
        "academy_id": academyId,
        "country_id": countryId,
        "manager_detail_id": managerDetailId,
        "state_id": stateId,
        "district_id": districtId,
        "address": address,
        "pincode": pincode,
        "currency": currency,
        "is_active": isActive,
        "country": country?.toJson(),
        "state": state?.toJson(),
        "district": district?.toJson(),
        "timezone": timezone?.toJson(),
      };
}

class Country {
  int? id;
  String? name;
  String? currency;
  String? currencySymbol;
  String? currencyCode;
  String? timezone;
  String? currencySubUnit;

  Country({
    this.id,
    this.name,
    this.currency,
    this.currencySymbol,
    this.currencyCode,
    this.timezone,
    this.currencySubUnit,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        currency: json["currency"],
        currencySymbol: json["currency_symbol"],
        currencyCode: json["currency_code"],
        timezone: json["timezone"],
        currencySubUnit: json["currency_sub_unit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "currency": currency,
        "currency_symbol": currencySymbol,
        "currency_code": currencyCode,
        "timezone": timezone,
        "currency_sub_unit": currencySubUnit,
      };
}

class District {
  int? id;
  String? districtName;

  District({
    this.id,
    this.districtName,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"],
        districtName: json["district_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "district_name": districtName,
      };
}

class StateDetails {
  int? id;
  String? stateName;

  StateDetails({
    this.id,
    this.stateName,
  });

  factory StateDetails.fromJson(Map<String, dynamic> json) => StateDetails(
        id: json["id"],
        stateName: json["state_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "state_name": stateName,
      };
}

class Timezone {
  int? id;
  String? timezone;

  Timezone({
    this.id,
    this.timezone,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        id: json["id"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "timezone": timezone,
      };
}
