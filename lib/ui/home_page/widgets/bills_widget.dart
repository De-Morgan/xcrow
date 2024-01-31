import 'package:flutter/material.dart';
import 'package:xcrow/ui/bills/pages/airtime_page.dart';
import 'package:xcrow/ui/shared/svg_widget.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

class BillsWidget extends StatelessWidget {
  const BillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _BilWidgetItem(
                title: 'Airtime',
                svgPath: SvgPath.call,
                onTap: () => context.push(AirtimePage()),
              ),
              _BilWidgetItem(
                title: 'Electricity',
                svgPath: SvgPath.light,
              ),
              _BilWidgetItem(
                title: 'Exam',
                svgPath: SvgPath.exam,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _BilWidgetItem(
                title: 'Data',
                svgPath: SvgPath.wifi,
              ),
              _BilWidgetItem(
                title: 'Cable TV',
                svgPath: SvgPath.tv,
              ),
              _BilWidgetItem(
                title: 'See All',
                svgPath: SvgPath.seeAll,
              ),
            ],
          ),
        ],
      ),
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
    final theme = context.customTheme<DashboardTheme>();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 97,
        height: 80,
        alignment: Alignment.center,
        // padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: theme.background,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.border, width: 10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SvgWidget(
              svgPath: svgPath,
              color: color,
            ),
            Spacer(),
            Text(
              title,
              style: context.bodyMedium?.copyWith(color: color, fontSize: 11),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
