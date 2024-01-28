part of network;

class ApiError implements Exception {
  final String errorDescription;
  final dynamic data;
  final DioExceptionType? dioErrorType;
  final int? statusCode;
  static const unknownError = 'Something went wrong, please try again';
  static const internetError = 'Internet connection error, please try again';
  static const cancelError = 'API request canceled, please try again';
  static const permissionDeniedStatusCode = 403;
  static const notFoundStatusCode = 404;

  static const internetError2 =
      'Please check your internet connection, seems you are offline';

  ApiError(
      {required this.errorDescription,
      this.statusCode,
      this.data,
      this.dioErrorType});

  factory ApiError.fromDioException(DioException error) {
    try {
      String description = '';
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          description = internetError;
        case DioExceptionType.badCertificate:
          description = unknownError;
          break;
        case DioExceptionType.badResponse:
          description = extractDescriptionFromResponse(error.response);
          break;
        case DioExceptionType.cancel:
          description = cancelError;
          break;
        case DioExceptionType.connectionError:
        case DioExceptionType.unknown:
          if (error.error is SocketException) {
            description = internetError;
          } else {
            description = unknownError;
          }
          break;
      }
      return ApiError(
        errorDescription: description,
        dioErrorType: error.type,
        data:
            error.response?.data != null ? error.response?.data['data'] : null,
        statusCode: error.response?.statusCode,
      );
    } catch (_) {
      throw unknownError;
    }
  }

  static String extractDescriptionFromResponse(Response? response) {
    try {
      if (response!.statusCode! >= 500) {
        return 'Internal Server error, please try again later';
      }
      if (response.data != null && response.data['message'] != null) {
        return response.data['message'] as String;
      } else {
        return response.statusMessage ?? '';
      }
    } catch (error) {
      throw unknownError;
    }
  }

  @override
  String toString() => errorDescription;
}
