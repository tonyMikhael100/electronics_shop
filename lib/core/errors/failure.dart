import 'package:dio/dio.dart';

class Failure {
  final String errorMessage;
  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.toDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: "Connection timeout with server.");
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            errorMessage: "Send timeout in connection with server.");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            errorMessage: "Receive timeout in connection with server.");
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: "Bad certificate from server.");
      case DioExceptionType.badResponse:
        final statusCode = dioException.response?.statusCode;
        final message =
            dioException.response?.statusMessage ?? "Bad response from server.";
        return ServerFailure(
            errorMessage: "Bad response: $statusCode $message");
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "Request to server was cancelled.");
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: "Connection error with server.");
      case DioExceptionType.unknown:
      default:
        return ServerFailure(
            errorMessage: "Unexpected error occurred: ${dioException.message}");
    }
  }
}
