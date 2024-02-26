import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/account/pages/account_page.dart';
import 'package:xcrow/ui/contact_us/pages/contact_us_page.dart';
import 'package:xcrow/ui/home_page/pages/create_transaction_page.dart';
import 'package:xcrow/ui/home_page/pages/home_page.dart';
import 'package:xcrow/ui/home_page/widgets/button_nav_widget.dart';
import 'package:xcrow/ui/settings/pages/settings_page.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

import '../providers/check_transaction_pin_provider.dart';

class MotherPage extends ConsumerWidget {
  const MotherPage({super.key});

  static const pages = [
    HomePage(),
    AccountPage(),
    ContactUsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageIndex = ref.watch(pageIndexProvider);

    ref.listen(checkTransactionProvider, (prev, next) {
      next.maybeWhen(
          orElse: () {},
          data: (pinSet) {
            if (!pinSet) {
              context.push(CreateTransactionPage());
            }
          });
    });
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: const BottomNavWidget(),
    );
  }
}
