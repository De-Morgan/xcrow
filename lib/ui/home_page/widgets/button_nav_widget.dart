import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/shared/svg_widget.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

class BottomNavWidget extends ConsumerWidget {
  const BottomNavWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(pageIndexProvider);
    final currentIndexNotifier = ref.watch(pageIndexProvider.notifier);

    void onTap(int index) {
      currentIndexNotifier.state = index;
    }

    return BottomAppBar(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: _NavItem(
                  selected: currentIndex == 0,
                  onTap: () => onTap(0),
                  title: 'Home',
                  svgPath: SvgPath.home,
                ),
              ),
              Expanded(
                child: _NavItem(
                  selected: currentIndex == 1,
                  onTap: () => onTap(1),
                  title: 'Accounts',
                  svgPath: SvgPath.gift,
                ),
              ),
              Expanded(
                child: _NavItem(
                  selected: currentIndex == 2,
                  onTap: () => onTap(2),
                  title: 'Contact Us',
                  svgPath: SvgPath.contact,
                ),
              ),
              Expanded(
                child: _NavItem(
                  selected: currentIndex == 3,
                  onTap: () => onTap(3),
                  title: 'Settings',
                  svgPath: SvgPath.setting,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem(
      {Key? key,
      this.onTap,
      this.title = '',
      this.selected = false,
      this.svgPath = ''})
      : super(key: key);
  final String title;
  final String svgPath;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final appColor = context.customTheme<AppColors>();
    return InkResponse(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgWidget(
            svgPath: svgPath,
            color: selected ? appColor.navBarColor : null,
            width: 25,
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: context.titleSmall?.copyWith(
              fontSize: 13,
              color: selected ? appColor.navBarColor : null,
            ),
          ),
        ],
      ),
    );
  }
}

final pageIndexProvider = StateProvider<int>((ref) {
  return 0;
});
