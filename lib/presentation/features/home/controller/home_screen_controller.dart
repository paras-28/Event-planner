import 'package:event_planner/config/global_providers/dio_provider.dart';
import 'package:event_planner/core/utils/app_strings.dart';
import 'package:event_planner/core/utils/check_internet.dart';
import 'package:event_planner/data/data_utility/local_storage_util.dart';
import 'package:event_planner/domain/entities/local_models/event/event_local_model.dart';
import 'package:event_planner/domain/entities/models/event/event_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final homepageProvider = AsyncNotifierProvider<MyHomeNotifier, List<EventModel>>(MyHomeNotifier.new);

class MyHomeNotifier extends AsyncNotifier<List<EventModel>> {

  @override
  Future<List<EventModel>> build() async{

    if(await checkInternet())
      {
        List<EventModel> list =  await ref.read(homeRepoProvider).fetchAllEvents();

        ///Save locally
        LocalStorageUtil.savePostsLocally(events: list.map((e)=> EventLocalModel(
            title: e.title,
            id: e.id,
            createdAt: e.createdAt,
            description: e.description
        )).toList());
        return list ;
      }
    else
      {
       return  await ref.read(homeRepoLocalProvider).fetchAllEvents();
      }


  }

  //
  // Future<void> deleteEvent(String eventID) async {
  //   EventModel eventModel =
  //   await ref.read(homeRepoProvider).deleteEvent(eventID: eventID);
  //   // await ref.read(homeRepoProvider).updateParticularProduct(productResModel);
  //   ref.invalidateSelf();
  //
  // }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


final deleteEventProvider = AsyncNotifierProvider.autoDispose< DeleteEventNotifier, String?>(DeleteEventNotifier.new);

class DeleteEventNotifier extends AutoDisposeAsyncNotifier<String?> {

  @override
  Future<String?> build() async {
    return null;
  }

  Future<void> deleteEvent(String eventID) async {
    try {
      state = const AsyncValue.loading();
      EventModel eventModel =
      await ref.read(homeRepoProvider).deleteEvent(eventID: eventID);
      ref.invalidate(homepageProvider);
      state =  const AsyncValue.data(AppStrings.deleteSuccessfully);
      //
    }  catch (e, s) {
      state =  AsyncValue.error(e, s);
    }

  }

}

