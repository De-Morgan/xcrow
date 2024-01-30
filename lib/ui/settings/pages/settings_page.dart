import 'package:flutter/material.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/shared/app_listtile.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldPagePaddingWidget(
      child: Scaffold(
        appBar: TopAppBarWidget(
          title: 'User Settings',
        ),
        body: Column(
          children: [
            SizedBox(height: 8),
            AppListTile(
              leadingSvg: SvgPath.ellipse,
              title: 'Hi, Goodness Davies',
              subtitle: 'contactblugraviti@gmail.com',
            ),
            AppListTile(
              leadingSvg: SvgPath.userSetting,
              title: 'User Settings',
              subtitle: 'Change Password',
            ),
            AppListTile(
              leadingSvg: SvgPath.wallet,
              title: 'Wallet',
              subtitle: 'Change Transaction Pin',
            ),
            AppListTile(
              leadingSvg: SvgPath.preference,
              title: 'Preference',
              subtitle: 'Appearance & Display',
            ),
            AppListTile(
              leadingSvg: SvgPath.refferal,
              title: 'Refer a friend',
            ),
          ],
        ),
      ),
    );
  }
}
