import 'package:dio/dio.dart';

abstract class Failure {
  final String errormessage;
  Failure(this.errormessage);
}

class ServiseFailure extends Failure {
  ServiseFailure(super.errormessage);
  factory ServiseFailure.fromdioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServiseFailure("error connectionTimeout ");
      case DioExceptionType.sendTimeout:
        return ServiseFailure("error sendTimeout");
      case DioExceptionType.receiveTimeout:
        return ServiseFailure("error receiveTimeout");
      case DioExceptionType.badCertificate:
        return ServiseFailure("error badCertificate");
      case DioExceptionType.cancel:
        return ServiseFailure("error cancel");
      case DioExceptionType.connectionError:
        return ServiseFailure("error connectionError");
      case DioExceptionType.unknown:
        return ServiseFailure("error unknown");
      case DioExceptionType.badResponse:
        return ServiseFailure.fromResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
    }
  }

  factory ServiseFailure.fromResponse(int? statusCode, dynamic response) {
    switch (statusCode) {
      case 302:
        return ServiseFailure(response);
      case 400:
        return ServiseFailure(response['message'] ?? 'Bad request');

      case 401:
        return ServiseFailure(response['message'] ?? 'Unauthorized');

      case 403:
        return ServiseFailure(response['message'] ?? 'Forbidden');

      case 404:
        return ServiseFailure(response['message'] ?? 'Not found');

      case 409:
        return ServiseFailure(response['message'] ?? 'Conflict occurred');

      case 422:
        final err = response["errors"] as Map<String, dynamic>;
        for (final entry in err.entries) {
          final val = entry.value;
          if (val is List && val.isNotEmpty) {
            return ServiseFailure(val.first.toString());
          }
        }
        return ServiseFailure('Validation error');
      case 500:
        return ServiseFailure(response['message'] ?? 'Internal server error');
      case 429:
        return ServiseFailure(response['message'] ?? '429...429...429..429');

      default:
        return ServiseFailure('Something went wrong');
    }
  }
}
