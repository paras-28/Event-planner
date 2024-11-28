import 'package:dio/dio.dart' as dio;
import 'package:event_planner/core/utils/debug_logger.dart';
import 'package:event_planner/core/utils/is_list_exist.dart';
import 'package:event_planner/data/data_utility/data_utility.dart';
import 'package:event_planner/domain/entities/models/event_model.dart';
import 'package:event_planner/domain/repositories/home_repo/home_repo.dart';

import '../../rest_client/dio_base.dart';

class HomeRepoImpl implements HomeRepo
{
  late dio.Dio dioInst;

  HomeRepoImpl(this.dioInst);

  @override
  Future<EventModel> addEvent({required EventModel model}) async {
    try {
      debuggerAdvance(tag: 'Api is calling', value: 'addEvent');
      var response = await DioClient(dioInst)
          .post(url: ApiEndPoints.event, uniqueKey: "addEvent",
          data: model.toJson(),
      );


      debuggerAdvance(tag: "add event ", value:  response.data.toString() );

      // Map<String, dynamic>? res = response.data as Map<String, dynamic>?;

       return  EventModel.fromJson(response.data);
    } on dio.DioException catch (e) {

      throw DioExceptions.fromDioError(
          dioError: e, errorFrom: "addEvent")
          .errorMessage();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<EventModel> deleteEvent({required String modelId}) {
    // TODO: implement deleteEvent
    throw UnimplementedError();
  }

  @override
  Future<List<EventModel>> fetchAllEvents() async {
    // Map<String, String> header = await getHTTPHeader();
    // dio.BaseOptions options = dioInst.options;
    // dioInst.options = options;
    try {
      debuggerAdvance(tag: 'Api is calling', value: '');
      var response = await DioClient(dioInst)
          .get(url: ApiEndPoints.event, uniqueKey: "fetchAllEvents",);
      List? list = response.data as List?;
      if (isListExist(list)) {
        return List<EventModel>.from(
            list!.map((x) => EventModel.fromJson(x)));
      } else {
        throw ExceptionStrings.someThingWentWrong;
      }
    } on dio.DioException catch (e) {

      throw DioExceptions.fromDioError(
          dioError: e, errorFrom: "fetchAllEvents")
          .errorMessage();
      // if you want to customize the error message
      //  int statusCode =  DioExceptions.fromDioError(dioError: e, errorFrom: "getContentForHomeScreen").errorStatusCode();
      //  if(statusCode == 404)
      //  {
      //    throw "Incorrect Email Password";
      //  }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<EventModel> updateEvent({required EventModel model}) {

    throw UnimplementedError();
  }

}