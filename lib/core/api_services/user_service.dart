import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/models/sign_in_response.dart';
import 'package:xcrow/core/models/type_sanitizer.dart';
import 'package:xcrow/core/network/index.dart';

class UserService {
  final Ref ref;

  NetworkProvider get network => ref.read(noInterceptorNetworkProvider);
  static const serviceName = 'user';

  UserService({required this.ref});

  Future<SignInResponse> signup(SignUpRequest signUpRequest) async {
    try {
      final response = await network.post('$serviceName/register',
          body: signUpRequest.toJson());
      return SignInResponse.fromJson(response.data['user']);
    } on ApiError {
      rethrow;
    }
  }

  Future<bool> phoneExist({required String phone}) async {
    try {
      final response = await network
          .post('$serviceName/phone/check', body: {'phone': phone});
      return TypeSanitizer.sanitizeToBool(response.data['phoneExist']) ?? false;
    } on ApiError {
      rethrow;
    }
  }

  Future<bool> emailExist({required String email}) async {
    try {
      final response = await network
          .post('$serviceName/email/check', body: {'email': email});
      return TypeSanitizer.sanitizeToBool(response.data['mailExist']) ?? false;
    } on ApiError {
      rethrow;
    }
  }
}

final userServiceProvider = Provider<UserService>((ref) {
  return UserService(ref: ref);
});
