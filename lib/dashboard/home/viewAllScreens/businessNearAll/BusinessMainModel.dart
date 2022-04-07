// To parse this JSON data, do
//
//     final businessMainModel = businessMainModelFromJson(jsonString);

import 'dart:convert';

BusinessMainModel businessMainModelFromJson(String str) => BusinessMainModel.fromJson(json.decode(str));

String businessMainModelToJson(BusinessMainModel data) => json.encode(data.toJson());

class BusinessMainModel {
  BusinessMainModel({
    this.status,
    this.data,
  });

  bool? status;
  Data? data;

  factory BusinessMainModel.fromJson(Map<String, dynamic> json) => BusinessMainModel(
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
    this.banners,
    this.businessList,
    this.businessCount,
  });

  List<Banner>? banners;
  List<BusinessList>? businessList;
  int? businessCount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
    businessList: List<BusinessList>.from(json["business_list"].map((x) => BusinessList.fromJson(x))),
    businessCount: json["business_count"],
  );

  Map<String, dynamic> toJson() => {
    "banners": List<dynamic>.from(banners!.map((x) => x.toJson())),
    "business_list": List<dynamic>.from(businessList!.map((x) => x.toJson())),
    "business_count": businessCount,
  };
}

class Banner {
  Banner({
    this.id,
    this.bannerName,
    this.image,
    this.clickType,
    this.clickValue,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? bannerName;
  String? image;
  int? clickType;
  String? clickValue;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"],
    bannerName: json["banner_name"],
    image: json["image"],
    clickType: json["click_type"],
    clickValue: json["click_value"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "banner_name": bannerName,
    "image": image,
    "click_type": clickType,
    "click_value": clickValue,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class BusinessList {
  BusinessList({
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

  factory BusinessList.fromJson(Map<String, dynamic> json) => BusinessList(
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
