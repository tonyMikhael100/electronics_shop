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
        return _handleBadResponse(dioException);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "Request to server was cancelled.");
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: "Connection error with server.");
      case DioExceptionType.unknown:
        return _handleUnknown(dioException);
    }
  }

  static ServerFailure _handleBadResponse(DioException dioException) {
    final statusCode = dioException.response?.statusCode;
    final message =
        dioException.response?.statusMessage ?? "Bad response from server.";
    return ServerFailure(errorMessage: "Bad response: $statusCode $message");
  }

  static ServerFailure _handleUnknown(DioException dioException) {
    final response = dioException.response;
    if (response != null) {
      final statusCode = response.statusCode;
      final message = response.statusMessage ?? "Bad response from server.";
      switch (statusCode) {
        case 400:
          return ServerFailure(errorMessage: "Bad request: $message");
        case 401:
          return ServerFailure(errorMessage: "Unauthorized: $message");
        case 403:
          return ServerFailure(errorMessage: "Forbidden: $message");
        case 404:
          return ServerFailure(errorMessage: "Not found: $message");
        case 408:
          return ServerFailure(errorMessage: "Request timeout: $message");
        case 500:
          return ServerFailure(errorMessage: "Internal server error: $message");
        case 502:
          return ServerFailure(errorMessage: "Bad gateway: $message");
        case 503:
          return ServerFailure(errorMessage: "Service unavailable: $message");
        case 504:
          return ServerFailure(errorMessage: "Gateway timeout: $message");
        default:
          return ServerFailure(
              errorMessage:
                  "Received invalid status code: $statusCode $message");
      }
    }
    return ServerFailure(
        errorMessage: "Unexpected error occurred: ${dioException.message}");
  }
}
