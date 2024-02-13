import 'package:flutter/material.dart';
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
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ..._DashboardActionEnum.values.map((e) => _DashboardAction(
                    dashboardAction: e,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

enum _DashboardActionEnum { add, send, convert }

extension on _DashboardActionEnum {
  String get title => switch (this) {
        _DashboardActionEnum.add => 'ADD MONEY',
        _DashboardActionEnum.send => 'SEND MONEY',
        _DashboardActionEnum.convert => 'CONVERT',
      };

  String get svg => switch (this) {
        _DashboardActionEnum.add => SvgPath.addMoney,
        _DashboardActionEnum.send => SvgPath.arrowUp,
        _DashboardActionEnum.convert => SvgPath.convert,
      };
}

class _DashboardAction extends StatelessWidget {
  const _DashboardAction({super.key, required this.dashboardAction});

  final _DashboardActionEnum dashboardAction;

  @override
  Widget build(BuildContext context) {
    final theme = context.customTheme<DashboardActionTheme>();
    return Column(
      children: [
        Container(
          width: 67,
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: theme.background,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: theme.border)),
          child: SvgWidget(
            svgPath: dashboardAction.svg,
            color: theme.iconColor,
            height: 20,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          dashboardAction.title,
          style: context.bodySmall?.copyWith(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
