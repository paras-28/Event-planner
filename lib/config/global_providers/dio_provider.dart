import 'package:event_planner/config/test_config/test_config.dart';
import 'package:event_planner/data/data_utility/api_end_points.dart';
import 'package:event_planner/data/local_storage/repositories/home_repo/home_repo_local_impl.dart';
import 'package:event_planner/data/repositories/home_repo/home_repo_impl.dart';
import 'package:event_planner/domain/repositories/home_repo/home_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http_mock_adapter/http_mock_adapter.dart';


final dioProvider = Provider<dio.Dio>((ref) {
  throw UnimplementedError();
});

final homeRepoProvider = Provider<HomeRepo>((ref) {
  return  HomeRepoImpl(ref.read(dioProvider));
});


final homeRepoLocalProvider = Provider<HomeRepo>((ref) {
  return  HomeRepoLocalImpl();
});

dio.Dio  dioObjectRecogniser(TestConfig? config)
{

  if(config == TestConfig.happyPathWithStatus200)
  {
    /// For testing purpose
    final  dioTestObject = dio.Dio(dio.BaseOptions(
      baseUrl: "https://67484d675801f51535903e81.mockapi.io/paras",
    ));
    final dioTestAdapter = DioAdapter(dio: dioTestObject);

    dioTestAdapter.onGet(
      ApiEndPoints.event,
          (server) => server.reply(
        200,
        [
          {
            "created_at": "created_at 1",
            "title": "title 1",
            "description": "description 1",
            "id": "1"
          },
          {
            "created_at": "2024-11-30T03:25:00.000",
            "title": "title 2",
            "description": "description 2vg\n",
            "id": "2"
          },
          {
            "created_at": "created_at 3",
            "title": "title 3",
            "description": "description 3",
            "id": "3"
          },
        ],
        // Reply would wait for one-sec before returning data.
        delay: const Duration(seconds: 1),
      ),
    );
    return  dioTestObject;
  }
  else if(config == TestConfig.unHappyPathWithStatus500)
  {
    /// For testing purpose
    final  dioTestObject = dio.Dio(dio.BaseOptions(
      baseUrl: "https://67484d675801f51535903e81.mockapi.io/paras",
    ));
    final dioTestAdapter = DioAdapter(dio: dioTestObject);

    dioTestAdapter.onGet(
      ApiEndPoints.event,
          (server) => server.reply(
        400,
        {
          "status" : 400,
          "message" :"Bad request"
        },
        // Reply would wait for one-sec before returning data.
        delay: const Duration(seconds: 1),
      ),

    );

    return  dioTestObject;
  }
  else
  {
    dio.Dio  dioInst = dio.Dio();
    dioInst.options =
        dio.BaseOptions(
            baseUrl: "https://67484d675801f51535903e81.mockapi.io/paras",
            headers: {'content-type':'application/json'}
            // connectTimeout: const Duration(seconds: 10),
            // sendTimeout: const Duration(seconds: 10)
        );

    return dioInst;
  }

}


