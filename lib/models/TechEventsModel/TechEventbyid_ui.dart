// To parse this JSON data, do
//
//     final TechEventsByid = TechEventsByidFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TechEventsByid techEventsByidFromJson(String str) => TechEventsByid.fromJson(json.decode(str));

String techEventsByidToJson(TechEventsByid data) => json.encode(data.toJson());

class TechEventsByid {
  final String id;
  final String name;
  final String link;
  final String imglink;
  final String description;
  final DateTime date;
  final String location;
  final String organizer;
  final int v;

  TechEventsByid({
    required this.id,
    required this.name,
    required this.link,
    required this.imglink,
    required this.description,
    required this.date,
    required this.location,
    required this.organizer,
    required this.v,
  });

  factory TechEventsByid.fromJson(Map<String, dynamic> json) => TechEventsByid(
    id: json["_id"],
    name: json["name"],
    link: json["link"],
    imglink: json["imglink"],
    description: json["description"],
    date: DateTime.parse(json["date"]),
    location: json["location"],
    organizer: json["organizer"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "link": link,
    "imglink": imglink,
    "description": description,
    "date": date.toIso8601String(),
    "location": location,
    "organizer": organizer,
    "__v": v,
  };
}
