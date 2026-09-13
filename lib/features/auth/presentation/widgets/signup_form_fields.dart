import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_spacing.dart';
import '../bloc/signup_bloc.dart';
import '../bloc/signup_event.dart';
import '../bloc/signup_state.dart';
import 'confirm_password_input_field.dart';
import 'custom_text_field.dart';
import 'password_input_field.dart';
import 'primary_button.dart';
import 'signin_redirect_row.dart';
import 'terms_checkbox_row.dart';

/// Renders all reactive form fields, validation meters, and submission buttons.
class SignupFormFields extends StatelessWidget {
  const SignupFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        final bloc = context.read<SignupBloc>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              label: AppStrings.fullNameLabel,
              placeholder: AppStrings.fullNamePlaceholder,
              prefixIcon: AppAssets.icUser,
              onChanged: (val) => bloc.add(FullNameChanged(val)),
            ),
            AppSpacing.verticalLg,
            CustomTextField(
              label: AppStrings.emailLabel,
              placeholder: AppStrings.emailPlaceholder,
              prefixIcon: AppAssets.icEmail,
              keyboardType: TextInputType.emailAddress,
              onChanged: (val) => bloc.add(EmailChanged(val)),
            ),
            AppSpacing.verticalLg,
            PasswordInputField(
              isPasswordVisible: state.isPasswordVisible,
              passwordStrength: state.passwordStrength,
              onChanged: (val) => bloc.add(PasswordChanged(val)),
              onToggleVisibility: () =>
                  bloc.add(const TogglePasswordVisibility()),
            ),
            AppSpacing.verticalLg,
            ConfirmPasswordInputField(
              isConfirmPasswordVisible: state.isConfirmPasswordVisible,
              onChanged: (val) => bloc.add(ConfirmPasswordChanged(val)),
              onToggleVisibility: () =>
                  bloc.add(const ToggleConfirmPasswordVisibility()),
            ),
            AppSpacing.verticalLg,
            TermsCheckboxRow(
              isChecked: state.form.isTermsAccepted,
              onToggle: () => bloc.add(const ToggleTermsAccepted()),
            ),
            AppSpacing.verticalXl,
            PrimaryButton(
              label: AppStrings.createAccount,
              isLoading: state.status == SignupStatus.submitting,
              onPressed: () => bloc.add(const SignupSubmitted()),
            ),
            AppSpacing.verticalLg,
            const SigninRedirectRow(),
          ],
        );
      },
    );
  }
}
