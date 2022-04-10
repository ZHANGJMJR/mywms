// To parse this JSON data, do
//
//     final Category = CategoryFromJson(jsonString);

import 'dart:convert';

List<Category> CategoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String CategoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category extends Object{  //  物品类别
  Category(
    this.id,
    this.categoryname,
    this.categorypic,
    this.status,
  );

  int id;
  String categoryname;
  String categorypic;
  int status;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
     json["id"] as int,
     json["categoryname"] as String,
     json["categorypic"] as String,
     json["status"] as int
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categoryname": categoryname,
    "categorypic": categorypic,
    "status": status,
  };
}
