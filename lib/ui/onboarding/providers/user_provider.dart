import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/models/sign_in_response.dart';
import 'package:xcrow/ui/onboarding/providers/auth_provider.dart';

final userProvider = Provider<SignInResponse>((ref) {
  final auth = ref.watch(authProvider) as Authenticated;
  return auth.user;
});
