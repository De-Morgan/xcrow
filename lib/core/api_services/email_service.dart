import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/models/confirm_email_response.dart';
import 'package:xcrow/core/network/index.dart';

class EmailService {
  final Ref ref;

  NetworkProvider get network => ref.read(networkProvider);
  static const serviceName = 'email';

  EmailService({required this.ref});

  Future<ConfirmEmailResponse> emailOtp(
      {required String phone,
      required String countryCode,
      required String phoneCode,
      required email}) async {
    try {
      final response = await network.post('$serviceName/confirmation', body: {
        'phone': phone,
        'countryCode': countryCode,
        'phoneCode': phoneCode,
        'email': email
      });
      return ConfirmEmailResponse.fromJson(response.data);
    } on ApiError {
      rethrow;
    }
  }
}

final emailServiceProvider = Provider<EmailService>((ref) {
  return EmailService(ref: ref);
});
