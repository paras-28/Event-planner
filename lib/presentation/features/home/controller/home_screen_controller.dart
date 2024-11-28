import 'package:event_planner/config/global_providers/dio_provider.dart';
import 'package:event_planner/domain/entities/models/event_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// final homeControllerProvider = StateNotifierProvider.autoDispose<HomeScreenController, HomeScreenState>((ref) {
//
//   return HomeScreenController(
//     homeRepo: ref.read(homeRepoProvider),
//   );
// });
//
// class HomeScreenController extends StateNotifier<HomeScreenState> {
//
//   final HomeRepo homeRepo;
//   HomeScreenController({required this.homeRepo})
//       : super(HomeScreenState(
//     showLoader: false,
//     hasMessage: "",
//   ));
//
//   getData() async {
//     try {
//       state = state.copyWith(showLoader: true ,hasMessage: '');
//        List<EventModel> list  = await homeRepo.fetchAllEvents();
//        debuggerAdvance(tag: "list length ", value: list.length);
//       state = state.copyWith(
//         showLoader: false,
//         listOFEventModel: list
//       );
//     }
//
//     catch (e) {
//       debuggerAdvance(tag: "At Catch Home screen Controller", value: e.toString());
//       state = state.copyWith(showLoader: false, hasMessage: e.toString());
//     }
//   }
//
// }
//
// class HomeScreenState {
//
//   bool showLoader = false;
//   String hasMessage = "";
//   List<EventModel>? listOFEventModel;
//
// //<editor-fold desc="Data Methods">
//   HomeScreenState({
//     required this.showLoader,
//     required this.hasMessage,
//     this.listOFEventModel,
//   });
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       (other is HomeScreenState &&
//           runtimeType == other.runtimeType &&
//           showLoader == other.showLoader &&
//           hasMessage == other.hasMessage &&
//           listOFEventModel == other.listOFEventModel);
//
//   @override
//   int get hashCode =>
//       showLoader.hashCode ^ hasMessage.hashCode ^ listOFEventModel.hashCode;
//
//   @override
//   String toString() {
//     return 'HomeScreenState{' +
//         ' showLoader: $showLoader,' +
//         ' hasMessage: $hasMessage,' +
//         ' listOFEventModel: $listOFEventModel,' +
//         '}';
//   }
//
//   HomeScreenState copyWith({
//     bool? showLoader,
//     String? hasMessage,
//     List<EventModel>? listOFEventModel,
//   }) {
//     return HomeScreenState(
//       showLoader: showLoader ?? this.showLoader,
//       hasMessage: hasMessage ?? this.hasMessage,
//       listOFEventModel: listOFEventModel ?? this.listOFEventModel,
//     );
//   }
//
//
// }


final homepageProvider = AsyncNotifierProvider<MyHomeNotifier, List<EventModel>>(MyHomeNotifier.new);

class MyHomeNotifier extends AsyncNotifier<List<EventModel>> {

  @override
  Future<List<EventModel>> build() async{
    return await ref.read(homeRepoProvider).fetchAllEvents();
  }

  Future<void> addProduct(EventModel productResModel) async {
    // await ref.read(homeRepoProvider).updateParticularProduct(productResModel);
    ref.invalidateSelf();

  }

  Future<void> deleteEvent(EventModel productResModel) async {
    // await ref.read(homeRepoProvider).updateParticularProduct(productResModel);
    ref.invalidateSelf();

  }
}


