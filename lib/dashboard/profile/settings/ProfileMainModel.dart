// To parse this JSON data, do
//
//     final profileMainModel = profileMainModelFromJson(jsonString);

import 'dart:convert';

ProfileMainModel profileMainModelFromJson(String str) => ProfileMainModel.fromJson(json.decode(str));

String profileMainModelToJson(ProfileMainModel data) => json.encode(data.toJson());

class ProfileMainModel {
  ProfileMainModel({
    this.status,
    this.data,
  });

  bool? status;
  Data? data;

  factory ProfileMainModel.fromJson(Map<String, dynamic> json) => ProfileMainModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.name,
    this.profileImage,
    this.email,
    this.mobileNumber,
    this.dob,
    this.gender,
    this.registerDeviceType,
    this.level,
    this.totalPoints,
    this.resetPassToken,
    this.stripeId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String? name;
  String? profileImage;
  String? email;
  String? mobileNumber;
  DateTime? dob;
  int? gender;
  int? registerDeviceType;
  int? level;
  int? totalPoints;
  String? resetPassToken;
  String? stripeId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    profileImage: json["profile_image"],
    email: json["email"],
    mobileNumber: json["mobile_number"],
    dob: DateTime.parse(json["dob"]),
    gender: json["gender"],
    registerDeviceType: json["register_device_type"],
    level: json["level"],
    totalPoints: json["total_points"],
    resetPassToken: json["reset_pass_token"],
    stripeId: json["stripe_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "profile_image": profileImage,
    "email": email,
    "mobile_number": mobileNumber,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "register_device_type": registerDeviceType,
    "level": level,
    "total_points": totalPoints,
    "reset_pass_token": resetPassToken,
    "stripe_id": stripeId,
    "status": status,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
