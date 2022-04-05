// // To parse this JSON data, do
// //
// To parse this JSON data, do
//
//     final homeMainModel = homeMainModelFromJson(jsonString);

import 'dart:convert';

HomeMainModel homeMainModelFromJson(String str) => HomeMainModel.fromJson(json.decode(str));

String homeMainModelToJson(HomeMainModel data) => json.encode(data.toJson());

class HomeMainModel {
  HomeMainModel({
    required this.status,
    required this.data,
  });

  bool status;
  Data data;

  factory HomeMainModel.fromJson(Map<String, dynamic> json) => HomeMainModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.profile,
    required this.banners,
    required this.businessList,
    required this.userCheckins,
  });

  Profile profile;
  List<Banner> banners;
  List<BusinessList> businessList;
  List<UserCheckin> userCheckins;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    profile: Profile.fromJson(json["profile"]),
    banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
    businessList: List<BusinessList>.from(json["business_list"].map((x) => BusinessList.fromJson(x))),
    userCheckins: List<UserCheckin>.from(json["user_checkins"].map((x) => UserCheckin.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "profile": profile.toJson(),
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
    "business_list": List<dynamic>.from(businessList.map((x) => x.toJson())),
    "user_checkins": List<dynamic>.from(userCheckins.map((x) => x.toJson())),
  };
}

class Banner {
  Banner({
   required this.id,
   required this.bannerName,
   required this.image,
   required this.clickType,
   required this.clickValue,
   required this.status,
   required this.createdAt,
   required this.updatedAt,
  });

  int id;
  String bannerName;
  String image;
  int clickType;
  String clickValue;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class BusinessList {
  BusinessList({
    required this.id,
    required this.businessName,
    required this.businessIdentifier,
    required this.featuredImage,
    required this.address,
    required this.lat,
    required this.long,
    required this.allowedRadius,
    required this.emailAddress,
    required this.contactNumber,
    required this.openingHours,
    required this.description,
    required this.totalCheckins,
    required this.payoutDetails,
    required this.status,
    required this.isFeatured,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.distance,
  });

  int id;
  String businessName;
  String businessIdentifier;
  String featuredImage;
  String address;
  String lat;
  String long;
  String allowedRadius;
  String emailAddress;
  String contactNumber;
  String openingHours;
  String description;
  String totalCheckins;
  String payoutDetails;
  int status;
  String isFeatured;
  DateTime createdAt;
  DateTime updatedAt;
  int createdBy;
  String distance;

  factory BusinessList.fromJson(Map<String, dynamic> json) => BusinessList(
    id: json["id"],
    businessName: json["business_name"],
    businessIdentifier: json["business_identifier"],
    featuredImage: json["featured_image"],
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
    status: json["status"],
    isFeatured: json["is_featured"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdBy: json["created_by"],
    distance: json["distance"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_name": businessName,
    "business_identifier": businessIdentifier,
    "featured_image": featuredImage,
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
    "status": status,
    "is_featured": isFeatured,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "created_by": createdBy,
    "distance": distance,
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
    "dob": "${dob?.year.toString().padLeft(4, '0')}-${dob?.month.toString().padLeft(2, '0')}-${dob?.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "register_device_type": registerDeviceType,
    "level": level,
    "total_points": totalPoints,
    "reset_pass_token": resetPassToken,
    "stripe_id": stripeId,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class UserCheckin {
  UserCheckin({
    required this.featuredImage,
    required this.businessName,
    required this.address,
    required this.createdAt,
    required this.businessId,
  });

  String featuredImage;
  String businessName;
  String address;
  DateTime createdAt;
  int businessId;

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
    "created_at": createdAt.toIso8601String(),
    "business_id": businessId,
  };
}
