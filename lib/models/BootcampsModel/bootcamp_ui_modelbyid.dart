import 'package:meta/meta.dart';
import 'dart:convert';

BootcampsByid bootcampsByidFromJson(String str) => BootcampsByid.fromJson(json.decode(str));

String bootcampsByidToJson(BootcampsByid data) => json.encode(data.toJson());

class BootcampsByid {
  final String id;
  final String name;
  final String description;
  final String website;
  final String imageUrl;
  final String location;
  final DateTime startDate;
  final DateTime endDate;
  final String duration;
  final String organizer;
  final String category;
  final List<String> tags;
  final String contactEmail;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;



  BootcampsByid({
    required this.id,
    required this.name,
    required this.description,
    required this.website,
    required this.imageUrl,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.duration,
    required this.organizer,
    required this.category,
    required this.tags,
    required this.contactEmail,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory BootcampsByid.fromJson(Map<String, dynamic> json) => BootcampsByid(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    website: json["website"],
    imageUrl: json["imageUrl"],
    location: json["location"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    duration: json["duration"],
    organizer: json["organizer"],
    category: json["category"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    contactEmail: json["contactEmail"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "website": website,
    "imageUrl": imageUrl,
    "location": location,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "duration": duration,
    "organizer": organizer,
    "category": category,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "contactEmail": contactEmail,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
