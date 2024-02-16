import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/utils/shared_preference.dart';
import 'package:xcrow/ui/xcrow_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceService().init();
  runApp(const ProviderScope(child: XCrowApp()));
}
