import 'package:flutter/material.dart';
import 'package:xcrow/ui/home_page/pages/add_money_page.dart';
import 'package:xcrow/ui/shared/button_container.dart';
import 'package:xcrow/ui/shared/svg_widget.dart';
import 'package:xcrow/ui/theme/font_familty.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.customTheme<DashboardTheme>();
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 24, 24, 24),
      decoration: BoxDecoration(
          color: theme.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.border, width: 10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'View Wallet History',
                style: context.titleMedium?.copyWith(fontSize: 13),
              ),
              const SizedBox(width: 10),
              Icon(
                Icons.arrow_forward_rounded,
                color: context.primaryColor,
              )
            ],
          ),
          Text(
            'Balance at 21/11/23, 09:08 PM',
            style: context.titleSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'N10.00',
            style: context.bodyMedium?.copyWith(
                fontSize: 45,
                fontWeight: FontWeight.w300,
                fontFamily: FontFamily.light),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ButtonContainer(
                onPressed: () {
                  context.push(const AddMoneyPage());
                },
                label: '+ Add Money',
              ),
              const Spacer(),
              Row(
                children: [
                  const SvgWidget(
                    svgPath: SvgPath.eyeSlash,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'View Receipt',
                    style: context.titleMedium
                        ?.copyWith(fontSize: 10, fontWeight: FontWeight.w300),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
