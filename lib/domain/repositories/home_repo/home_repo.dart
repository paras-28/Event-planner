import 'package:event_planner/domain/entities/models/event_model.dart';

abstract class HomeRepo
{
  Future<List<EventModel>> fetchAllEvents();
  Future<EventModel> addEvent({required  EventModel model});
  Future<EventModel> updateEvent({required  EventModel model});
  Future<EventModel> deleteEvent({required  String modelId});
}