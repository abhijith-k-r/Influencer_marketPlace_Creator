import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_event.dart';
import 'signup_state.dart';

/// BLoC handling business logic and form validation for Creator Signup.
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(const SignupState()) {
    on<FullNameChanged>(_onFullNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<ToggleConfirmPasswordVisibility>(_onToggleConfirmPasswordVisibility);
    on<ToggleTermsAccepted>(_onToggleTermsAccepted);
    on<SignupSubmitted>(_onSignupSubmitted);
  }

  void _onFullNameChanged(FullNameChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(form: state.form.copyWith(fullName: event.fullName)));
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(form: state.form.copyWith(email: event.email)));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SignupState> emit) {
    emit(state.copyWith(form: state.form.copyWith(password: event.password)));
  }

  void _onConfirmPasswordChanged(
    ConfirmPasswordChanged event,
    Emitter<SignupState> emit,
  ) {
    emit(
      state.copyWith(
        form: state.form.copyWith(confirmPassword: event.confirmPassword),
      ),
    );
  }

  void _onTogglePasswordVisibility(
    TogglePasswordVisibility event,
    Emitter<SignupState> emit,
  ) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void _onToggleConfirmPasswordVisibility(
    ToggleConfirmPasswordVisibility event,
    Emitter<SignupState> emit,
  ) {
    emit(
      state.copyWith(isConfirmPasswordVisible: !state.isConfirmPasswordVisible),
    );
  }

  void _onToggleTermsAccepted(
    ToggleTermsAccepted event,
    Emitter<SignupState> emit,
  ) {
    emit(
      state.copyWith(
        form: state.form.copyWith(isTermsAccepted: !state.form.isTermsAccepted),
      ),
    );
  }

  Future<void> _onSignupSubmitted(
    SignupSubmitted event,
    Emitter<SignupState> emit,
  ) async {
    if (!state.isFormValid) return;
    emit(state.copyWith(status: SignupStatus.submitting));
    await Future.delayed(const Duration(milliseconds: 1000));
    emit(state.copyWith(status: SignupStatus.success));
  }
}
