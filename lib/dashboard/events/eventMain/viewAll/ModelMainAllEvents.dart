// To parse this JSON data, do
//
//     final modelMainAllEvents = modelMainAllEventsFromJson(jsonString);

import 'dart:convert';

ModelMainAllEvents modelMainAllEventsFromJson(String str) => ModelMainAllEvents.fromJson(json.decode(str));

String modelMainAllEventsToJson(ModelMainAllEvents data) => json.encode(data.toJson());

class ModelMainAllEvents {
  ModelMainAllEvents({
    this.status,
    this.data,
  });

  bool? status;
  Data? data;

  factory ModelMainAllEvents.fromJson(Map<String, dynamic> json) => ModelMainAllEvents(
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
    this.myEventTickets,
  });

  List<MyEventTicket>? myEventTickets;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    myEventTickets: List<MyEventTicket>.from(json["my_event_tickets"].map((x) => MyEventTicket.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "my_event_tickets": List<dynamic>.from(myEventTickets!.map((x) => x.toJson())),
  };
}

class MyEventTicket {
  MyEventTicket({
    this.saleId,
    this.numberTickets,
    this.totalAmount,
    this.eventName,
    this.eventId,
    this.eventStartDate,
    this.eventEndDate,
    this.customerId,
    this.isRedeemed,
    this.image,
  });

  int? saleId;
  int? numberTickets;
  String? totalAmount;
  String? eventName;
  int? eventId;
  DateTime? eventStartDate;
  DateTime? eventEndDate;
  int? customerId;
  int? isRedeemed;
  String? image;

  factory MyEventTicket.fromJson(Map<String, dynamic> json) => MyEventTicket(
    saleId: json["sale_id"],
    numberTickets: json["number_tickets"],
    totalAmount: json["total_amount"],
    eventName: json["event_name"],
    eventId: json["event_id"],
    eventStartDate: DateTime.parse(json["event_start_date"]),
    eventEndDate: DateTime.parse(json["event_end_date"]),
    customerId: json["customer_id"],
    isRedeemed: json["is_redeemed"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "sale_id": saleId,
    "number_tickets": numberTickets,
    "total_amount": totalAmount,
    "event_name": eventName,
    "event_id": eventId,
    "event_start_date": "${eventStartDate!.year.toString().padLeft(4, '0')}-${eventStartDate!.month.toString().padLeft(2, '0')}-${eventStartDate!.day.toString().padLeft(2, '0')}",
    "event_end_date": "${eventEndDate!.year.toString().padLeft(4, '0')}-${eventEndDate!.month.toString().padLeft(2, '0')}-${eventEndDate!.day.toString().padLeft(2, '0')}",
    "customer_id": customerId,
    "is_redeemed": isRedeemed,
    "image": image,
  };
}
