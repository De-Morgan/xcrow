import 'package:flutter/material.dart';
import 'package:xcrow/ui/home_page/widgets/home_page_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
    );
  }
}
