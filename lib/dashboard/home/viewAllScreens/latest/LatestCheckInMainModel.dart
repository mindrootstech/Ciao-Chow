// To parse this JSON data, do
//
//     final latestCheckInMainModel = latestCheckInMainModelFromJson(jsonString);

import 'dart:convert';

LatestCheckInMainModel latestCheckInMainModelFromJson(String str) => LatestCheckInMainModel.fromJson(json.decode(str));

String latestCheckInMainModelToJson(LatestCheckInMainModel data) => json.encode(data.toJson());

class LatestCheckInMainModel {
  LatestCheckInMainModel({
    this.status,
    this.data,
  });

  bool? status;
  Data? data;

  factory LatestCheckInMainModel.fromJson(Map<String, dynamic> json) => LatestCheckInMainModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    required this.userCheckins,
  });

  List<UserCheckin> userCheckins;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userCheckins: List<UserCheckin>.from(json["user_checkins"].map((x) => UserCheckin.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "user_checkins": List<dynamic>.from(userCheckins.map((x) => x.toJson())),
  };
}

class UserCheckin {
  UserCheckin({
    this.featuredImage,
    this.businessName,
    this.address,
    this.createdAt,
    this.businessId,
  });

  String? featuredImage;
  String? businessName;
  String? address;
  DateTime? createdAt;
  int? businessId;

  factory UserCheckin.fromJson(Map<String, dynamic> json) => UserCheckin(
    featuredImage: json["featured_image"],
    businessName: json["business_name"],
    address: json["address"],
    createdAt: DateTime.parse(json["created_at"]),
    businessId: json["business_id"],
  );

  Map<String, dynamic> toJson() => {
    "featured_image": featuredImage,
    "business_name": businessName,
    "address": address,
    "created_at": createdAt?.toIso8601String(),
    "business_id": businessId,
  };
}
