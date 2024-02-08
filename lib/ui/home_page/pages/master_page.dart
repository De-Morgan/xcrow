import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/home_page/pages/mother_page.dart';
import 'package:xcrow/ui/onboarding/pages/signin_page.dart';
import 'package:xcrow/ui/onboarding/providers/auth_provider.dart';

class MasterPage extends ConsumerWidget {
  const MasterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    return switch (authState) {
      UnAuthenticated() => LoginPage(),
      Authenticated() => const MotherPage(),
    };
  }
}
