import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';


@freezed
class EventModel with _$EventModel{
  const  factory EventModel({
     @JsonKey(name: 'created_at') required num? createdAt,
    required  String? title,
    required String? description,
    required String? id})= _EventModel;

  factory EventModel.fromJson(Map<String, dynamic> json) => _$EventModelFromJson(json);
}