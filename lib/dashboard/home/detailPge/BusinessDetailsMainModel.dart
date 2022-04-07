// To parse this JSON data, do
//
//     final businessDetailsMainModel = businessDetailsMainModelFromJson(jsonString);

import 'dart:convert';

BusinessDetailsMainModel businessDetailsMainModelFromJson(String str) => BusinessDetailsMainModel.fromJson(json.decode(str));

String businessDetailsMainModelToJson(BusinessDetailsMainModel data) => json.encode(data.toJson());

class BusinessDetailsMainModel {
  BusinessDetailsMainModel({
    this.status,
    this.data,
  });

  bool? status;
  Data? data;

  factory BusinessDetailsMainModel.fromJson(Map<String, dynamic> json) => BusinessDetailsMainModel(
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
    this.getBusiness,
    this.usersCheckins,
  });

  GetBusiness? getBusiness;
  String? usersCheckins;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    getBusiness: GetBusiness.fromJson(json["get_business"]),
    usersCheckins: json["users_checkins"],
  );

  Map<String, dynamic> toJson() => {
    "get_business": getBusiness?.toJson(),
    "users_checkins": usersCheckins,
  };
}

class GetBusiness {
  GetBusiness({
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
    this.distance,
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
  String? distance;
  String? featuredImageUrl;
  List<String>? images;

  factory GetBusiness.fromJson(Map<String, dynamic> json) => GetBusiness(
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
    distance: json["distance"],
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
    "distance": distance,
    "featured_image_url": featuredImageUrl,
    "images": List<dynamic>.from(images!.map((x) => x)),
  };
}
