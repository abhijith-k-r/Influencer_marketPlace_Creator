import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthenticateWithPhoneEvent>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.authenticating));
      await Future.delayed(const Duration(milliseconds: 600));
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        userName: 'UrbanKicks Studio',
      ));
    });

    on<AuthenticateWithGoogleEvent>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.authenticating));
      await Future.delayed(const Duration(milliseconds: 600));
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        userName: 'UrbanKicks Studio',
      ));
    });

    on<AuthenticateWithAppleEvent>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.authenticating));
      await Future.delayed(const Duration(milliseconds: 600));
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        userName: 'UrbanKicks Studio',
      ));
    });

    on<AuthenticateWithEmailEvent>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.authenticating));
      await Future.delayed(const Duration(milliseconds: 600));
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        userName: 'UrbanKicks Studio',
      ));
    });

    on<SignOutEvent>((event, emit) async {
      emit(const AuthState(status: AuthStatus.unauthenticated));
    });
  }
}
