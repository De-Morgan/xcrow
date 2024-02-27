import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/shared/padded_container.dart';
import 'package:xcrow/ui/shared/transaction_pinput.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class AirtimeConfirmationPage extends HookConsumerWidget {
  const AirtimeConfirmationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColor = context.customTheme<AppColors>();
    final pinController = useTextEditingController();

    return ScaffoldPagePaddingWidget(
      child: Scaffold(
        appBar: const AppBarWidget(
          title: 'Confirm',
          centerTitle: true,
        ),
        body: Center(
          child: PaddedContainer(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Text(
                    '+234 9031139 287',
                    style: context.bodyMedium?.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Amount',
                    style: context.titleSmall?.copyWith(fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'N4000.00',
                    style: context.bodyMedium?.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.fromLTRB(24, 24, 16, 24),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: appColor.amountBgColor),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'From',
                              style: context.titleMedium,
                            ),
                            const Spacer(),
                            Text(
                              '2232211674',
                              style: context.titleMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              'Transaction Fee',
                              style: context.titleMedium,
                            ),
                            const Spacer(),
                            Text(
                              'N0.00',
                              style: context.titleMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Description',
                              style: context.titleSmall?.copyWith(fontSize: 13),
                            ),
                            const Spacer(),
                            Text(
                              'Airtime',
                              style: context.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              'Network',
                              style: context.titleSmall?.copyWith(fontSize: 13),
                            ),
                            const Spacer(),
                            Text(
                              'Airtel Mobile',
                              style: context.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Tap to enter your transaction PIN',
                    style: context.titleSmall?.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  TransactionPinInputWidget(
                    pinController: pinController,
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