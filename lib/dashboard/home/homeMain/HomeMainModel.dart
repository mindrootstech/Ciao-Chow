// To parse this JSON data, do
//
//     final homeMainModel = homeMainModelFromJson(jsonString);

import 'dart:convert';

HomeMainModel homeMainModelFromJson(String str) => HomeMainModel.fromJson(json.decode(str));

String homeMainModelToJson(HomeMainModel data) => json.encode(data.toJson());

class HomeMainModel {
  HomeMainModel({
    this.status,
    this.data,
  });

  bool? status;
  Data? data;

  factory HomeMainModel.fromJson(Map<String, dynamic> json) => HomeMainModel(
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
    this.profile,
    this.banners,
    this.businessList,
    this.userCheckins,
    this.levels,
  });

  Profile? profile;
  List<Banner>? banners;
  List<Business>? businessList;
  List<UserCheckin>? userCheckins;
  List<Level>? levels;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    profile: Profile.fromJson(json["profile"]),
    banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
    businessList: List<Business>.from(json["business_list"].map((x) => Business.fromJson(x))),
    userCheckins: List<UserCheckin>.from(json["user_checkins"].map((x) => UserCheckin.fromJson(x))),
    levels: List<Level>.from(json["levels"].map((x) => Level.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "profile": profile!.toJson(),
    "banners": List<dynamic>.from(banners!.map((x) => x.toJson())),
    "business_list": List<dynamic>.from(businessList!.map((x) => x.toJson())),
    "user_checkins": List<dynamic>.from(userCheckins!.map((x) => x.toJson())),
    "levels": List<dynamic>.from(levels!.map((x) => x.toJson())),
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
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
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
  String? isFeatured;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? distance;
  List<dynamic>? images;
  String? featuredImageUrl;

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
    distance: json["distance"] == null ? null : json["distance"],
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
    "is_featured": isFeatured,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "distance": distance == null ? null : distance,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "featured_image_url": featuredImageUrl,
  };
}

class Level {
  Level({
    this.id,
    this.name,
    this.points,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  int? points;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Level.fromJson(Map<String, dynamic> json) => Level(
    id: json["id"],
    name: json["name"],
    points: json["points"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "points": points,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class Profile {
  Profile({
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

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "business": business!.toJson(),
  };
}
