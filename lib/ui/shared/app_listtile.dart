import 'package:flutter/material.dart';
import 'package:xcrow/ui/shared/svg_widget.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class AppListTile extends StatelessWidget {
  const AppListTile(
      {super.key,
      this.title = '',
      this.subtitle = '',
      this.subtitleWidget,
      this.titleWidget,
      this.leading,
      this.trailingSvg,
      this.trailing,
      this.onTap,
      this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      this.leadingSvg});

  final String title;
  final Widget? titleWidget;

  final String subtitle;
  final Widget? subtitleWidget;

  final String? leadingSvg;
  final Widget? leading;

  final String? trailingSvg;
  final Widget? trailing;
  final VoidCallback? onTap;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: IconTheme(
          data: IconThemeData(color: context.listTileThemeData.iconColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Row(
                  children: [
                    leading ??
                        switch (leadingSvg != null) {
                          true => SvgWidget(
                              svgPath: '$leadingSvg',
                              width: 20,
                              color: context.listTileThemeData.iconColor),
                          false => const SizedBox()
                        },
                    if (leading != null || leadingSvg != null)
                      const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          titleWidget ??
                              Text(
                                title,
                                style: context.listTileThemeData.titleTextStyle,
                              ),
                          subtitleWidget ??
                              switch (subtitle.isNotEmpty) {
                                true => Text(
                                    subtitle,
                                    style: context
                                        .listTileThemeData.subtitleTextStyle,
                                  ),
                                false => const SizedBox.shrink()
                              }
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              trailing ??
                  switch (trailingSvg != null) {
                    true => SvgWidget(
                        svgPath: '$trailingSvg',
                      ),
                    false => const SizedBox()
                  },
            ],
          ),
        ),
      ),
    );
  }
}
