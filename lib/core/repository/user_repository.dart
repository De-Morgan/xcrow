import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/api_services/user_service.dart';
import 'package:xcrow/core/models/sign_in_response.dart';

class UserRepository {
  final Ref ref;

  UserService get userService => ref.read(userServiceProvider);

  UserRepository({required this.ref});

  Future<SignInResponse> signup(SignUpRequest signUpRequest) =>
      userService.signup(signUpRequest);

  Future<bool> phoneExist({required String phone}) =>
      userService.phoneExist(phone: phone);

  Future<bool> emailExist({required String email}) =>
      userService.emailExist(email: email);
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref: ref);
});
