import 'package:flutter/material.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Navigation link row redirecting already registered users to Sign In.
class SigninRedirectRow extends StatelessWidget {
  final VoidCallback? onSignInTap;

  const SigninRedirectRow({super.key, this.onSignInTap});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(AppStrings.alreadyHaveAccount, style: AppTextStyles.body),
        GestureDetector(
          onTap:
              onSignInTap ??
              () => Navigator.pushNamed(context, AppRoutes.signin),
          child: Text(
            AppStrings.signIn,
            style: AppTextStyles.textLink.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
