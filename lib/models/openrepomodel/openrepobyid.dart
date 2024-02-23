import 'dart:convert';

OpenRepobyid openRepobyidFromJson(String str) =>
    OpenRepobyid.fromJson(json.decode(str));

String openRepobyidToJson(OpenRepobyid data) => json.encode(data.toJson());

class OpenRepobyid {
  final String id;
  final String name;
  final String description;
  final String url;
  final String language;
  final int stars;
  final int forks;
  final String owner;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  OpenRepobyid({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.language,
    required this.stars,
    required this.forks,
    required this.owner,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory OpenRepobyid.fromJson(Map<String, dynamic> json) => OpenRepobyid(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        url: json["url"],
        language: json["language"],
        stars: json["stars"],
        forks: json["forks"],
        owner: json["owner"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "url": url,
        "language": language,
        "stars": stars,
        "forks": forks,
        "owner": owner,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}







