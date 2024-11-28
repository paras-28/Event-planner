import 'package:event_planner/config/test_config/test_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http_mock_adapter/http_mock_adapter.dart';




final dioProvider = Provider<dio.Dio>((ref) {
  throw UnimplementedError();
});


dio.Dio  dioObjectRecogniser(TestConfig? config)
{
  if(config == TestConfig.happyPathWithStatus200)
  {
    /// For testing purpose
    final  dioTestObject = dio.Dio(dio.BaseOptions(
      baseUrl: "https://api.restful-api.dev",
    ));
    final dioTestAdapter = DioAdapter(dio: dioTestObject);

    dioTestAdapter.onGet(
      "/objects",
          (server) => server.reply(
        200,
        [
          {
            "id": "1",
            "name": "Google Pixel 6 Pro",
            "data": {
              "color": "Cloudy White",
              "capacity": "128 GB"
            }
          },
          {
            "id": "2",
            "name": "Apple iPhone 12 Mini, 256GB, Blue",
            "data": null
          },
          {
            "id": "3",
            "name": "Apple iPhone 12 Pro Max",
            "data": {
              "color": "Cloudy White",
              "capacity GB": 512
            }
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
      baseUrl: "https://api.restful-api.dev",
    ));
    final dioTestAdapter = DioAdapter(dio: dioTestObject);

    dioTestAdapter.onGet(
      "/objects",
          (server) => server.reply(
        500,
        {
          "status" : 500,
          "message" :"Internal server error"
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
            baseUrl: "https://api.restful-api.dev",
            // baseUrl: "https://jsonplaceholder.typicode.com",
            connectTimeout: const Duration(seconds: 6),
            sendTimeout: const Duration(seconds: 6)
        );

    return dioInst;
  }
}