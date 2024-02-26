import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/home_page/pages/transaction_pin_page.dart';
import 'package:xcrow/ui/shared/full_page_loading_widget.dart';
import 'package:xcrow/ui/shared/success_dialog.dart';
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

  String get oldPin => ref.read(_pinProvider);

  @override
  ValueChanged<String>? get onContinue => (value) async {
        try {
          if (oldPin != value) {
            throw 'confirm pin does not match';
          }
          FullPageLoader.showLoading();
          await userRepository.setTransactionPin(pin: value);
          FullPageLoader.hideLoading();
          await showDialog(
              context: ref.context,
              builder: (context) {
                return const Dialog(
                  child: SuccessDialog(
                    message:
                        'You have successfully created your transaction PIN',
                  ),
                );
              });
          ref.context.popToFirstScreen();
        } catch (error) {
          ref.context.showError(error);
        } finally {
          FullPageLoader.hideLoading();
        }
      };
}
