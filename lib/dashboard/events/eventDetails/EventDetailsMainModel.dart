// To parse this JSON data, do
//
//     final eventDetailsMainModel = eventDetailsMainModelFromJson(jsonString);

import 'dart:convert';

EventDetailsMainModel eventDetailsMainModelFromJson(String str) => EventDetailsMainModel.fromJson(json.decode(str));

String eventDetailsMainModelToJson(EventDetailsMainModel data) => json.encode(data.toJson());

class EventDetailsMainModel {
  EventDetailsMainModel({
    this.status,
    this.data,
  });

  bool? status;
  Data? data;

  factory EventDetailsMainModel.fromJson(Map<String, dynamic> json) => EventDetailsMainModel(
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
    this.event,
    this.eventBuy,
  });

  Event? event;
  String? eventBuy;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    event: Event.fromJson(json["event"]),
    eventBuy: json["event_buy"],
  );

  Map<String, dynamic> toJson() => {
    "event": event!.toJson(),
    "event_buy": eventBuy,
  };
}

class Event {
  Event({
    this.id,
    this.businessId,
    this.eventName,
    this.eventIdentifier,
    this.eventStartDate,
    this.eventEndDate,
    this.eventDurationDescription,
    this.ticketSaleStartDate,
    this.ticketSaleEndDate,
    this.maxTicketsPerCustomer,
    this.scanNumber,
    this.termsConditions,
    this.totalTickets,
    this.availableTickets,
    this.ticketPrice,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.featuredImageUrl,
    this.business,
  });

  int? id;
  int? businessId;
  String? eventName;
  String? eventIdentifier;
  DateTime? eventStartDate;
  DateTime? eventEndDate;
  String? eventDurationDescription;
  DateTime? ticketSaleStartDate;
  DateTime? ticketSaleEndDate;
  String? maxTicketsPerCustomer;
  String? scanNumber;
  String? termsConditions;
  String? totalTickets;
  String? availableTickets;
  String? ticketPrice;
  String? description;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? createdBy;
  String? featuredImageUrl;
  Business? business;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["id"],
    businessId: json["business_id"],
    eventName: json["event_name"],
    eventIdentifier: json["event_identifier"],
    eventStartDate: DateTime.parse(json["event_start_date"]),
    eventEndDate: DateTime.parse(json["event_end_date"]),
    eventDurationDescription: json["event_duration_description"],
    ticketSaleStartDate: DateTime.parse(json["ticket_sale_start_date"]),
    ticketSaleEndDate: DateTime.parse(json["ticket_sale_end_date"]),
    maxTicketsPerCustomer: json["max_tickets_per_customer"],
    scanNumber: json["scan_number"],
    termsConditions: json["terms_conditions"],
    totalTickets: json["total_tickets"],
    availableTickets: json["available_tickets"],
    ticketPrice: json["ticket_price"],
    description: json["description"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdBy: json["created_by"],
    featuredImageUrl: json["featured_image_url"],
    business: Business.fromJson(json["business"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "business_id": businessId,
    "event_name": eventName,
    "event_identifier": eventIdentifier,
    "event_start_date": "${eventStartDate!.year.toString().padLeft(4, '0')}-${eventStartDate!.month.toString().padLeft(2, '0')}-${eventStartDate!.day.toString().padLeft(2, '0')}",
    "event_end_date": "${eventEndDate!.year.toString().padLeft(4, '0')}-${eventEndDate!.month.toString().padLeft(2, '0')}-${eventEndDate!.day.toString().padLeft(2, '0')}",
    "event_duration_description": eventDurationDescription,
    "ticket_sale_start_date": "${ticketSaleStartDate!.year.toString().padLeft(4, '0')}-${ticketSaleStartDate!.month.toString().padLeft(2, '0')}-${ticketSaleStartDate!.day.toString().padLeft(2, '0')}",
    "ticket_sale_end_date": "${ticketSaleEndDate!.year.toString().padLeft(4, '0')}-${ticketSaleEndDate!.month.toString().padLeft(2, '0')}-${ticketSaleEndDate!.day.toString().padLeft(2, '0')}",
    "max_tickets_per_customer": maxTicketsPerCustomer,
    "scan_number": scanNumber,
    "terms_conditions": termsConditions,
    "total_tickets": totalTickets,
    "available_tickets": availableTickets,
    "ticket_price": ticketPrice,
    "description": description,
    "status": status,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "created_by": createdBy,
    "featured_image_url": featuredImageUrl,
    "business": business!.toJson(),
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
  List<String>? images;
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
    images: List<String>.from(json["images"].map((x) => x)),
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
    "images": List<dynamic>.from(images!.map((x) => x)),
    "featured_image_url": featuredImageUrl,
  };
}
