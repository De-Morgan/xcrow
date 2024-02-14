import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/models/sign_in_response.dart';
import 'package:xcrow/core/repository/user_repository.dart';

sealed class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UnAuthenticated extends AuthState {}

class Authenticated extends AuthState {
  final SignInResponse user;

  Authenticated({required this.user});

  @override
  List<Object?> get props => [user];
}

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref ref;

  UserRepository get userRepository => ref.read(userRepositoryProvider);

  AuthNotifier(this.ref) : super(UnAuthenticated());
  //todo delete
  //AuthNotifier(this.ref) : super(Authenticated(user: SignInResponse.fromJson({})));

  Future signUp(SignUpRequest request) async {
    try {
      final signup = await userRepository.signup(request);
      state = Authenticated(user: signup);
      final token = signup.token;
    } catch (_) {
      rethrow;
    }
  }

  Future signIn({required String email, required String password}) async {
    try {
      final user =
          await userRepository.signIn(email: email, password: password);
      state = Authenticated(user: user);
    } catch (_) {
      rethrow;
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});