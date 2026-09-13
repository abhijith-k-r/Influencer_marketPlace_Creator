import 'package:equatable/equatable.dart';
import '../../data/models/signup_form_model.dart';

enum SignupStatus { initial, submitting, success, failure }

/// State object representing the UI and logic state of the Signup screen.
class SignupState extends Equatable {
  final SignupFormModel form;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final SignupStatus status;
  final String? errorMessage;

  const SignupState({
    this.form = const SignupFormModel(),
    this.isPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
    this.status = SignupStatus.initial,
    this.errorMessage,
  });

  SignupState copyWith({
    SignupFormModel? form,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    SignupStatus? status,
    String? errorMessage,
  }) {
    return SignupState(
      form: form ?? this.form,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  int get passwordStrength => form.passwordStrength;
  bool get isFormValid => form.isValid;

  @override
  List<Object?> get props => [
    form,
    isPasswordVisible,
    isConfirmPasswordVisible,
    status,
    errorMessage,
  ];
}
