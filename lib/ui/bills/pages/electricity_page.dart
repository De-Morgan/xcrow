import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/models/electricity.dart';
import 'package:xcrow/ui/bills/provider/electricity.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/shared/app_button.dart';
import 'package:xcrow/ui/shared/app_input_field.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/shared/padded_container.dart';
import 'package:xcrow/ui/shared/success_dialog.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

import '../widgets/amount_widget.dart';
import '../widgets/electricity_meter_widget.dart';
import '../widgets/electricity_provider_widget.dart';
import '../widgets/electricty_name_enquiry.dart';
import '../widgets/meter_type_widget.dart';

class ElectricityPage extends ConsumerWidget {
  ElectricityPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldPagePaddingWidget(
        horizontal: 24,
        child: Scaffold(
          appBar: const AppBarWidget(
            title: 'Electricity',
            centerTitle: true,
          ),
          body: PaddedContainer(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  const AppInputField(
                    title: 'Service Provider',
                    child: SelectElectricityWidget(),
                  ),
                  const SizedBox(height: 18),
                  const AppInputField(
                    title: 'Select Package',
                    child: MeterTypeWidget(),
                  ),
                  const SizedBox(height: 18),
                  const AppInputField(
                    title: 'Meter number',
                    child: ElectricityMeterNumber(),
                  ),
                  const SizedBox(height: 8),
                  const ElectricityNameEnquiry(),
                  const SizedBox(height: 10),
                  const AmountWidget(),
                  const SizedBox(height: 32),
                  HookConsumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      final enable = useState(false);
                      final loading = useStreamController<bool>();
                      enable.value = ref
                          .watch(electricityNameEnquiryProvider)
                          .valueOrNull is ElectricityValidation;

                      return AppButton.elevatedButton(
                        enable: enable,
                        loading: loading.stream,
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) return;

                          try {
                            loading.add(true);
                            await ref.read(purchaseElectricityProvider.future);
                            loading.add(false);
                            await SuccessDialog.show(context,
                                message: 'Electricity purchase is successful');
                            ref.context.popToFirstScreen();
                          } catch (error) {
                            context.showError(error);
                          } finally {
                            loading.add(false);
                          }
                        },
                        label: 'Next',
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
