// To parse this JSON data, do
//
//     final conferenceBYid = conferenceBYidFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ConferenceBYid conferenceBYidFromJson(String str) => ConferenceBYid.fromJson(json.decode(str));

String conferenceBYidToJson(ConferenceBYid data) => json.encode(data.toJson());

class ConferenceBYid {
  final String id;
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String location;
  final String organizer;
  final String website;
  final String imglink;
  final String registrationLink;
  final List<String> topics;
  final List<String> speakers;
  final List<String> sponsors;
  final String contactEmail;
  final String createdBy;
  final int maxAttendees;
  final int fee;
  final String schedule;
  final String additionalInfo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  ConferenceBYid({
    required this.id,
    required this.name,
    required this.description,
    required this.imglink,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.organizer,
    required this.website,
    required this.registrationLink,
    required this.topics,
    required this.speakers,
    required this.sponsors,
    required this.contactEmail,
    required this.createdBy,
    required this.maxAttendees,
    required this.fee,
    required this.schedule,
    required this.additionalInfo,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ConferenceBYid.fromJson(Map<String, dynamic> json) => ConferenceBYid(
    id: json["_id"],
    name: json["name"],
    imglink: json["imglink"],
    description: json["description"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    location: json["location"],
    organizer: json["organizer"],
    website: json["website"],
    registrationLink: json["registrationLink"],
    topics: List<String>.from(json["topics"].map((x) => x)),
    speakers: List<String>.from(json["speakers"].map((x) => x)),
    sponsors: List<String>.from(json["sponsors"].map((x) => x)),
    contactEmail: json["contactEmail"],
    createdBy: json["createdBy"],
    maxAttendees: json["maxAttendees"],
    fee: json["fee"],
    schedule: json["schedule"],
    additionalInfo: json["additionalInfo"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "location": location,
    "organizer": organizer,
    "website": website,
    "registrationLink": registrationLink,
    "topics": List<dynamic>.from(topics.map((x) => x)),
    "speakers": List<dynamic>.from(speakers.map((x) => x)),
    "sponsors": List<dynamic>.from(sponsors.map((x) => x)),
    "contactEmail": contactEmail,
    "createdBy": createdBy,
    "maxAttendees": maxAttendees,
    "fee": fee,
    "schedule": schedule,
    "additionalInfo": additionalInfo,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
