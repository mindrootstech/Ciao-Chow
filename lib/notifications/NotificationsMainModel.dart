// To parse this JSON data, do
//
//     final notificationsMainModel = notificationsMainModelFromJson(jsonString);

import 'dart:convert';

NotificationsMainModel notificationsMainModelFromJson(String str) => NotificationsMainModel.fromJson(json.decode(str));

String notificationsMainModelToJson(NotificationsMainModel data) => json.encode(data.toJson());

class NotificationsMainModel {
  NotificationsMainModel({
    this.status,
    this.data,
  });

  bool? status;
  Data? data;

  factory NotificationsMainModel.fromJson(Map<String, dynamic> json) => NotificationsMainModel(
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
    this.notifications,
  });

  List<Notification>? notifications;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    notifications: List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "notifications": List<dynamic>.from(notifications!.map((x) => x.toJson())),
  };
}

class Notification {
  Notification({
    this.title,
    this.description,
    this.createdAt,
  });

  String? title;
  String? description;
  DateTime? createdAt;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    title: json["title"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "created_at": createdAt!.toIso8601String(),
  };
}
