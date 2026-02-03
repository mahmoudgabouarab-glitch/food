import 'package:dio/dio.dart';

abstract class Failure {
  final String errormessage;
  final int? statusCode;
  Failure(this.errormessage, {this.statusCode});
}

class ServiseFailure extends Failure {
  ServiseFailure(super.errormessage, {super.statusCode});
  factory ServiseFailure.fromdioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServiseFailure("error connectionTimeout");
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
        return ServiseFailure(
          response['message'] ?? 'Bad request',
          statusCode: statusCode,
        );

      case 401:
        return ServiseFailure(
          'You must be logged in to use this feature',
          statusCode: statusCode,
        );

      case 403:
        return ServiseFailure(
          response['message'] ?? 'Forbidden',
          statusCode: statusCode,
        );

      case 404:
        return ServiseFailure(
          response['message'] ?? 'Not found',
          statusCode: statusCode,
        );

      case 409:
        return ServiseFailure(
          response['message'] ?? 'Conflict occurred',
          statusCode: statusCode,
        );

      case 422:
        final err = response["errors"] as Map<String, dynamic>;
        for (final entry in err.entries) {
          final val = entry.value;
          if (val is List && val.isNotEmpty) {
            return ServiseFailure(val.first.toString(), statusCode: statusCode);
          }
        }
        return ServiseFailure('Validation error', statusCode: statusCode);
      case 500:
        return ServiseFailure(
          response['message'] ?? 'Internal server error',
          statusCode: statusCode,
        );
      case 429:
        return ServiseFailure(
          response['message'] ?? '429...429...429..429',
          statusCode: statusCode,
        );

      default:
        return ServiseFailure('Something went wrong', statusCode: statusCode);
    }
  }
}
