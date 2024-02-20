import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/home_page/widgets/dashboard_widget.dart';
import 'package:xcrow/ui/theme/theme.dart';

void main() {
  testWidgets('Dashboard appbar has "VIEW TRANSACTION"', (tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: LightTheme.theme,
      home: const ProviderScope(child: Scaffold(body: DashboardWidget())),
    ));
    expect(find.text('VIEW TRANSACTION'), findsOneWidget);
  });

  testWidgets('Dashboard appbar has "ADD MONEY", "SEND MONEY", "CONVERT"',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: LightTheme.theme,
      home: const ProviderScope(child: Scaffold(body: DashboardWidget())),
    ));
    expect(find.text('ADD MONEY'), findsOneWidget);
    expect(find.text('SEND MONEY'), findsOneWidget);
    expect(find.text('CONVERT'), findsOneWidget);
  });
}
