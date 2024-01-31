import 'package:flutter/material.dart';
import 'package:xcrow/ui/home_page/pages/add_by_card.dart';
import 'package:xcrow/ui/home_page/pages/bank_transfer_page.dart';
import 'package:xcrow/ui/home_page/pages/your_ngn_account.dart';
import 'package:xcrow/ui/home_page/widgets/account_num_widget.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/home_page/widgets/new_year_widget.dart';
import 'package:xcrow/ui/shared/app_listtile.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

class AddMoneyPage extends StatelessWidget {
  const AddMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPagePaddingWidget(
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Add Money',
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              AppListTile(
                leadingSvg: SvgPath.bank,
                title: 'Bank Transfer',
                subtitle: 'Add money via mobile or internet banking',
                trailing: Icon(Icons.keyboard_arrow_right_rounded),
                onTap: () => context.push(BankTransferPage()),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16, bottom: 10),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: AccountNumberWidget(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16, top: 10),
                child: Divider(),
              ),
              AppListTile(
                leadingSvg: SvgPath.cashDeposit,
                title: 'Cash Deposit',
                subtitle: 'Fund your account with nearby merchants',
                trailing: Icon(Icons.keyboard_arrow_right_rounded),
                onTap: () => context.push(YourNgnAccountPage()),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16, top: 10),
                child: Divider(),
              ),
              AppListTile(
                leadingSvg: SvgPath.card,
                title: 'Top-up with Card/Account',
                subtitle: 'Add money directly from your bank card or account',
                trailing: Icon(Icons.keyboard_arrow_right_rounded),
                onTap: () => context.push(AddByCardPage()),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16, top: 10),
                child: Divider(),
              ),
              AppListTile(
                leadingSvg: SvgPath.ussd,
                title: 'Bank USSD',
                subtitle: 'with other banks USSD CODE',
                trailing: Icon(Icons.keyboard_arrow_right_rounded),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16, top: 10),
                child: Divider(),
              ),
              AppListTile(
                leading: SizedBox(
                  width: 20,
                ),
                title: 'Request Money from Others',
                subtitle: 'Send a request to any Paytal user',
                trailing: Icon(Icons.keyboard_arrow_right_rounded),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
                child: NewYearWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
