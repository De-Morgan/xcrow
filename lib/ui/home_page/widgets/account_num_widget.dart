import 'package:flutter/material.dart';
import 'package:xcrow/ui/shared/button_container.dart';
import 'package:xcrow/ui/theme/font_familty.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class AccountNumberWidget extends StatelessWidget {
  const AccountNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Paytal Account Number',
          style: context.titleMedium?.copyWith(fontSize: 15),
        ),
        Text(
          '778 810 3395',
          style: context.bodyMedium?.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w300,
              fontFamily: FontFamily.light),
        ),
        const SizedBox(height: 16),
        CopyShareAcctNumberWidget()
      ],
    );
  }
}

class CopyShareAcctNumberWidget extends StatelessWidget {
  const CopyShareAcctNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          onPressed: () {},
          child: Text('Copy Number'),
        ),
        Spacer(),
        ButtonContainer(
          onPressed: () {},
          label: 'Share details',
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
