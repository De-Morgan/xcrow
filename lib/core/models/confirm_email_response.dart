import 'type_sanitizer.dart';

class ConfirmEmailResponse {
  final bool status;
  final String message;
  final String otp;

  ConfirmEmailResponse(
      {required this.status, required this.message, required this.otp});

  factory ConfirmEmailResponse.fromJson(dynamic json) => ConfirmEmailResponse(
        status: TypeSanitizer.sanitizeToBool(json['status']) ?? false,
        message: TypeSanitizer.sanitizeToString(json['message']) ?? '',
        otp: TypeSanitizer.sanitizeToString(json['otp']) ?? '',
      );
}
