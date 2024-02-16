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

  Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
    } catch (_) {}
  }

  Future<void> saveOnBoarded() async {
    await _prefs.setBool(_ONBOARDKEY, true);
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
    await _prefs.clear();
  }
}

final sharePreferenceProvider = Provider<SharedPreferenceService>((ref) {
  return SharedPreferenceService();
});
