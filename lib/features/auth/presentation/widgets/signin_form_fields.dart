import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../bloc/signin_bloc.dart';
import '../bloc/signin_event.dart';
import '../bloc/signin_state.dart';
import 'custom_text_field.dart';
import 'google_auth_button.dart';
import 'primary_button.dart';
import 'signin_password_field.dart';
import 'signin_remember_row.dart';

/// Form fields, toggles, and buttons for the Sign In screen.
class SigninFormFields extends StatelessWidget {
  const SigninFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
        final bloc = context.read<SigninBloc>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              label: AppStrings.emailLabel,
              placeholder: AppStrings.emailPlaceholder,
              prefixIcon: AppAssets.icEmail,
              isRequired: false,
              keyboardType: TextInputType.emailAddress,
              onChanged: (val) => bloc.add(SigninEmailChanged(val)),
            ),
            AppSpacing.verticalLg,
            SigninPasswordField(
              isPasswordVisible: state.isPasswordVisible,
              onChanged: (val) => bloc.add(SigninPasswordChanged(val)),
              onToggleVisibility: () =>
                  bloc.add(const ToggleSigninPasswordVisibility()),
            ),
            AppSpacing.verticalMd,
            SigninRememberRow(
              rememberDevice: state.rememberDevice,
              onToggle: () => bloc.add(const ToggleRememberDevice()),
            ),
            AppSpacing.verticalLg,
            PrimaryButton(
              label: AppStrings.signIn,
              isLoading: state.status == SigninStatus.submitting,
              onPressed: () => bloc.add(const SigninSubmitted()),
            ),
            AppSpacing.verticalLg,
            _buildDivider(),
            AppSpacing.verticalLg,
            GoogleAuthButton(
              onPressed: () => bloc.add(const SigninSubmitted()),
            ),
            AppSpacing.verticalLg,
            _buildSignupRedirect(context),
          ],
        );
      },
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.trustBadgeBackground)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(AppStrings.orContinueWith, style: AppTextStyles.brandPill),
        ),
        const Expanded(child: Divider(color: AppColors.trustBadgeBackground)),
      ],
    );
  }

  Widget _buildSignupRedirect(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(AppStrings.dontHaveAccount, style: AppTextStyles.body),
        GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.signup),
          child: Text(AppStrings.createAccount, style: AppTextStyles.textLink),
        ),
      ],
    );
  }
}
