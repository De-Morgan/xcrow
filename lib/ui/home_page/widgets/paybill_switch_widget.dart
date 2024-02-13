import 'package:flutter/material.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class PayBillSwitchWidget extends StatelessWidget {
  const PayBillSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appColor = context.customTheme<AppColors>();
    return Padding(
      padding: const EdgeInsets.only(top: 6.0, bottom: 9),
      child: Row(
        children: [
          const Spacer(),
          Text(
            'Exchange Rate',
            style: context.bodyMedium
                ?.copyWith(fontSize: 11, color: appColor.navBarColor),
          ),
          const Spacer(
            flex: 4,
          ),
          Text(
            'View Receipt',
            style: context.titleSmall?.copyWith(fontSize: 12),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
