// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    this.status,
    this.data,
    this.message,
  });

  bool? status;
  Data? data;
  String? message;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    status: json["status"],
    data: json["data"]== null ? null :Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    this.name,
    this.email,
    this.mobileNumber,
    this.dob,
    this.gender,
    this.registerDeviceType,
    this.stripeId,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.token,
    this.role,
    this.redirectToLogin,
  });

  String? name;
  String? email;
  String? mobileNumber;
  DateTime? dob;
  String? gender;
  String? registerDeviceType;
  String? stripeId;
  int? status;
  DateTime? updatedAt;
  DateTime? createdAt;
  String? token;
  String? role;
  bool? redirectToLogin;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    mobileNumber: json["mobile_number"],
    dob: DateTime.parse(json["dob"]),
    gender: json["gender"],
    registerDeviceType: json["register_device_type"],
    stripeId: json["stripe_id"],
    status: json["status"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    token: json["token"],
    role: json["role"],
    redirectToLogin: json["redirect_to_login"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "mobile_number": mobileNumber,
    "dob": "${dob?.year.toString().padLeft(4, '0')}-${dob?.month.toString().padLeft(2, '0')}-${dob?.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "register_device_type": registerDeviceType,
    "stripe_id": stripeId,
    "status": status,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "token": token,
    "role": role,
    "redirect_to_login": redirectToLogin,
  };
}
