import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:xcrow/core/models/confirm_email_response.dart';
import 'package:xcrow/core/repository/email_repository.dart';

class FakeEmailRepository extends Mock implements EmailRepository {}

void main() {
  mainTest();
}

const _otp = '0000';

void mainTest() {
  group('Email Repository test', () {
    final emailRepository = FakeEmailRepository();

    test('Expect email OTp [0000]', () async {
      final container = ProviderContainer();
      when(() =>
          emailRepository.emailOtp(
              phone: '',
              countryCode: '',
              phoneCode: '',
              email: '')).thenAnswer((_) async =>
          ConfirmEmailResponse(otp: _otp, status: true, message: 'success'));
      expect(_otp, _otp);
    });
  });
}
