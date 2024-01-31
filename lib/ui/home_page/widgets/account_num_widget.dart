import 'package:flutter/material.dart';
import 'package:xcrow/ui/shared/button_container.dart';
import 'package:xcrow/ui/shared/round_border_widget.dart';
import 'package:xcrow/ui/shared/svg_widget.dart';
import 'package:xcrow/ui/theme/font_familty.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

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
        RoundBorderWidget(
          height: 44,
          width: 134,
          child: Row(
            children: [
              SvgWidget(
                svgPath: SvgPath.copy,
              ),
              const SizedBox(width: 6),
              Text(
                'Copy Number',
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
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
