import 'type_sanitizer.dart';

class SignInResponse {
  int? id;
  String? avatar,
      account_type,
      phone,
      country_code,
      phone_code,
      language,
      first_name,
      surname,
      gender,
      email,
      dateofbirth,
      lastTransac,
      accountNo,
      walletBalance,
      token,
      transactionPin;

  SignInResponse.fromJson(dynamic json) {
    id = TypeSanitizer.sanitizeToInt(json['id']);
    avatar = TypeSanitizer.sanitizeToString(json['avatar']);
    account_type = TypeSanitizer.sanitizeToString(json['account_type']);
    phone = TypeSanitizer.sanitizeToString(json['phone']);
    country_code = TypeSanitizer.sanitizeToString(json['country_code']);
    phone_code = TypeSanitizer.sanitizeToString(json['phone_code']);
    language = TypeSanitizer.sanitizeToString(json['language']);
    first_name = TypeSanitizer.sanitizeToString(json['first_name']);
    surname = TypeSanitizer.sanitizeToString(json['surname']);
    gender = TypeSanitizer.sanitizeToString(json['gender']);
    email = TypeSanitizer.sanitizeToString(json['email']);
    dateofbirth = TypeSanitizer.sanitizeToString(json['dateofbirth']);
    lastTransac = TypeSanitizer.sanitizeToString(json[lastTransac]);
    accountNo = TypeSanitizer.sanitizeToString(json['accountNo']);
    walletBalance = TypeSanitizer.sanitizeToString(json['walletBalance']);
    token = TypeSanitizer.sanitizeToString(json['token']);
    transactionPin = TypeSanitizer.sanitizeToString(json['transactionPin']);
  }
}

class SignUpRequest {
  final int id;
  final String avatar,
      accountType,
      phone,
      countryCode,
      phoneCode,
      language,
      firstName,
      surName,
      gender,
      email,
      dateofbirth,
      lastTransac,
      walletBalance,
      otp;

  SignUpRequest(
      {required this.id,
      required this.avatar,
      required this.accountType,
      required this.phone,
      required this.countryCode,
      required this.phoneCode,
      required this.language,
      required this.firstName,
      required this.surName,
      required this.gender,
      required this.email,
      required this.dateofbirth,
      required this.lastTransac,
      required this.walletBalance,
      required this.otp});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['avatar'] = '';
    map['accountType'] = accountType;
    map['phone'] = phone;
    map['countryCode'] = countryCode;
    map['phoneCode'] = phoneCode;
    map['language'] = language;
    map['firstName'] = firstName;
    map['surName'] = surName;
    map['gender'] = gender;
    map['email'] = email;
    map['dateofbirth'] = dateofbirth;
    map['lastTransac'] = lastTransac;
    map['walletBalance'] = walletBalance;
    map['otp'] = otp;
    return map;
  }
}
