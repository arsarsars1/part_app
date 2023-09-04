// To parse this JSON data, do
//
//     final faqList = faqListFromJson(jsonString);

import 'dart:convert';

List<FaqList> faqListFromJson(String str) =>
    List<FaqList>.from(json.decode(str).map((x) => FaqList.fromJson(x)));

String faqListToJson(List<FaqList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FaqList {
  int? id;
  String? question;
  String? answer;
  int? isActive;

  FaqList({
    this.id,
    this.question,
    this.answer,
    this.isActive,
  });

  factory FaqList.fromJson(Map<String, dynamic> json) => FaqList(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
        "is_active": isActive,
      };
}
