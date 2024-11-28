
import 'package:dio/dio.dart';


/*class ConnectionException extends DioError {
  final Response response;
  ConnectionException({required super.requestOptions, required this.response});
}*/

class UnauthorisedException extends DioException {
  UnauthorisedException({required super.requestOptions});
}

class CustomException extends DioException {
  CustomException({required super.requestOptions});
}

class ConnectionException extends DioException {
  ConnectionException({required super.requestOptions});
}
class InternalServerException extends DioException {
  InternalServerException({required super.requestOptions});
}
class UnAuthorizedException extends DioException {
  UnAuthorizedException({required super.requestOptions});
}
class BadRequestException extends DioException {
  BadRequestException({required super.requestOptions});
}


