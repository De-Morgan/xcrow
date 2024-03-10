import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/models/sign_in_response.dart';
import 'package:xcrow/ui/onboarding/providers/auth_provider.dart';

final userProvider = Provider<SignInResponse>((ref) {
  final auth = ref.watch(authProvider) as Authenticated;
  return auth.user;
});

final userIdProvider = Provider<int>((ref) {
  final user = ref.watch(userProvider);
  return user.id ?? -1;
});

final userEmailProvider = Provider<String>((ref) {
  final user = ref.watch(userProvider);
  return user.email ?? '';
});
