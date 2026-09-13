import 'package:flutter_bloc/flutter_bloc.dart';
import 'signin_event.dart';
import 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(const SigninState()) {
    on<SigninEmailChanged>(_onEmailChanged);
    on<SigninPasswordChanged>(_onPasswordChanged);
    on<ToggleSigninPasswordVisibility>(_onToggleVisibility);
    on<ToggleRememberDevice>(_onToggleRemember);
    on<SigninSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(SigninEmailChanged event, Emitter<SigninState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(
    SigninPasswordChanged event,
    Emitter<SigninState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  void _onToggleVisibility(
    ToggleSigninPasswordVisibility event,
    Emitter<SigninState> emit,
  ) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void _onToggleRemember(
    ToggleRememberDevice event,
    Emitter<SigninState> emit,
  ) {
    emit(state.copyWith(rememberDevice: !state.rememberDevice));
  }

  Future<void> _onSubmitted(
    SigninSubmitted event,
    Emitter<SigninState> emit,
  ) async {
    if (!state.isValid) return;
    emit(state.copyWith(status: SigninStatus.submitting));
    await Future.delayed(const Duration(milliseconds: 800));
    emit(state.copyWith(status: SigninStatus.success));
  }
}
