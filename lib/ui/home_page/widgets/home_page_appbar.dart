import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/shared/svg_widget.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

import '../../onboarding/providers/user_provider.dart';

class HomePageAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: SafeArea(
        child: Row(
          children: [
            const _AppBarCircle(),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hi, ${user.first_name} ${user.surname}',
                  style: context.titleMedium,
                ),
                Text(
                  '${user.email}',
                  style: context.titleSmall,
                ),
              ],
            ),
            const Spacer(),
            const SvgWidget(
              svgPath: SvgPath.bell,
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _AppBarCircle extends StatelessWidget {
  const _AppBarCircle({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCircularTheme = context.customTheme<HomeCircularTheme>();
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
          border: Border.all(color: homeCircularTheme.border, width: 8),
          color: homeCircularTheme.background,
          shape: BoxShape.circle),
    );
  }
}
