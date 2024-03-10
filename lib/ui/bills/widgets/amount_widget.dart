import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/utils/number_formatter.dart';
import 'package:xcrow/ui/bills/provider/airtime.dart';
import 'package:xcrow/ui/shared/app_input_field.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/string_extension.dart';

class AmountWidget extends ConsumerWidget {
  const AmountWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColor = context.customTheme<AppColors>();
    final airtimeController = ref.watch(amountProvider);

    return AppInputField(
      titleWidget: Row(
        children: [
          Text('Amount', style: context.titleMedium?.copyWith(fontSize: 13)),
          const Spacer(),
          Text(
            'Balance” 6,780.93',
            style: context.titleSmall
                ?.copyWith(fontSize: 13, color: appColor.outlineColor),
          )
        ],
      ),
      child: TextFormField(
        controller: airtimeController,
        inputFormatters: [
          ThousandsFormatter(),
          LengthLimitingTextInputFormatter(13)
        ],
        decoration: const InputDecoration(hintText: 'N 0.00'),
        validator: (value) =>
            value.nullToEmpty.isNotEmpty ? null : 'Enter a valid amount',
      ),
    );
  }
}
