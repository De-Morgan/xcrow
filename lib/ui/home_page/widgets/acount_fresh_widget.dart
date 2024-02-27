import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/home_page/providers/account_info_provider.dart';

class AccountInfoFreshWidget extends ConsumerWidget {
  const AccountInfoFreshWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(accountInfoProvider);
    return const SizedBox();
  }
}
