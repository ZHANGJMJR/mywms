import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'realname')
  String realname;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'locked')
  int locked;


  Person(
    this.id,
    this.username,
    this.realname,
    this.phone,
    this.locked,
  );

  factory Person.fromJson(Map<String, dynamic> srcJson) =>
      _$PersonFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
