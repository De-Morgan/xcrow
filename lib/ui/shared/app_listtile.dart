import 'package:flutter/material.dart';
import 'package:xcrow/ui/shared/svg_widget.dart';

class AppListTile extends StatelessWidget {
  const AppListTile(
      {super.key,
      this.title = '',
      this.subtitle = '',
      this.subtitleWidget,
      this.titleWidget,
      this.leading,
      this.leadingSvg});

  final String title;
  final Widget? titleWidget;

  final String subtitle;
  final Widget? subtitleWidget;

  final String? leadingSvg;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: titleWidget ?? Text(title),
      subtitle: subtitleWidget ??
          switch (subtitle.isNotEmpty) {
            true => Text(subtitle),
            false => null
          },
      dense: true,
      leading: leading ??
          switch (leadingSvg != null) {
            true => SvgWidget(
                svgPath: '$leadingSvg',
                width: 20,
              ),
            false => null
          },
    );
  }
}
