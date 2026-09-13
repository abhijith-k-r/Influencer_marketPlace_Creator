import 'package:equatable/equatable.dart';

enum SigninStatus { initial, submitting, success, failure }

class SigninState extends Equatable {
  final String email;
  final String password;
  final bool isPasswordVisible;
  final bool rememberDevice;
  final SigninStatus status;
  final String? errorMessage;

  const SigninState({
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.rememberDevice = true,
    this.status = SigninStatus.initial,
    this.errorMessage,
  });

  SigninState copyWith({
    String? email,
    String? password,
    bool? isPasswordVisible,
    bool? rememberDevice,
    SigninStatus? status,
    String? errorMessage,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      rememberDevice: rememberDevice ?? this.rememberDevice,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  bool get isValid => email.contains('@') && password.length >= 6;

  @override
  List<Object?> get props => [
    email,
    password,
    isPasswordVisible,
    rememberDevice,
    status,
    errorMessage,
  ];
}
