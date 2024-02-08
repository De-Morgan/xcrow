import 'type_sanitizer.dart';

class BaseResponse {
  bool? status;
  String? message;

  BaseResponse({
    this.status,
    this.message,
  });

  BaseResponse.fromJson(dynamic json) {
    status = TypeSanitizer.sanitizeToBool(json['status']);
    message = TypeSanitizer.sanitizeToString(json['message']);
  }
}
