import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/models/account_info.dart';
import 'package:xcrow/core/models/base_response.dart';
import 'package:xcrow/core/models/sign_in_response.dart';
import 'package:xcrow/core/models/type_sanitizer.dart';
import 'package:xcrow/core/network/index.dart';

class UserService {
  final Ref ref;

  NetworkProvider get network => ref.read(networkProvider);
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

  Future<SignInResponse> signIn(
      {required String email, required String password}) async {
    try {
      final response = await network.post('$serviceName/login',
          body: {'email': email, 'password': password});
      final baseResponse = BaseResponse.fromJson(response.data);
      if (baseResponse.status == false) {
        throw baseResponse.message ?? ApiError.unknownError;
      }
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

  Future<AccountInfo> getUserAccountInfo({required int userId}) async {
    try {
      final response = await network.post('$serviceName/get/account');
      return AccountInfo.fromJson(response.data);
    } on ApiError {
      rethrow;
    }
  }

  Future<bool> checkTransactionPin(
      {required int userId, required String pin}) async {
    try {
      final response = await network.post('$serviceName/check/transaction/pin',
          body: {'id': userId, 'pin': pin});
      return TypeSanitizer.sanitizeToBool(response.data['status']) ?? false;
    } on ApiError {
      rethrow;
    }
  }

  Future<bool> setTransactionPin(
      {required int userId, required String email, required String pin}) async {
    try {
      final response = await network.post('$serviceName/set/transaction/pin',
          body: {'id': userId, 'pin': pin, 'email': email});
      return TypeSanitizer.sanitizeToBool(response.data['status']) ?? false;
    } on ApiError {
      rethrow;
    }
  }
}

final userServiceProvider = Provider<UserService>((ref) {
  return UserService(ref: ref);
});
