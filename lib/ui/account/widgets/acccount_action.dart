import 'package:flutter/material.dart';
import 'package:xcrow/ui/shared/svg_widget.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class AccountAction extends StatelessWidget {
  const AccountAction({super.key, required this.svgIcon, required this.title});

  final String svgIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = context.customTheme<AccountActionTheme>();
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 32, 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: theme.background),
      child: Row(
        children: [
          SvgWidget(
            svgPath: svgIcon,
            color: theme.textColor,
          ),
          const SizedBox(width: 32),
          Text(
            title,
            style: context.titleMedium?.copyWith(color: theme.textColor),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: theme.trailingIconColor,
            size: 14,
          )
        ],
      ),
    );
  }
}
