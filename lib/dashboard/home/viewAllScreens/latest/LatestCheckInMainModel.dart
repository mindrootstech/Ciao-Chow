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
    this.userCheckins,
    this.userCheckinsCount,
  });

  List<UserCheckin>? userCheckins;
  int? userCheckinsCount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userCheckins: List<UserCheckin>.from(json["user_checkins"].map((x) => UserCheckin.fromJson(x))),
    userCheckinsCount: json["user_checkins_count"],
  );

  Map<String, dynamic> toJson() => {
    "user_checkins": List<dynamic>.from(userCheckins!.map((x) => x.toJson())),
    "user_checkins_count": userCheckinsCount,
  };
}

class UserCheckin {
  UserCheckin({
    this.id,
    this.userId,
    this.businessId,
    this.userLat,
    this.userLong,
    this.createdAt,
    this.updatedAt,
    this.business,
  });

  int? id;
  int? userId;
  int? businessId;
  String? userLat;
  String? userLong;
  DateTime? createdAt;
  DateTime? updatedAt;
  Business? business;

  factory UserCheckin.fromJson(Map<String, dynamic> json) => UserCheckin(
    id: json["id"],
    userId: json["user_id"],
    businessId: json["business_id"],
    userLat: json["user_lat"],
    userLong: json["user_long"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    business: Business.fromJson(json["business"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "business_id": businessId,
    "user_lat": userLat,
    "user_long": userLong,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "business": business?.toJson(),
  };
}

class Business {
  Business({
    this.id,
    this.businessName,
    this.businessIdentifier,
    this.address,
    this.lat,
    this.long,
    this.allowedRadius,
    this.emailAddress,
    this.contactNumber,
    this.openingHours,
    this.description,
    this.totalCheckins,
    this.payoutDetails,
    this.isFeatured,
    this.createdAt,
    this.updatedAt,
    this.featuredImageUrl,
    this.images,
  });

  int? id;
  String? businessName;
  String? businessIdentifier;
  String? address;
  String? lat;
  String? long;
  String? allowedRadius;
  String? emailAddress;
  String? contactNumber;
  String? openingHours;
  String? description;
  String? totalCheckins;
  String? payoutDetails;
  String? isFeatured;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? featuredImageUrl;
  List<String>? images;

  factory Business.fromJson(Map<String, dynamic> json) => Business(
    id: json["id"],
    businessName: json["business_name"],
    businessIdentifier: json["business_identifier"],
    address: json["address"],
    lat: json["lat"],
    long: json["long"],
    allowedRadius: json["allowed_radius"],
    emailAddress: json["email_address"],
    contactNumber: json["contact_number"],
    openingHours: json["opening_hours"],
    description: json["description"],
    totalCheckins: json["total_checkins"],
    payoutDetails: json["payout_details"],
    isFeatured: json["is_featured"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    featuredImageUrl: json["featured_image_url"],
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_name": businessName,
    "business_identifier": businessIdentifier,
    "address": address,
    "lat": lat,
    "long": long,
    "allowed_radius": allowedRadius,
    "email_address": emailAddress,
    "contact_number": contactNumber,
    "opening_hours": openingHours,
    "description": description,
    "total_checkins": totalCheckins,
    "payout_details": payoutDetails,
    "is_featured": isFeatured,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "featured_image_url": featuredImageUrl,
    "images": List<dynamic>.from(images!.map((x) => x)),
  };
}
