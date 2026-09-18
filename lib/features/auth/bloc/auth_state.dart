import 'package:equatable/equatable.dart';

enum AuthStatus { unauthenticated, authenticating, authenticated, failure }

class AuthState extends Equatable {
  final AuthStatus status;
  final String? userName;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.unauthenticated,
    this.userName,
    this.errorMessage,
  });

  bool get isAuthenticated => status == AuthStatus.authenticated;

  AuthState copyWith({
    AuthStatus? status,
    String? userName,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      userName: userName ?? this.userName,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, userName, errorMessage];
}
