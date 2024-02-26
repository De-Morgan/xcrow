import 'package:flutter/src/foundation/basic_types.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/home_page/pages/transaction_pin_page.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

final _pinProvider = StateProvider<String>((ref) => '');

class CreateTransactionPage extends TransactionPinPage {
  CreateTransactionPage({super.key});

  @override
  ValueChanged<String>? get onContinue => (value) {
        ref.read(_pinProvider.notifier).state = value;
        ref.context.pushReplacement(VerifyTransactionPage());
      };
}

class VerifyTransactionPage extends TransactionPinPage {
  VerifyTransactionPage(
      {super.key,
      super.title = 'Verify Pin',
      super.message = 'Verify your transaction pin'});

  @override
  ValueChanged<String>? get onContinue => (value) {};
}
