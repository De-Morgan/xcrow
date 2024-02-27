import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/models/account_info.dart';
import 'package:xcrow/core/repository/user_repository.dart';
import 'package:xcrow/ui/onboarding/providers/user_provider.dart';

class AccountInfoNotifier extends StateNotifier<AsyncValue<AccountInfo?>> {
  AccountInfoNotifier(this.ref) : super(const AsyncData(null)) {
    getAccountInfo();
  }

  final AutoDisposeRef ref;

  UserRepository get userRepository => ref.read(userRepositoryProvider);

  Future getAccountInfo({bool showLoading = true}) async {
    try {
      if (showLoading) state = const AsyncLoading();
      final balance = await userRepository.getAccountInfo();
      ref.keepAlive();
      state = AsyncData(balance);
    } catch (error, _) {
      if (showLoading) state = AsyncError(error, _);
    }
  }
}

final accountInfoProvider = StateNotifierProvider.autoDispose<
    AccountInfoNotifier, AsyncValue<AccountInfo?>>((ref) {
  ref.watch(userIdProvider);
  return AccountInfoNotifier(ref);
});
