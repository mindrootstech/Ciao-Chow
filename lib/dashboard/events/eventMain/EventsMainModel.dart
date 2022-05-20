// To parse this JSON data, do
//
//     final eventsMainModel = eventsMainModelFromJson(jsonString);

import 'dart:convert';

EventsMainModel eventsMainModelFromJson(String str) =>
    EventsMainModel.fromJson(json.decode(str));

String eventsMainModelToJson(EventsMainModel data) =>
    json.encode(data.toJson());

class EventsMainModel {
  EventsMainModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory EventsMainModel.fromJson(Map<String, dynamic> json) =>
      EventsMainModel(
        status: json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.banners,
    this.myEventsTickets,
    this.upcomingEvents,
  });

  List<Banner>? banners;
  List<MyEventsTicket>? myEventsTickets;
  List<Event>? upcomingEvents;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        banners:
            List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
        myEventsTickets: List<MyEventsTicket>.from(
            json["my_events_tickets"].map((x) => MyEventsTicket.fromJson(x))),
        upcomingEvents: List<Event>.from(
            json["upcoming_events"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banners": List<dynamic>.from(banners!.map((x) => x.toJson())),
        "my_events_tickets":
            List<dynamic>.from(myEventsTickets!.map((x) => x.toJson())),
        "upcoming_events":
            List<dynamic>.from(upcomingEvents!.map((x) => x.toJson())),
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

class MyEventsTicket {
  MyEventsTicket({
    this.id,
    this.eventId,
    this.customerId,
    this.numberTickets,
    this.ticketPrice,
    this.totalAmount,
    this.platformFee,
    this.payoutAmount,
    this.transactionId,
    this.redeemedTickets,
    this.createdAt,
    this.updatedAt,
    this.isRedeemed,
    this.redeemDate,
    this.saleId,
    this.event,
  });

  int? id;
  int? eventId;
  int? customerId;
  int? numberTickets;
  String? ticketPrice;
  String? totalAmount;
  String? platformFee;
  String? payoutAmount;
  String? transactionId;
  String? redeemedTickets;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? isRedeemed;
  dynamic? redeemDate;
  int? saleId;
  Event? event;

  factory MyEventsTicket.fromJson(Map<String, dynamic> json) => MyEventsTicket(
        id: json["id"],
        eventId: json["event_id"],
        customerId: json["customer_id"],
        numberTickets: json["number_tickets"],
        ticketPrice: json["ticket_price"],
        totalAmount: json["total_amount"],
        platformFee: json["platform_fee"],
        payoutAmount: json["payout_amount"],
        transactionId: json["transaction_id"],
        redeemedTickets: json["redeemed_tickets"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isRedeemed: json["is_redeemed"],
        redeemDate: json["redeem_date"],
        saleId: json["sale_id"],
        event: Event.fromJson(json["event"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "event_id": eventId,
        "customer_id": customerId,
        "number_tickets": numberTickets,
        "ticket_price": ticketPrice,
        "total_amount": totalAmount,
        "platform_fee": platformFee,
        "payout_amount": payoutAmount,
        "transaction_id": transactionId,
        "redeemed_tickets": redeemedTickets,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "is_redeemed": isRedeemed,
        "redeem_date": redeemDate,
        "sale_id": saleId,
        "event": event!.toJson(),
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
    this.featuredImage,
    this.featuredImageUrl,
    this.business,
    this.distance,
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
  int? availableTickets;
  String? ticketPrice;
  String? description;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? createdBy;
  String? featuredImage;
  String? featuredImageUrl;
  Business? business;
  String? distance;

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
        featuredImage: json["featured_image"],
        featuredImageUrl: json["featured_image_url"],
        business: Business.fromJson(json["business"]),
        distance: json["distance"] == null ? null : json["distance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "event_name": eventName,
        "event_identifier": eventIdentifier,
        "event_start_date":
            "${eventStartDate!.year.toString().padLeft(4, '0')}-${eventStartDate!.month.toString().padLeft(2, '0')}-${eventStartDate!.day.toString().padLeft(2, '0')}",
        "event_end_date":
            "${eventEndDate!.year.toString().padLeft(4, '0')}-${eventEndDate!.month.toString().padLeft(2, '0')}-${eventEndDate!.day.toString().padLeft(2, '0')}",
        "event_duration_description": eventDurationDescription,
        "ticket_sale_start_date":
            "${ticketSaleStartDate!.year.toString().padLeft(4, '0')}-${ticketSaleStartDate!.month.toString().padLeft(2, '0')}-${ticketSaleStartDate!.day.toString().padLeft(2, '0')}",
        "ticket_sale_end_date":
            "${ticketSaleEndDate!.year.toString().padLeft(4, '0')}-${ticketSaleEndDate!.month.toString().padLeft(2, '0')}-${ticketSaleEndDate!.day.toString().padLeft(2, '0')}",
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
        "featured_image": featuredImage,
        "featured_image_url": featuredImageUrl,
        "business": business!.toJson(),
        "distance": distance == null ? null : distance,
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
