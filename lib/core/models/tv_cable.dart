import 'dart:convert';

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
  factory TvPackage.fromString(String jsonString)=>TvPackage.fromJson(
    jsonDecode(jsonString)
  );
  factory TvPackage.fromJson(dynamic json) => TvPackage(
      serviceID: TypeSanitizer.sanitizeToString(json['content']?['serviceID']),
      serviceName:
          TypeSanitizer.sanitizeToString(json['content']?['ServiceName']),
      varations: (json['content']?['varations'] as List?)
              ?.map((e) => TvVariation.fromJson(e))
              .toList() ??
          []);
}

class TvVariation {
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
}
