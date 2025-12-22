import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage: 'Connection TimeOut with api server',
        );

      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'send TimeOut with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'receive TimeOut with api server');

      case DioExceptionType.badCertificate:
        return ServerFailure(
          errorMessage: 'badCertificate TimeOut with api server',
        );
      case DioExceptionType.badResponse:
        ServerFailure.fromResponse(e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(
          errorMessage: 'Connection with api server was canceled ',
        );
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure(
          errorMessage: 'opps there was an error ,please try again later',
        );
    }
    return ServerFailure(errorMessage: e.message!);
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(errorMessage: 'your response is not found');
    } else if (statusCode == 500) {
      return ServerFailure(
        errorMessage: 'there is problem in server,please try again later',
      );
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessage: response['error']['message']);
    } else {
      return ServerFailure(
        errorMessage: 'there was an error please try again later',
      );
    }
  }
}
