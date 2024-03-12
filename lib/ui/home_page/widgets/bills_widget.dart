import 'package:flutter/material.dart';
import 'package:xcrow/ui/bills/pages/airtime_page.dart';
import 'package:xcrow/ui/bills/pages/cable_tv_page.dart';
import 'package:xcrow/ui/bills/pages/electricity_page.dart';
import 'package:xcrow/ui/shared/svg_widget.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

class BillsWidget extends StatelessWidget {
  const BillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.customTheme<DashboardTheme>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: theme.background,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: theme.border, width: 10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _BilWidgetItem(
                title: 'internet'.toUpperCase(),
                svgPath: SvgPath.wifi,
              ),
              const _VerticalDivider(),
              _BilWidgetItem(
                title: 'Airtime'.toUpperCase(),
                svgPath: SvgPath.call,
                onTap: () => context.push(AirtimePage()),
              ),
              const _VerticalDivider(),
              const _BilWidgetItem(
                title: 'EXAM',
                svgPath: SvgPath.exam,
              ),
              const _VerticalDivider(),
              const _BilWidgetItem(
                title: 'ESCROW',
                svgPath: SvgPath.escrow,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
              color: theme.background,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: theme.border, width: 10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _BilWidgetItem(
                title: 'Electricity'.toUpperCase(),
                svgPath: SvgPath.electricity,
                onTap: () => context.push(ElectricityPage()),
              ),
              const _VerticalDivider(),
              _BilWidgetItem(
                title: 'Betting'.toUpperCase(),
                svgPath: SvgPath.betting,
              ),
              const _VerticalDivider(),
              _BilWidgetItem(
                title: 'Cable TV'.toUpperCase(),
                svgPath: SvgPath.cableTv,
                onTap: ()=>context.push(CableTvPage()),
              ),
              const _VerticalDivider(),
              _BilWidgetItem(
                title: 'virtual Card'.toUpperCase(),
                svgPath: SvgPath.virtualCard,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BilWidgetItem extends StatelessWidget {
  const _BilWidgetItem(
      {super.key,
      this.onTap,
      required this.svgPath,
      required this.title,
      this.color});

  final String svgPath;
  final String title;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          SvgWidget(
            svgPath: svgPath,
            color: color,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: context.bodyMedium?.copyWith(color: color, fontSize: 10),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final appColor = context.customTheme<AppColors>();
    return Container(
      height: 40,
      width: 1,
      color: appColor.dividerColor,
    );
  }
}
