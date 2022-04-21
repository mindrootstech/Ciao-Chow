// To parse this JSON data, do
//
//     final scanEventMainModel = scanEventMainModelFromJson(jsonString);

import 'dart:convert';

ScanEventMainModel scanEventMainModelFromJson(String str) => ScanEventMainModel.fromJson(json.decode(str));

String scanEventMainModelToJson(ScanEventMainModel data) => json.encode(data.toJson());

class ScanEventMainModel {
  ScanEventMainModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory ScanEventMainModel.fromJson(Map<String, dynamic> json) => ScanEventMainModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
