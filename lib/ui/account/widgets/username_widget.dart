import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/onboarding/providers/user_provider.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class UsernameWidget extends ConsumerWidget {
  const UsernameWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Text(
      user.fullName,
      style: context.bodySmall?.copyWith(fontSize: 20),
    );
  }
}
