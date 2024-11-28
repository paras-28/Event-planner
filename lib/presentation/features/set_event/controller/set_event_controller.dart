
import 'package:event_planner/config/global_providers/dio_provider.dart';
import 'package:event_planner/core/utils/debug_logger.dart';
import 'package:event_planner/core/utils/utils.dart';
import 'package:event_planner/domain/entities/models/event_model.dart';
import 'package:event_planner/presentation/features/home/controller/home_screen_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final setEventProvider = AsyncNotifierProvider.autoDispose< SetEventNotifier, EventModel?>(SetEventNotifier.new);

class SetEventNotifier extends AutoDisposeAsyncNotifier<EventModel?> {

  @override
  Future<EventModel?> build() async {
    return null;
  }

  Future<void> addEvent(EventModel reqModel) async {
    try {
      state = const AsyncValue.loading();
      // EventModel productResModel =
      EventModel eventModel =
          await ref.read(homeRepoProvider).addEvent(model: reqModel);
      debuggerAdvance(tag: "add event result", value: eventModel.title);
      state =  AsyncValue.data(eventModel);
      ref.refresh(homepageProvider);

      //
    }  catch (e, s) {
      state =  AsyncValue.error(e, s);
    }

  }
  Future<void> updateEvent(EventModel reqModel) async {
    try {
      state = const AsyncValue.loading();
      // EventModel productResModel =
      EventModel eventModel =
          await ref.read(homeRepoProvider).updateEvent(model: reqModel);

      state =  AsyncValue.data(eventModel);
      ref.invalidate(homepageProvider);
      //
    }  catch (e, s) {
      state =  AsyncValue.error(e, s);
    }

  }

}

