import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/onboarding/providers/auth_provider.dart';
import 'package:xcrow/ui/shared/app_button.dart';
import 'package:xcrow/ui/theme/theme.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class LogOutButton extends ConsumerWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.customTheme<AppColors>();
    return AppButton.textButton(
      label: 'Log Out',
      style: TextButton.styleFrom(foregroundColor: theme.navBarColor),
      onPressed: () {
        ref.read(authProvider.notifier).logOut();
        context.popToFirstScreen();
      },
    );
  }
}
