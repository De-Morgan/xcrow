import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/repository/email_repository.dart';

import 'selected_phone_number.dart';

final sendEmailOtpProvider = FutureProvider.autoDispose<void>((ref) async {
  final phone = ref.watch(selectedPhoneNumberProvider);
  final email = ref.watch(signupEmailProvider).text;
  final emailRepo = ref.watch(emailRepositoryProvider);

  final otpResponse = await emailRepo.emailOtp(
      phoneCode: '${phone?.dialCode}',
      countryCode: '${phone?.isoCode}',
      phone: '${phone?.phoneNumber}',
      email: email);
  ref.read(emailOtpProvider.notifier).state = otpResponse.otp;

  return;
});
