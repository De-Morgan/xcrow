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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: theme.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.border, width: 10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SvgWidget(
                svgPath: SvgPath.nigeriaFlag,
              ),
              const SizedBox(width: 8),
              Text(
                'Naira account'.toUpperCase(),
                style: context.bodySmall,
              ),
              const Spacer(),
              const SvgWidget(
                svgPath: SvgPath.viewTransaction,
              ),
              const SizedBox(width: 4),
              Text(
                'View Transaction'.toUpperCase(),
                style: context.bodySmall?.copyWith(fontSize: 9),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'N',
                style: context.bodySmall?.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.w200,
                    fontFamily: FontFamily.light),
              ),
              Text(
                '10.83',
                style: context.bodySmall?.copyWith(
                    fontSize: 48,
                    fontWeight: FontWeight.w200,
                    fontFamily: FontFamily.light),
              ),
            ],
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
