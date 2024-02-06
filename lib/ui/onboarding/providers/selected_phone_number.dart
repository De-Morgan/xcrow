import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:xcrow/core/models/language_enum.dart';

final selectedPhoneNumberProvider = StateProvider<PhoneNumber?>((ref) => null);

final selectedLanguageProvider =
    StateProvider<Language>((ref) => Language.English);
