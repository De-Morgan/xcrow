import 'package:flutter/material.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class RecentActivity extends StatelessWidget {
  const RecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    final appColor = context.customTheme<AppColors>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Spacer(),
          Text(
            'Recent Activities',
            style: context.bodyMedium
                ?.copyWith(fontSize: 11, color: appColor.navBarColor),
          ),
          const Spacer(
            flex: 8,
          ),
          Text(
            'View All',
            style: context.titleSmall?.copyWith(fontSize: 12),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
