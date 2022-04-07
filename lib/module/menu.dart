import 'dart:convert';

List<Menu> menuFromJson(String str) => List<Menu>.from(json.decode(str).map((x) => Menu.fromJson(x)));

String menuToJson(List<Menu> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Menu {
  Menu({
    this.title,
    this.svgSrc,
    this.page,
    this.args,
  });

  String? title;
  String? svgSrc;
  String? page;
  String? args;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    title: json["title"],
    svgSrc: json["svgSrc"],
    page: json["page"],
    args: json["args"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "svgSrc": svgSrc,
    "page": page,
    "args": args,
  };
}
