import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
part 'event_local_model.g.dart';

@HiveType(typeId: 0)
class EventLocalModel {
  @HiveField(0)
  String? createdAt;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? id;

  EventLocalModel({this.createdAt, this.title, this.description, this.id});

  EventLocalModel.fromMap(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    title = json['title'];
    description = json['description'];
    id = json['id'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['title'] = title;
    data['description'] = description;
    data['id'] = id;
    return data;
  }

  String toJson() => json.encode(toMap());

  factory EventLocalModel.fromJson(String source) =>
      EventLocalModel.fromMap(json.decode(source) as Map<String, dynamic>);

}