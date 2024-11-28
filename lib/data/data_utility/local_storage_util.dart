import 'package:event_planner/core/utils/app_strings.dart';
import 'package:event_planner/domain/entities/local_models/event/event_local_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageUtil {

 static  Future<void> savePostsLocally({
    required List<EventLocalModel> events,
  }) async {

    Box<EventLocalModel?> box = await Hive.openBox<EventLocalModel?>(AppDatabaseStrings.events);
    for (final event in events) {
     box.put(event.id, event);
    }
  }


 static Future<List<EventLocalModel?>> fetchAllLocalPosts() async {
    try {
      Box<EventLocalModel?> box = await Hive.openBox<EventLocalModel?>(AppDatabaseStrings.events);
      final localEvents = box.values.toList();
      return localEvents;
    }  catch (e) {
      rethrow;
    }
  }


}