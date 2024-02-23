import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/onboarding/providers/user_provider.dart';
import 'package:xcrow/ui/utils/string_extension.dart';

/// Check if transaction pin has been set
final checkTransactionProvider = FutureProvider.autoDispose<bool>((ref) async {
  final user = ref.watch(userProvider);
  return user.transactionPin.nullToEmpty.isNotEmpty;
});
