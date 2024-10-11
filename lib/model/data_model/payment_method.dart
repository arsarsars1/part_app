import 'dart:convert';

PaymentMethodModel paymentMethodModelFromJson(String str) =>
    PaymentMethodModel.fromJson(json.decode(str));

String paymentMethodModelToJson(PaymentMethodModel data) =>
    json.encode(data.toJson());

class PaymentMethodModel {
  int status;
  List<String> paymentMethods;

  PaymentMethodModel({
    required this.status,
    this.paymentMethods = const [],
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodModel(
        status: json["status"],
        paymentMethods:
            List<String>.from(json["payment_methods"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "payment_methods": List<dynamic>.from(paymentMethods.map((x) => x)),
      };
}
