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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
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
    //todo delete
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
      trailing: trailing ??
          switch (trailingSvg != null) {
            true => SvgWidget(
                svgPath: '$trailingSvg',
                width: 20,
              ),
            false => null
          },
    );
  }
}
