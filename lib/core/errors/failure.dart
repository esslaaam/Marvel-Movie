import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with Api Server");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with Api Server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout with Api Server");
      case DioExceptionType.badCertificate:
        return ServerFailure("Bad certificate with Api Server");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            error.response!.statusCode, error.response!);
      case DioExceptionType.cancel:
        return ServerFailure("Request to Api Server was canceled");
      case DioExceptionType.connectionError:
        return ServerFailure("No Internet Connection, Please Connect to Internet !");
      case DioExceptionType.unknown:
        if (error.type.name.contains("SocketException")) {
          return ServerFailure("No Internet Connection, Please Connect to Internet !");
        }
        return ServerFailure("Opps There was an Error, Please try again");
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure("Your request was not found, Please try later");
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 402) {
      return ServerFailure("Your request was not found , Please try later");
    } else if (statusCode == 500) {
      return ServerFailure(response['error']['message']);
    }
    return ServerFailure("There was an Error, Please try again");
  }
}
