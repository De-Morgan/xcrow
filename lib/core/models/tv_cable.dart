import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:xcrow/core/models/type_sanitizer.dart';

enum TvCable { dstv, gotv, startimes, showmax }

extension TvCableX on TvCable {
  String get desc => switch (this) {
        TvCable.dstv => 'Multichoice DSTV',
        TvCable.gotv => 'GOTV',
        TvCable.startimes => 'Startimes',
        TvCable.showmax => 'Showmax',
      };
}

class TvPackage {
  final String? serviceID;
  final String? serviceName;
  final List<TvVariation> varations;

  TvPackage({this.serviceID, this.serviceName, this.varations = const []});

  factory TvPackage.fromString(String jsonString) =>
      TvPackage.fromJson(jsonDecode(jsonString));

  factory TvPackage.fromJson(dynamic json) => TvPackage(
      serviceID: TypeSanitizer.sanitizeToString(json['content']?['serviceID']),
      serviceName:
          TypeSanitizer.sanitizeToString(json['content']?['ServiceName']),
      varations: (json['content']?['varations'] as List?)
              ?.map((e) => TvVariation.fromJson(e))
              .toList() ??
          []);
}

class TvVariation extends Equatable{
  String? variation_code;
  String? name;
  String? fixedPrice;
  num? variation_amount;

  TvVariation.fromJson(dynamic json) {
    variation_code = TypeSanitizer.sanitizeToString(json['variation_code']);
    name = TypeSanitizer.sanitizeToString(json['name']);
    fixedPrice = TypeSanitizer.sanitizeToString(json['fixedPrice']);
    variation_amount = TypeSanitizer.sanitizeToNum(json['variation_amount']);
  }

  @override
  List<Object?> get props => [variation_amount,variation_code,name,fixedPrice];
}

class TvVerification {
  final String? customer_Name;
  final String? status,error,
      code,
      due_Date,
      customer_Type,
      current_Bouquet,
      current_Bouquet_Code;
  final int? customer_Number, renewal_Amount;

  TvVerification(
      {this.customer_Name,
      this.status,
      this.code,
      this.due_Date,
      this.current_Bouquet,
      this.current_Bouquet_Code,
      this.customer_Number,
        this.error,
      this.customer_Type,
      this.renewal_Amount});

  factory TvVerification.fromString(String jsonString)=>TvVerification.fromJson(
      jsonDecode(jsonString)
  );
  factory TvVerification.fromJson(dynamic json) => TvVerification(
        code: TypeSanitizer.sanitizeToString(json['code']),

    error:
    TypeSanitizer.sanitizeToString(json['content']?['error']),

    customer_Name:
            TypeSanitizer.sanitizeToString(json['content']?['customer_Name']),
        status: TypeSanitizer.sanitizeToString(json['content']?['Status']),
        current_Bouquet:
            TypeSanitizer.sanitizeToString(json['content']?['Current_Bouquet']),
    due_Date:
    TypeSanitizer.sanitizeToString(json['content']?['Due_Date']),
    customer_Type:
    TypeSanitizer.sanitizeToString(json['content']?['Customer_Type']),
    current_Bouquet_Code:
    TypeSanitizer.sanitizeToString(json['content']?['Current_Bouquet_Code']),
    renewal_Amount:
    TypeSanitizer.sanitizeToInt(json['content']?['Renewal_Amount']),
  );
}
