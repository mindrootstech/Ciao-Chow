// To parse this JSON data, do
//
//     final changePasswordMainModel = changePasswordMainModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordMainModel changePasswordMainModelFromJson(String str) => ChangePasswordMainModel.fromJson(json.decode(str));

String changePasswordMainModelToJson(ChangePasswordMainModel data) => json.encode(data.toJson());

class ChangePasswordMainModel {
  ChangePasswordMainModel({
    this.status,
    this.message,
  });

  bool? status;
  String? message;

  factory ChangePasswordMainModel.fromJson(Map<String, dynamic> json) => ChangePasswordMainModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
