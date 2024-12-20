import 'package:event_planner/data/data_utility/local_storage_util.dart';
import 'package:event_planner/domain/entities/local_models/event/event_local_model.dart';
import 'package:event_planner/domain/entities/models/event/event_model.dart';
import 'package:event_planner/domain/repositories/home_repo/home_repo.dart';

class HomeRepoLocalImpl extends HomeRepo
{

  @override
  Future<List<EventModel>> fetchAllEvents() async {
    try {
      List<EventLocalModel?> eventModelList =
          await LocalStorageUtil.fetchAllLocalPosts();
      return eventModelList
          .map((e) => EventModel(
                createdAt: e?.createdAt ?? '',
                title: e?.title ?? '',
                description: e?.description ?? '',
              ))
          .toList();
    }  catch (e) {
      rethrow;
    }
    // throw UnimplementedError();
  }

  @override
  Future<EventModel> addEvent({required EventModel model}) {
    // TODO: implement addEvent
    throw UnimplementedError();
  }

  @override
  Future<EventModel> deleteEvent({required String eventID}) {
    // TODO: implement deleteEvent
    throw UnimplementedError();
  }

  @override
  Future<EventModel> updateEvent({required EventModel model}) {
    // TODO: implement updateEvent
    throw UnimplementedError();
  }


}