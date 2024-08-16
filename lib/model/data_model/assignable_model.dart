// To parse this JSON data, do
//
//     final assignableModel = assignableModelFromJson(jsonString);

import 'dart:convert';

import 'package:part_app/model/data_model/trainer_response.dart';

AssignableModel assignableModelFromJson(String str) =>
    AssignableModel.fromJson(json.decode(str));

String assignableModelToJson(AssignableModel data) =>
    json.encode(data.toJson());

class AssignableModel {
  List<Trainer> assignable;
  int status;

  AssignableModel({
    required this.assignable,
    required this.status,
  });

  factory AssignableModel.fromJson(Map<String, dynamic> json) =>
      AssignableModel(
        assignable: List<Trainer>.from(
            json["assignable"].map((x) => Trainer.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "assignable": List<dynamic>.from(assignable.map((x) => x.toJson())),
        "status": status,
      };
}

class AssignableTrainer {
  int id;
  String name;
  String morphClass;

  AssignableTrainer({
    required this.id,
    required this.name,
    required this.morphClass,
  });

  factory AssignableTrainer.fromJson(Map<String, dynamic> json) =>
      AssignableTrainer(
        id: json["id"],
        name: json["name"],
        morphClass: json["morph_class"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "morph_class": morphClass,
      };
}
