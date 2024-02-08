import 'package:flutter/material.dart';
import 'package:xcrow/ui/home_page/pages/master_page.dart';
import 'package:xcrow/ui/theme/theme.dart';

class XCrowApp extends StatelessWidget {
  const XCrowApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xcrow',
      theme: LightTheme.theme,
      darkTheme: DarkTheme.theme,
      home: const MasterPage(),
    );
  }
}
