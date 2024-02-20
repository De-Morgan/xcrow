import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/models/sign_in_response.dart';
import 'package:xcrow/ui/home_page/widgets/home_page_appbar.dart';
import 'package:xcrow/ui/onboarding/providers/user_provider.dart';
import 'package:xcrow/ui/shared/app_bar_circle.dart';
import 'package:xcrow/ui/theme/theme.dart';

void main() {
  testWidgets('Homepage appbar has "Hello, Michael" message', (tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: LightTheme.theme,
      home: ProviderScope(overrides: [
        userProvider.overrideWithValue(SignInResponse(first_name: 'Michael'))
      ], child: const HomePageAppBar()),
    ));
    expect(find.text('HELLO, MICHAEL'), findsOneWidget);
  });

  testWidgets('Homepage appbar has AppBarCircle widget', (tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: LightTheme.theme,
      home: ProviderScope(overrides: [
        userProvider.overrideWithValue(SignInResponse(first_name: 'Michael'))
      ], child: const HomePageAppBar()),
    ));
    expect(find.byType(AppBarCircle), findsOneWidget);
  });
}
