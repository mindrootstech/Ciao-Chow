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
    "data": data!.toJson(),
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
    this.clickType,
    this.clickValue,
    this.bannerName,
    this.image,
  });

  int? clickType;
  String? clickValue;
  String? bannerName;
  String? image;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    clickType: json["click_type"],
    clickValue: json["click_value"],
    bannerName: json["banner_name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "click_type": clickType,
    "click_value": clickValue,
    "banner_name": bannerName,
    "image": image,
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
    this.payoutAmount,
    this.isFeatured,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.distance,
    this.images,
    this.featuredImageUrl,
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
  double? payoutAmount;
  String? isFeatured;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? distance;
  List<dynamic>? images;
  String? featuredImageUrl;

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
    payoutAmount: json["payout_amount"].toDouble(),
    isFeatured: json["is_featured"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    distance: json["distance"],
    images: List<dynamic>.from(json["images"].map((x) => x)),
    featuredImageUrl: json["featured_image_url"],
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
    "payout_amount": payoutAmount,
    "is_featured": isFeatured,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "deleted_at": deletedAt,
    "distance": distance,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "featured_image_url": featuredImageUrl,
  };
}
