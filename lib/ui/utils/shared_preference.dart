import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xcrow/core/models/sign_in_response.dart';

class SharedPreferenceService {
  factory SharedPreferenceService() => _instance;
  static final SharedPreferenceService _instance =
      SharedPreferenceService._internal();

  SharedPreferenceService._internal();

  late SharedPreferences _prefs;
  static const _dbVersion = '0';
  static const _ONBOARDKEY = 'onboard$_dbVersion';
  static const _CUSTOMERKEY = 'customer$_dbVersion';
  static const _accessTokenKEY = 'accessToken$_dbVersion';

  Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
    } catch (_) {}
  }

  String get accessToken => _prefs.getString(_accessTokenKEY) ?? '';

  set accessToken(String? accessToken) {
    if (accessToken == null) return;
    _prefs.setString(_accessTokenKEY, accessToken);
  }

  Future<void> saveOnBoarded({bool boarded = true}) async {
    await _prefs.setBool(_ONBOARDKEY, boarded);
  }

  bool get onBoarded {
    return _prefs.getBool(_ONBOARDKEY) ?? false;
  }

  Future saveCustomer(SignInResponse customer) async {
    final encodedCustomer = jsonEncode(customer.toJson());
    await _prefs.setString(_CUSTOMERKEY, encodedCustomer);
  }

  SignInResponse? get customer {
    try {
      final encodedCustomer = _prefs.getString(_CUSTOMERKEY);
      if (encodedCustomer == null) return null;
      final customer = SignInResponse.fromJson(
          jsonDecode(encodedCustomer) as Map<String, dynamic>);
      return customer;
    } catch (error) {
      return null;
    }
  }

  Future<void> clearData() async {
    final boarded = onBoarded;
    await _prefs.clear();
    saveOnBoarded(boarded: boarded);
  }
}

final sharePreferenceProvider = Provider<SharedPreferenceService>((ref) {
  return SharedPreferenceService();
});
