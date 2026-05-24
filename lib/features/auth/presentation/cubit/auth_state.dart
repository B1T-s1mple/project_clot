abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String message;
  AuthSuccess(this.message);
}

class Signup extends AuthState {
  final int userId;
  Signup(this.userId);
}

class AuthError extends AuthState {
  final String error;
  AuthError(this.error);
}
