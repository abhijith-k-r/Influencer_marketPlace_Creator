import 'package:equatable/equatable.dart';

/// Data model representing the Creator Signup Form data.
class SignupFormModel extends Equatable {
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;
  final bool isTermsAccepted;

  const SignupFormModel({
    this.fullName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.isTermsAccepted = false,
  });

  SignupFormModel copyWith({
    String? fullName,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isTermsAccepted,
  }) {
    return SignupFormModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
    );
  }

  bool get isNameValid => fullName.trim().length >= 2;
  bool get isEmailValid =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email.trim());
  bool get isPasswordValid => password.length >= 8;
  bool get isConfirmPasswordValid =>
      confirmPassword.isNotEmpty && confirmPassword == password;
  bool get isValid =>
      isNameValid &&
      isEmailValid &&
      isPasswordValid &&
      isConfirmPasswordValid &&
      isTermsAccepted;

  /// Calculates password strength from 0 to 3 segments
  int get passwordStrength {
    if (password.isEmpty) return 0;
    int score = 0;
    if (password.length >= 8) score++;
    if (RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password)) {
      score++;
    }
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) score++;
    return score.clamp(1, 3);
  }

  @override
  List<Object?> get props => [
    fullName,
    email,
    password,
    confirmPassword,
    isTermsAccepted,
  ];
}
