// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
    json['id'] as int,
    json['username'] as String,
    json['realname'] as String,
    json['phone'] as String,
    json['locked'] as int);

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'realname': instance.realname,
      'phone': instance.phone,
      'locked': instance.locked,
    };
