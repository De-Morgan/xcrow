import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/bills/provider/airtime.dart';
import 'package:xcrow/ui/bills/widgets/airtime_amount_widget.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/shared/app_button.dart';
import 'package:xcrow/ui/shared/app_input_field.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class AirtimePage extends ConsumerWidget {
  const AirtimePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColor = context.customTheme<AppColors>();
    final airtimeController = ref.watch(airtimeAmountProvider);
    return ScaffoldPagePaddingWidget(
      horizontal: 24,
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Airtime',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                AppInputField(
                  title: 'Choose an amount',
                  child: AirtimeAmountWidget(),
                ),
                const SizedBox(height: 18),
                AppInputField(
                  titleWidget: Row(
                    children: [
                      Text('Amount',
                          style: context.titleMedium?.copyWith(fontSize: 13)),
                      Spacer(),
                      Text(
                        'Balance” 6,780.93',
                        style: context.titleSmall?.copyWith(
                            fontSize: 13, color: appColor.outlineColor),
                      )
                    ],
                  ),
                  child: TextField(
                    controller: airtimeController,
                    decoration: InputDecoration(hintText: 'N 0.00'),
                  ),
                ),
                const SizedBox(height: 18),
                AppInputField(
                  title: 'Network',
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Choose Network'),
                  ),
                ),
                const SizedBox(height: 18),
                AppInputField(
                  titleWidget: Row(
                    children: [
                      Text('Phone Number',
                          style: context.titleMedium?.copyWith(fontSize: 13)),
                      Spacer(),
                      Text(
                        'Choose contact',
                        style: context.titleSmall?.copyWith(
                            fontSize: 13,
                            color: appColor.outlineColor,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(hintText: '09031193287'),
                  ),
                ),
                const SizedBox(height: 40),
                AppButton.elevatedButton(
                  onPressed: () {},
                  label: 'Next',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
