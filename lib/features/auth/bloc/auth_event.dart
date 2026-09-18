import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class AuthenticateWithPhoneEvent extends AuthEvent {
  const AuthenticateWithPhoneEvent();
}

class AuthenticateWithGoogleEvent extends AuthEvent {
  const AuthenticateWithGoogleEvent();
}

class AuthenticateWithAppleEvent extends AuthEvent {
  const AuthenticateWithAppleEvent();
}

class AuthenticateWithEmailEvent extends AuthEvent {
  const AuthenticateWithEmailEvent();
}

class SignOutEvent extends AuthEvent {
  const SignOutEvent();
}
