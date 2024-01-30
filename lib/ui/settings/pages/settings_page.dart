import 'package:flutter/material.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/shared/app_listtile.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPagePaddingWidget(
      child: Scaffold(
        appBar: const TopAppBarWidget(
          title: 'User Settings',
        ),
        body: Column(
          children: [
            const SizedBox(height: 8),
            const AppListTile(
              leadingSvg: SvgPath.message,
              title: 'Hi, Goodness Davies',
              subtitle: 'contactblugraviti@gmail.com',
            ),
            const AppListTile(
              leadingSvg: SvgPath.chat,
              title: 'User Settings',
              subtitle: 'Change Password',
            ),
            const AppListTile(
              leadingSvg: SvgPath.review,
              title: 'Wallet',
              subtitle: 'Change Transaction Pin',
            ),
            const AppListTile(
              leadingSvg: SvgPath.phone,
              title: 'Preference',
              subtitle: 'Appearance & Display',
            ),
            const AppListTile(
              leadingSvg: SvgPath.phone,
              title: 'Refer a friend',
            ),
          ],
        ),
      ),
    );
  }
}
