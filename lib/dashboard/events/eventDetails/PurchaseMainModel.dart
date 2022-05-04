// To parse this JSON data, do
//
//     final purchaseMainModel = purchaseMainModelFromJson(jsonString);

import 'dart:convert';

PurchaseMainModel purchaseMainModelFromJson(String str) => PurchaseMainModel.fromJson(json.decode(str));

String purchaseMainModelToJson(PurchaseMainModel data) => json.encode(data.toJson());

class PurchaseMainModel {
  PurchaseMainModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory PurchaseMainModel.fromJson(Map<String, dynamic> json) => PurchaseMainModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
