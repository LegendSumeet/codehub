// To parse this JSON data, do
//
//     final bootcampModel = bootcampModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<BootcampModel> bootcampModelFromJson(String str) => List<BootcampModel>.from(json.decode(str).map((x) => BootcampModel.fromJson(x)));

String bootcampModelToJson(List<BootcampModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BootcampModel {
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
  final int teamsize;
  final List<String> tags;
  final String contactEmail;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  BootcampModel({
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
    required this.teamsize,
    required this.tags,
    required this.contactEmail,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory BootcampModel.fromJson(Map<String, dynamic> json) => BootcampModel(
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
    teamsize: json["teamsize"],
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
    "teamsize": teamsize,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "contactEmail": contactEmail,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
