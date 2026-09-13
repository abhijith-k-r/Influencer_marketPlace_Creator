import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'custom_text_field.dart';

/// Password input field for the Sign In screen with toggle and forgot password link.
class SigninPasswordField extends StatelessWidget {
  final bool isPasswordVisible;
  final ValueChanged<String> onChanged;
  final VoidCallback onToggleVisibility;

  const SigninPasswordField({
    super.key,
    required this.isPasswordVisible,
    required this.onChanged,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: AppStrings.passwordLabel,
      placeholder: AppStrings.passwordPlaceholder,
      prefixIcon: AppAssets.icLock,
      isRequired: false,
      obscureText: !isPasswordVisible,
      labelTrailing: GestureDetector(
        onTap: () {},
        child: Text(AppStrings.forgotPassword, style: AppTextStyles.textLink),
      ),
      trailing: IconButton(
        icon: SvgPicture.asset(
          AppAssets.icEye,
          width: 18,
          height: 14,
          colorFilter: ColorFilter.mode(
            isPasswordVisible
                ? AppColors.primary
                : AppColors.textSecondary,
            BlendMode.srcIn,
          ),
        ),
        onPressed: onToggleVisibility,
      ),
      onChanged: onChanged,
    );
  }
}
