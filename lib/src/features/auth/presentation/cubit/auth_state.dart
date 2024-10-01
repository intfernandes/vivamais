abstract class AuthState {}

class AuthInitial implements AuthState {}

class Authenticated implements AuthState {
  final String uid;

  const Authenticated({required this.uid});
}

class AuthLoading implements AuthState {}

class UnAuthenticated implements AuthState {}

class AuthError implements AuthState {
  final String error;

  AuthError({required this.error});
}
