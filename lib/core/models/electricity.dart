import 'dart:convert';

import 'package:xcrow/core/models/type_sanitizer.dart';
import 'package:xcrow/ui/utils/string_extension.dart';

class Electricity {
  int? id;
  String? name;
  String? code;
  String? serviceId;
  String? description;

  Electricity(
      {this.name, this.code, this.serviceId, this.id, this.description});

  factory Electricity.fromJson(Map<String, dynamic> json) {
    return Electricity(
      id: TypeSanitizer.sanitizeToInt(json['id']),
      name: TypeSanitizer.sanitizeToString(json['name']),
      code: TypeSanitizer.sanitizeToString(json['code']),
      serviceId: TypeSanitizer.sanitizeToString(json['service_id']),
      description: TypeSanitizer.sanitizeToString(json['description']),
    );
  }
}

class ElectricityValidation {
  String? name;
  String? address;
  String? meterNumber;
  num? minimumAmount;
  String? phone;

  ElectricityValidation(
      {this.address,
      this.meterNumber,
      this.minimumAmount,
      this.name,
      this.phone});
  factory ElectricityValidation.fromString(String? jsonString) =>
      ElectricityValidation.fromJson(jsonDecode(jsonString.nullToEmpty));
  factory ElectricityValidation.fromJson(Map<String, dynamic> json) {
    return ElectricityValidation(
        name: TypeSanitizer.sanitizeToString(json['content']?['Customer_Name']),
        address: TypeSanitizer.sanitizeToString(json['content']?['Address']),
        meterNumber:
            TypeSanitizer.sanitizeToString(json['content']?['MeterNumber']),
        minimumAmount: TypeSanitizer.sanitizeToNum(
            json['content']?['Min_Purchase_Amount']),
        phone:
            TypeSanitizer.sanitizeToString(json['content']?['Customer_Phone']));
  }
}

enum MeterType { prepaid, postpaid }
