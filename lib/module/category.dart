// To parse this JSON data, do
//
//     final Category = CategoryFromJson(jsonString);

import 'dart:convert';

List<Category> CategoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String CategoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category extends Object{  //  物品类别
  Category(
    this.id,
    this.title,
    this.desc,
    this.icon,
    this.status,
  );

  int id;
  String title;
  String desc;
  String icon;
  int status;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
     json["id"] as int,
     json["title"] as String,
     json["desc"] as String,
     json["icon"] as String,
     json["status"] as int
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "desc": desc,
    "icon": icon,
    "status": status,
  };
}
