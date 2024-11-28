import 'package:dio/dio.dart';
import 'package:event_planner/core/utils/debug_logger.dart';




class DioClient {
  // final String baseUrl;

  //Info Approach 1
  late Dio _dio;

  // final List<Interceptor> interceptors;

/*  DioClient(
      this.baseUrl,
      Dio dio,) {
    _dio = dio ?? Dio();
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};

  }*/

  DioClient(
      this._dio
      )
  {
    debuggerAdvance(tag: "Dio info", value:' ${_dio.options.baseUrl}' );
  }

  // Get:-----------------------------------------------------------------------
  Future<Response> get({
    required String url,
    required String uniqueKey,
    Map<String, dynamic>? queryParameters,
   Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      // _dio = Dio();
      // _dio.options = BaseOptions(
      //     baseUrl: "https://jsonplaceholder.typicode.com"
      // );
      debuggerAdvance(tag: uniqueKey, value: url, type: DebugType.url);
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options ,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      printAPIRes(
        url: response.realUri,
        response: response.data,
        statusCode: response.statusCode ?? -1,
        tag: uniqueKey,
      );
      return response;
    } on DioException catch (e) {
      rethrow;

    }
  }
    // Post:----------------------------------------------------------------------
    Future<Response> post({
      required String url,
      required String uniqueKey,
      data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
    }) async {
      try {
        debuggerAdvance(tag: uniqueKey, value: url, type: DebugType.url);
        final Response response = await _dio.post(
          url,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        );
        printAPIRes(
          url: response.realUri,
          response: response.data,
          statusCode: response.statusCode ?? -1,
          tag: uniqueKey,
        );
        return response;
      } catch (e) {
        rethrow;
      }
    }

    // Put:-----------------------------------------------------------------------
    Future<Response> put({
      required String url,
      required String uniqueKey,
      data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
    }) async {
      try {
        debuggerAdvance(tag: uniqueKey, value: url, type: DebugType.url);
        final Response response = await _dio.put(
          url,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        );
        printAPIRes(
          url: response.realUri,
          response: response.data,
          statusCode: response.statusCode ?? -1,
          tag: uniqueKey,
        );
        return response;
      } catch (e) {
        rethrow;
      }
    }

    // Delete:--------------------------------------------------------------------
    Future<dynamic> delete({
      required String url,
      required String uniqueKey,
      data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
    }) async {
      try {
        debuggerAdvance(
            tag: uniqueKey,
            value: url,
            type: DebugType.url);
        final Response response = await _dio.delete(
          url,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
        printAPIRes(
          url: response.realUri,
          response: response.data,
          statusCode: response.statusCode ?? -1,
          tag: uniqueKey,
        );
        return response;
      } catch (e) {
        rethrow;
      }
    }
  }

