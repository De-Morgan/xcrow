import 'package:flutter/material.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class RecipientRow extends StatelessWidget {
  const RecipientRow({
    required this.title,
    required this.subTitle,
    this.onTap,
    this.color,
    this.leading,
    this.trailing = const SizedBox.shrink(),
  });

  final String title;
  final String subTitle;
  final VoidCallback? onTap;
  final Color? color;
  final Widget trailing;
  final Widget? leading;

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textTheme.subtitle1,
          ),
          const SizedBox(height: 4),
          Text(
            subTitle,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
