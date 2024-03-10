import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/models/network.dart';
import 'package:xcrow/ui/bills/pages/airtime_confirmation_page.dart';
import 'package:xcrow/ui/bills/provider/airtime.dart';
import 'package:xcrow/ui/bills/widgets/airtime_amount_widget.dart';
import 'package:xcrow/ui/bills/widgets/phone_number_widget.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/shared/app_button.dart';
import 'package:xcrow/ui/shared/app_input_field.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/shared/drop_down_widget.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

import '../widgets/amount_widget.dart';

class AirtimePage extends ConsumerWidget {
  AirtimePage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldPagePaddingWidget(
      horizontal: 24,
      child: Scaffold(
        appBar: const AppBarWidget(
          title: 'Airtime',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  const AppInputField(
                    title: 'Choose an amount',
                    child: AirtimeAmountWidget(),
                  ),
                  const SizedBox(height: 18),
                  const AmountWidget(),
                  const SizedBox(height: 18),
                  AppInputField(
                    title: 'Network',
                    child: AppDropDownWidget<Network>(
                      data: Network.values,
                      title: 'Choose Network',
                      builder: (data) {
                        return Text(data.title);
                      },
                      onChange: (value) => ref
                          .read(selectedAirtimeProvider.notifier)
                          .state = value,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const PhoneNumberWidget(),
                  const SizedBox(height: 40),
                  AppButton.elevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;
                      final selectedNetwork = ref.read(selectedAirtimeProvider);
                      if (selectedNetwork == null) {
                        context.showToast('Please select network');
                        return;
                      }
                      context.push(const AirtimeConfirmationPage());
                    },
                    label: 'Next',
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
