import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:xcrow/core/models/gender.dart';
import 'package:xcrow/core/models/language_enum.dart';
import 'package:xcrow/ui/utils/provider_ref_extension.dart';

final selectedPhoneNumberProvider = StateProvider<PhoneNumber?>((ref) => null);

final selectedLanguageProvider =
    StateProvider<Language>((ref) => Language.English);

final signupEmailProvider =
    Provider.autoDispose<TextEditingController>((ref) => ref.textController);
final firstNameEmailProvider =
    Provider.autoDispose<TextEditingController>((ref) => ref.textController);
final surnameEmailProvider =
    Provider.autoDispose<TextEditingController>((ref) => ref.textController);
final usernameEmailProvider =
    Provider.autoDispose<TextEditingController>((ref) => ref.textController);

final selectedGenderProvider = StateProvider<Gender?>((ref) => null);
final emailOtpProvider = StateProvider<String>((ref) => '');

final selectedDateProvider = StateProvider<DateTime?>((ref) => null);
