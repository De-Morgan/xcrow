import 'package:flutter/material.dart';
import 'package:xcrow/ui/home_page/widgets/bills_widget.dart';
import 'package:xcrow/ui/home_page/widgets/dash_board_widget.dart';
import 'package:xcrow/ui/home_page/widgets/home_page_appbar.dart';
import 'package:xcrow/ui/home_page/widgets/new_year_widget.dart';
import 'package:xcrow/ui/home_page/widgets/paybill_switch_widget.dart';
import 'package:xcrow/ui/home_page/widgets/recent_activity.dart';
import 'package:xcrow/ui/shared/padded_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomePageAppBar(),
      body: PaddedContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DashboardWidget(),
              PayBillSwitchWidget(),
              BillsWidget(),
              NewYearWidget(),
              RecentActivity(),
              //RecentActivityWidget()
            ],
          ),
        ),
      ),
    );
  }
}
