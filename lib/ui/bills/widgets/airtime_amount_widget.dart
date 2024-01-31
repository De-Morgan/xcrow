import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/bills/provider/airtime.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class AirtimeAmountWidget extends ConsumerWidget {
  const AirtimeAmountWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final airtimeController = ref.watch(airtimeAmountProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...['50', '100', '200'].map((e) => _AmountWidget(
                  amount: e,
                  onTap: () => airtimeController.text = e,
                ))
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...['500', '1,000', '2,000'].map((e) => _AmountWidget(
                  amount: e,
                  onTap: () => airtimeController.text = e,
                ))
          ],
        ),
      ],
    );
  }
}

class _AmountWidget extends StatelessWidget {
  const _AmountWidget({super.key, required this.amount, this.onTap});

  final String amount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final appColor = context.customTheme<AppColors>();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 91,
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: appColor.amountBgColor),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'N',
              style: context.bodyMedium?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: appColor.outlineColor),
            ),
            Text(
              '$amount',
              style: context.bodyMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: appColor.outlineColor),
            )
          ],
        ),
      ),
    );
  }
}
