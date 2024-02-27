import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/models/network.dart';
import 'package:xcrow/core/repository/airtime_repository.dart';
import 'package:xcrow/core/utils/number_formatter.dart';
import 'package:xcrow/ui/bills/provider/airtime.dart';
import 'package:xcrow/ui/home_page/providers/account_info_provider.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/shared/full_page_loading_widget.dart';
import 'package:xcrow/ui/shared/padded_container.dart';
import 'package:xcrow/ui/shared/success_dialog.dart';
import 'package:xcrow/ui/shared/transaction_pinput.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class AirtimeConfirmationPage extends HookConsumerWidget {
  const AirtimeConfirmationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColor = context.customTheme<AppColors>();
    final airtimeRepo = ref.watch(airtimeRepositoryProvider);
    final pinController = useTextEditingController();
    final phone = ref.watch(phoneNumberProvider).text;
    final amount =
        num.tryParse(ref.watch(airtimeAmountProvider).text.replaceAll(',', ''));

    Future<void> listenText() async {
      if (pinController.text.length == 6) {
        try {
          FullPageLoader.showLoading();
          final serviceID = ref.read(selectedAirtimeProvider)?.title;
          await airtimeRepo.purchaseAirtime(
              phone: phone,
              serviceID: '$serviceID',
              amount: amount ?? 0,
              pin: pinController.text);
          FullPageLoader.hideLoading();
          await SuccessDialog.show(context,
              message: 'Airtime purchase is successful');
          ref.context.popToFirstScreen();
        } catch (error) {
          ref.context.showError(error);
        } finally {
          FullPageLoader.hideLoading();
        }
      }
    }

    useEffect(() {
      pinController.addListener(listenText);
      return () => pinController.removeListener(listenText);
    }, const []);
    return FullPageLoadingWidget(
      child: ScaffoldPagePaddingWidget(
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
                      phone,
                      style: context.bodyMedium?.copyWith(fontSize: 20),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Amount',
                      style: context.titleSmall?.copyWith(fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'N${NumberFormatter.formatMoney(amount)}',
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
                              Consumer(
                                builder: (BuildContext context, WidgetRef ref,
                                    Widget? child) {
                                  final accountInfo =
                                      ref.watch(accountInfoProvider);
                                  return accountInfo.maybeWhen(
                                      orElse: () => const SizedBox(),
                                      data: (value) => Text(
                                            value?.accountno ?? '',
                                            style: context.titleMedium,
                                          ));
                                },
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
                                style:
                                    context.titleSmall?.copyWith(fontSize: 13),
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
                                style:
                                    context.titleSmall?.copyWith(fontSize: 13),
                              ),
                              const Spacer(),
                              Consumer(
                                builder: (BuildContext context, WidgetRef ref,
                                    Widget? child) {
                                  final selectedNetwork =
                                      ref.watch(selectedAirtimeProvider);
                                  return Text(
                                    selectedNetwork?.desc ?? '',
                                    style: context.bodyMedium,
                                  );
                                },
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
      ),
    );
  }
}
