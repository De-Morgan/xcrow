import 'package:flutter/material.dart';
import 'package:xcrow/ui/home_page/widgets/account_num_widget.dart';
import 'package:xcrow/ui/home_page/widgets/nav_page_padding.dart';
import 'package:xcrow/ui/shared/app_listtile.dart';
import 'package:xcrow/ui/shared/appbar_widget.dart';
import 'package:xcrow/ui/theme/font_familty.dart';
import 'package:xcrow/ui/utils/context_extension.dart';
import 'package:xcrow/ui/utils/svg_path.dart';

class BankTransferPage extends StatelessWidget {
  const BankTransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPagePaddingWidget(
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Bank Transfer',
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              AppListTile(
                leading: SizedBox(
                  width: 20,
                ),
                title: 'Paytal Account Number',
                subtitleWidget: Text(
                  '778 810 3395',
                  style: context.bodyMedium?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      fontFamily: FontFamily.light),
                ),
              ),
              AppListTile(
                leading: SizedBox(
                  width: 20,
                ),
                title: 'Bank',
                subtitle: 'Paytal Digital Service Limited',
              ),
              AppListTile(
                leadingSvg: SvgPath.user,
                title: 'Name',
                subtitle: 'Goodness Bassey Davies',
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16, bottom: 10),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: CopyShareAcctNumberWidget(),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 16.0, right: 16, top: 10, bottom: 10),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Text(
                  'Add money via bank transfer in just 3 steps',
                  style: context.titleMedium,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 38.0, right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. ',
                      style: context.bodyMedium?.copyWith(fontSize: 12),
                    ),
                    Expanded(
                      child: Text(
                        'Copy the account details above 7788103395 is your Paytal / Account Number',
                        style: context.bodyMedium?.copyWith(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 16.0, right: 16, top: 5, bottom: 5),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38.0, right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2. ',
                      style: context.bodyMedium?.copyWith(fontSize: 12),
                    ),
                    Expanded(
                      child: Text(
                        'Open the bank you want to transfer money from',
                        style: context.bodyMedium?.copyWith(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 16.0, right: 16, top: 5, bottom: 5),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38.0, right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '3. ',
                      style: context.bodyMedium?.copyWith(fontSize: 12),
                    ),
                    Expanded(
                      child: Text(
                        'Transfer the details amount to your Paytal Account',
                        style: context.bodyMedium?.copyWith(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
