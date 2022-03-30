// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SignInModel loginModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String welcomeToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  SignInModel({
    required this.status,
    required this.data,
    required this.imageUrl,
  });

  bool status;
  Data data;
  String imageUrl;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "image_url": imageUrl,
  };
}

class Data {
  Data({
    required this.name,
    required this.profileImage,
    required this.email,
    required this.mobileNumber,
    required this.dob,
    required this.gender,
    required this.registerDeviceType,
    required this.level,
    required this.totalPoints,
    required this.resetPassToken,
    required this.stripeId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
  });

  String name;
  String profileImage;
  String email;
  String mobileNumber;
  DateTime dob;
  int gender;
  int registerDeviceType;
  int level;
  int totalPoints;
  String resetPassToken;
  String stripeId;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  String token;

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
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "profile_image": profileImage,
    "email": email,
    "mobile_number": mobileNumber,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "register_device_type": registerDeviceType,
    "level": level,
    "total_points": totalPoints,
    "reset_pass_token": resetPassToken,
    "stripe_id": stripeId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "token": token,
  };
}
