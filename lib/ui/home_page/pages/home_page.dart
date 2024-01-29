import 'package:flutter/material.dart';
import 'package:xcrow/ui/home_page/widgets/dash_board_widget.dart';
import 'package:xcrow/ui/home_page/widgets/home_page_appbar.dart';
import 'package:xcrow/ui/shared/padded_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      body: PaddedContainer(
        child: Column(
          children: [DashboardWidget()],
        ),
      ),
    );
  }
}
