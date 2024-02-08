import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/home_page/widgets/button_nav_widget.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget(
      {super.key, this.actions, this.onBackPressed, required this.title});

  final String title;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 2,
      leading: Center(
        child: GestureDetector(
          onTap: () {
            if (onBackPressed != null) {
              onBackPressed?.call();
            } else {
              context.maybePop();
            }
          },
          child: Container(
            height: 26,
            width: 26,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
                  color: context.themeData.appBarTheme.iconTheme!.color!,
                ),
                shape: BoxShape.circle),
            child: const Icon(
              Icons.arrow_back,
              size: 16,
            ),
          ),
        ),
      ),
      title: Text(title),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class TopAppBarWidget extends ConsumerWidget implements PreferredSizeWidget {
  const TopAppBarWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageNotifier = ref.watch(pageIndexProvider.notifier);
    return AppBarWidget(
      title: title,
      onBackPressed: () => pageNotifier.state = 0,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
