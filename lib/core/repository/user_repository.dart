import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/api_services/user_service.dart';
import 'package:xcrow/core/models/account_info.dart';
import 'package:xcrow/core/models/sign_in_response.dart';
import 'package:xcrow/ui/onboarding/providers/user_provider.dart';
import 'package:xcrow/ui/utils/shared_preference.dart';

class UserRepository {
  final Ref ref;

  UserService get userService => ref.read(userServiceProvider);

  SharedPreferenceService get sharedPreference =>
      ref.read(sharePreferenceProvider);

  int get userId => ref.read(userIdProvider);

  SignInResponse get user => ref.read(userProvider);

  UserRepository({required this.ref});

  Future<SignInResponse> signup(SignUpRequest signUpRequest) =>
      userService.signup(signUpRequest);

  Future<bool> phoneExist({required String phone}) =>
      userService.phoneExist(phone: phone);

  Future<bool> emailExist({required String email}) =>
      userService.emailExist(email: email);

  Future<SignInResponse> signIn(
          {required String email, required String password}) =>
      userService.signIn(email: email, password: password);

  Future<bool> checkTransactionPin({required String pin}) =>
      userService.checkTransactionPin(userId: userId, pin: pin);

  Future<bool> setTransactionPin({required String pin}) async {
    final result = await userService.setTransactionPin(
        pin: pin, userId: userId, email: '${user.email}');
    sharedPreference.saveCustomer(user.copyWith(transactionPin: pin));
    return result;
  }

  Future<AccountInfo> getAccountInfo() =>
      userService.getAccountInfo(id: userId);
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref: ref);
});
