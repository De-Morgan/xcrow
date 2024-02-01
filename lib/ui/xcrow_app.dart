import 'package:flutter/material.dart';
import 'package:xcrow/ui/onboarding/pages/sign_up_step_one.dart';
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
      home: const SignUpStepOne(),
    );
  }
}
