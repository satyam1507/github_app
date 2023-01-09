// To parse this JSON data, do
//
//     final repos = reposFromJson(jsonString);

import 'dart:convert';
 
  
List<Repos?>? reposFromJson(String str) => json.decode(str) == null ? [] : List<Repos?>.from(json.decode(str)!.map((x) => Repos.fromJson(x)));

class Repos {
  Repos({
    this.id,
    this.name,
    this.fullName,
    this.private,
    this.htmlUrl,
    this.description,
  });

  int? id;
  String? name;
  String? fullName;
  bool? private;
  String? htmlUrl;
  String? description;

  factory Repos.fromJson(Map<String, dynamic> json) => Repos(
        id: json["id"],
        name: json["name"],
        fullName: json["full_name"],
        private: json["private"],
        htmlUrl: json["html_url"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "full_name": fullName,
        "private": private,
        "html_url": htmlUrl,
        "description": description,
      };
}
