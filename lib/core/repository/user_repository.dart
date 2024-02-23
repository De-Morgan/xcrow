import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/api_services/user_service.dart';
import 'package:xcrow/core/models/account_info.dart';
import 'package:xcrow/core/models/sign_in_response.dart';
import 'package:xcrow/ui/onboarding/providers/user_provider.dart';

class UserRepository {
  final Ref ref;

  UserService get userService => ref.read(userServiceProvider);

  int get userId => ref.read(userIdProvider);

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

  Future<AccountInfo> getUserAccountInfo() =>
      userService.getUserAccountInfo(userId: userId);

  Future<bool> checkTransactionPin({required String pin}) =>
      userService.checkTransactionPin(userId: userId, pin: pin);

  Future<bool> setTransactionPin(
          {required int userId, required String email, required String pin}) =>
      userService.setTransactionPin(pin: pin, userId: userId, email: email);
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref: ref);
});
