import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/api_services/email_service.dart';
import 'package:xcrow/core/models/confirm_email_response.dart';

class EmailRepository {
  final Ref ref;

  EmailService get emailService => ref.read(emailServiceProvider);

  EmailRepository({required this.ref});

  Future<ConfirmEmailResponse> emailOtp(
          {required String phone,
          required String countryCode,
          required String phoneCode,
          required email}) =>
      emailService.emailOtp(
          email: email,
          phone: phone,
          countryCode: countryCode,
          phoneCode: phoneCode);
}

final emailRepositoryProvider = Provider<EmailRepository>((ref) {
  return EmailRepository(ref: ref);
});
