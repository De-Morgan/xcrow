import 'package:xcrow/core/models/type_sanitizer.dart';

class AccountInfo {
  final String accountno;
  final String username;
  final String identity;
  final String nextofkin;
  final String address;

  AccountInfo(
      {this.accountno = '',
      this.username = '',
      this.identity = '',
      this.nextofkin = '',
      this.address = ''});

  factory AccountInfo.fromJson(Map<String, dynamic> json) {
    return AccountInfo(
        accountno: TypeSanitizer.sanitizeToString(json['accountno']) ?? "",
        identity: TypeSanitizer.sanitizeToString(json['identity']) ?? '',
        nextofkin: TypeSanitizer.sanitizeToString(json['nextofkin']) ?? '',
        username: TypeSanitizer.sanitizeToString(json['username']) ?? "",
        address: TypeSanitizer.sanitizeToString(json['address']) ?? '');
  }
}
