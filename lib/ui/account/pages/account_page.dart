import 'package:flutter/material.dart';
import 'package:xcrow/ui/account/widgets/acccount_action.dart';
import 'package:xcrow/ui/account/widgets/log_out_button.dart';
import 'package:xcrow/ui/account/widgets/username_widget.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/shared/app_bar_circle.dart';
import 'package:xcrow/ui/shared/app_button.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = context.customTheme<AppColors>();
    return ScaffoldPagePaddingWidget(
      child: Scaffold(
        appBar: const TopAppBarWidget(
          centerTitle: true,
          title: 'Account',
        ),
        body: Center(
          child: SizedBox(
            width: 307,
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      const AppBarCircle(
                        size: 60,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Tier 1 Upgrade Account'.toUpperCase(),
                        style: TextStyle(color: appColors.navBarColor),
                      ),
                      const SizedBox(height: 12),
                      const UsernameWidget(),
                      const SizedBox(height: 14),
                      AppButton.elevatedButton(
                        label: 'Edit button',
                        onPressed: () {},
                      ),
                      const SizedBox(height: 24),
                      const AccountAction(
                        svgIcon: SvgPath.account,
                        title: 'Account information',
                      ),
                      const SizedBox(height: 16),
                      const AccountAction(
                        svgIcon: SvgPath.beneficiary,
                        title: 'Beneficiary',
                      ),
                      const SizedBox(height: 16),
                      const AccountAction(
                        svgIcon: SvgPath.security,
                        title: 'Security',
                      ),
                      const SizedBox(height: 16),
                      const AccountAction(
                        svgIcon: SvgPath.identity,
                        title: 'Identification',
                      ),
                      const SizedBox(height: 16),
                      const AccountAction(
                        svgIcon: SvgPath.call,
                        title: 'Help and support',
                      ),
                      const SizedBox(height: 16),
                      const AccountAction(
                        svgIcon: SvgPath.social,
                        title: 'Social Media',
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Row(
                  children: [LogOutButton()],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
