

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/models/electricity.dart';
import 'package:xcrow/ui/bills/provider/electricity.dart';
import 'package:xcrow/ui/bills/widgets/select_tv_provider.dart';
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

class CableTvPage extends ConsumerWidget {
  CableTvPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldPagePaddingWidget(
        horizontal: 24,
        child: Scaffold(
          appBar: const AppBarWidget(
            title: 'Cable TV',
          ),
          body: PaddedContainer(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  const AppInputField(
                    title: 'Service Provider',
                    child: SelectTvProviderWidget(),
                  ),
                  const SizedBox(height: 20),
                  const AppInputField(
                    title: 'Select Package',
                    child: SelectTvPackageWidget(),
                  ),
                  const SizedBox(height: 20),

                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Smart Card Numbers'
                    ),
                  ),
                  const SizedBox(height: 20),
                  const AmountWidget(),
                  const SizedBox(height: 32),

                  AppButton.elevatedButton(label: 'Next',onPressed: (){},),
                ],
              ),
            ),
          ),
        ));
  }
}
