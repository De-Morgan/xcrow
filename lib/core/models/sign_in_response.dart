import 'package:xcrow/core/models/type_sanitizer.dart';

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

  String get fullName => '$first_name $surname';

  SignInResponse(
      {this.surname,
      this.first_name,
      this.email,
      this.transactionPin,
      this.token,
      this.gender,
      this.phone,
      this.phone_code,
      this.avatar,
      this.id});

  SignInResponse copyWith({String? transactionPin}) {
    return SignInResponse(
        transactionPin: transactionPin ?? this.transactionPin,
        email: email,
        id: id,
        gender: gender,
        phone: phone,
        avatar: avatar,
        first_name: first_name,
        phone_code: phone_code,
        surname: surname,
        token: token);
  }

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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['avatar'] = avatar;
    map['phone'] = phone;
    map['phone_code'] = phone_code;
    map['first_name'] = first_name;
    map['surname'] = surname;
    map['gender'] = gender;
    map['email'] = email;
    map['id'] = id;
    map['transactionPin'] = transactionPin;
    return map;
  }
}

class SignUpRequest {
  final String phone,
      countryCode,
      phoneCode,
      language,
      firstName,
      surName,
      gender,
      email,
      dateofbirth,
      password,
      otp;

  SignUpRequest(
      {required this.password,
      required this.phone,
      required this.countryCode,
      required this.phoneCode,
      required this.language,
      required this.firstName,
      required this.surName,
      required this.gender,
      required this.email,
      required this.dateofbirth,
      required this.otp});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = 0;
    map['avatar'] = 'https://cdn-icons-png.flaticon.com/512/6596/6596121.png';
    //map['lastTransac'] = lastTransac;
    map['walletBalance'] = 0;
    //map['accountType'] = '';
    map['phone'] = phone;
    map['countryCode'] = countryCode;
    map['phoneCode'] = phoneCode;
    map['language'] = language;
    map['firstName'] = firstName;
    map['surName'] = surName;
    map['gender'] = gender;
    map['email'] = email;
    map['dateofbirth'] = dateofbirth;
    map['otp'] = otp;
    map['password'] = password;

    return map;
  }
}
