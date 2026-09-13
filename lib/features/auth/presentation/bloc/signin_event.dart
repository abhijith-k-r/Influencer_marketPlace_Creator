import 'package:equatable/equatable.dart';

sealed class SigninEvent extends Equatable {
  const SigninEvent();

  @override
  List<Object?> get props => [];
}

final class SigninEmailChanged extends SigninEvent {
  final String email;
  const SigninEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

final class SigninPasswordChanged extends SigninEvent {
  final String password;
  const SigninPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

final class ToggleSigninPasswordVisibility extends SigninEvent {
  const ToggleSigninPasswordVisibility();
}

final class ToggleRememberDevice extends SigninEvent {
  const ToggleRememberDevice();
}

final class SigninSubmitted extends SigninEvent {
  const SigninSubmitted();
}
