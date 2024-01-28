import 'package:flutter/material.dart';
import 'package:xcrow/ui/home_page/pages/home_page.dart';
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
      //themeMode: ref.watch(themeModeProvider),
      // onGenerateRoute: RouteNames.generateRoute,
      home: const HomePage(),
    );
  }
}
