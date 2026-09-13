import 'package:equatable/equatable.dart';

/// Base class for all Signup events.
sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

final class FullNameChanged extends SignupEvent {
  final String fullName;
  const FullNameChanged(this.fullName);

  @override
  List<Object?> get props => [fullName];
}

final class EmailChanged extends SignupEvent {
  final String email;
  const EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

final class PasswordChanged extends SignupEvent {
  final String password;
  const PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

final class ConfirmPasswordChanged extends SignupEvent {
  final String confirmPassword;
  const ConfirmPasswordChanged(this.confirmPassword);

  @override
  List<Object?> get props => [confirmPassword];
}

final class TogglePasswordVisibility extends SignupEvent {
  const TogglePasswordVisibility();
}

final class ToggleConfirmPasswordVisibility extends SignupEvent {
  const ToggleConfirmPasswordVisibility();
}

final class ToggleTermsAccepted extends SignupEvent {
  const ToggleTermsAccepted();
}

final class SignupSubmitted extends SignupEvent {
  const SignupSubmitted();
}
