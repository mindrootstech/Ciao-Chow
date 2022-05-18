// To parse this JSON data, do
//
//     final checkInMainModel = checkInMainModelFromJson(jsonString);

import 'dart:convert';

CheckInMainModel checkInMainModelFromJson(String str) => CheckInMainModel.fromJson(json.decode(str));

String checkInMainModelToJson(CheckInMainModel data) => json.encode(data.toJson());

class CheckInMainModel {
  CheckInMainModel({
    this.status,
    this.data,
    this.message,
    this.businessName,
  });

  bool? status;
  Data? data;
  String? message;
  String? businessName;

  factory CheckInMainModel.fromJson(Map<String, dynamic> json) => CheckInMainModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
    businessName: json["business_name"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data!.toJson(),
    "message": message,
    "business_name": businessName,
  };
}

class Data {
  Data({
    this.userCheckin,
  });

  UserCheckin? userCheckin;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userCheckin: UserCheckin.fromJson(json["user_checkin"]),
  );

  Map<String, dynamic> toJson() => {
    "user_checkin": userCheckin!.toJson(),
  };
}

class UserCheckin {
  UserCheckin({
    this.userId,
    this.businessId,
    this.userLat,
    this.userLong,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  int? userId;
  int? businessId;
  String? userLat;
  String? userLong;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory UserCheckin.fromJson(Map<String, dynamic> json) => UserCheckin(
    userId: json["user_id"],
    businessId: json["business_id"],
    userLat: json["user_lat"],
    userLong: json["user_long"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "business_id": businessId,
    "user_lat": userLat,
    "user_long": userLong,
    "updated_at": updatedAt!.toIso8601String(),
    "created_at": createdAt!.toIso8601String(),
    "id": id,
  };
}
