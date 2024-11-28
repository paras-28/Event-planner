import 'package:event_planner/config/global_providers/dio_provider.dart';
import 'package:event_planner/domain/entities/models/event_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final homepageProvider = AsyncNotifierProvider<MyHomeNotifier, List<EventModel>>(MyHomeNotifier.new);

class MyHomeNotifier extends AsyncNotifier<List<EventModel>> {

  @override
  Future<List<EventModel>> build() async{
    return await ref.read(homeRepoProvider).fetchAllEvents();
  }


  Future<void> deleteEvent(String eventID) async {
    EventModel eventModel =
    await ref.read(homeRepoProvider).deleteEvent(eventID: eventID);
    // await ref.read(homeRepoProvider).updateParticularProduct(productResModel);
    ref.invalidateSelf();

  }
}


