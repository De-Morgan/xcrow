import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/repository/user_repository.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/shared/full_page_loading_widget.dart';
import 'package:xcrow/ui/shared/pin_number_input.dart';
import 'package:xcrow/ui/shared/transaction_pinput.dart';
import 'package:xcrow/ui/theme/font_familty.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

abstract class TransactionPinPage extends HookConsumerWidget {
  TransactionPinPage(
      {super.key,
      this.title = 'Create your Xcrow Pin',
      this.message = 'Enter a secure six-digit transaction code'});

  final String title, message;
  ValueChanged<String>? get onContinue;
  late WidgetRef ref;
  UserRepository get userRepository => ref.read(userRepositoryProvider);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    this.ref = ref;
    final controller = useTextEditingController();
    void listenToText() {
      if (controller.text.length == 6) {
        onContinue?.call(controller.text);
        controller.clear();
      }
    }

    useEffect(() {
      controller.addListener(listenToText);
      return () => controller.removeListener(listenToText);
    }, const []);
    return FullPageLoadingWidget(
      child: WillPopScope(
        onWillPop: () async => false,
        child: ScaffoldPagePaddingWidget(
          child: Scaffold(
            appBar: AppBarWidget(
              title: title,
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 6,
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                          style: context.bodyMedium?.copyWith(
                              fontSize: 18,
                              fontFamily: FontFamily.light,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 32),
                  PinInputWidget(
                    pinController: controller,
                  ),
                  const Spacer(),
                  Flexible(
                    flex: 4,
                    child: PinNumberInputWidget(
                      controller: controller,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
