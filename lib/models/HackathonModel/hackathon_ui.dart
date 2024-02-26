
import 'dart:convert';

List<Hacakthon> hacakthonFromJson(String str) => List<Hacakthon>.from(json.decode(str).map((x) => Hacakthon.fromJson(x)));

String hacakthonToJson(List<Hacakthon> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hacakthon {
  final String id;
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String location;
  final String organizer;
  final String imglink;
  final String theme;
  final String website;
  final String registrationLink;
  final List<String> tags;
  final List<String> sponsors;
  final String prizes;
  final String contactEmail;
  final int teamSize;
  final String eligibility;
  final String rules;
  final String judgingCriteria;
  final String schedule;
  final String additionalInfo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Hacakthon({
    required this.id,
    required this.name,
    required this.imglink,
    required this.theme,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.organizer,
    required this.website,
    required this.registrationLink,
    required this.tags,
    required this.sponsors,
    required this.prizes,
    required this.contactEmail,
    required this.teamSize,
    required this.eligibility,
    required this.rules,
    required this.judgingCriteria,
    required this.schedule,
    required this.additionalInfo,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Hacakthon.fromJson(Map<String, dynamic> json) => Hacakthon(
    id: json["_id"],
    name: json["name"],
    theme: json["theme"],
    imglink: json["imglink"],
    description: json["description"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    location: json["location"],
    organizer: json["organizer"],
    website: json["website"],
    registrationLink: json["registrationLink"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    sponsors: List<String>.from(json["sponsors"].map((x) => x)),
    prizes: json["prizes"],
    contactEmail: json["contactEmail"],
    teamSize: json["teamSize"],
    eligibility: json["eligibility"],
    rules: json["rules"],
    judgingCriteria: json["judgingCriteria"],
    schedule: json["schedule"],
    additionalInfo: json["additionalInfo"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "imglink":imglink,
    "theme":theme,
    "description": description,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "location": location,
    "organizer": organizer,
    "website": website,
    "registrationLink": registrationLink,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "sponsors": List<dynamic>.from(sponsors.map((x) => x)),
    "prizes": prizes,
    "contactEmail": contactEmail,
    "teamSize": teamSize,
    "eligibility": eligibility,
    "rules": rules,
    "judgingCriteria": judgingCriteria,
    "schedule": schedule,
    "additionalInfo": additionalInfo,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
