import 'package:flutter/material.dart';
import 'package:xcrow/ui/shared/svg_widget.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

class PayBillSwitchWidget extends StatelessWidget {
  const PayBillSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appColor = context.customTheme<AppColors>();
    return Padding(
      padding: const EdgeInsets.only(top: 6.0, bottom: 9),
      child: Row(
        children: [
          Spacer(),
          Text(
            'Pay Bills',
            style: context.bodyMedium
                ?.copyWith(fontSize: 11, color: appColor.navBarColor),
          ),
          Spacer(
            flex: 4,
          ),
          Row(
            children: [
              const SvgWidget(
                svgPath: SvgPath.switchSvg,
              ),
              const SizedBox(width: 5),
              Text(
                'Switch',
                style: context.titleMedium
                    ?.copyWith(fontSize: 10, fontWeight: FontWeight.w300),
              )
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
