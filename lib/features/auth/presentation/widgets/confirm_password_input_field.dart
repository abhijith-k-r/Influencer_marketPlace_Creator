import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import 'custom_text_field.dart';

/// Confirm password field with visibility toggle.
class ConfirmPasswordInputField extends StatelessWidget {
  final bool isConfirmPasswordVisible;
  final ValueChanged<String> onChanged;
  final VoidCallback onToggleVisibility;

  const ConfirmPasswordInputField({
    super.key,
    required this.isConfirmPasswordVisible,
    required this.onChanged,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: AppStrings.confirmPasswordLabel,
      placeholder: AppStrings.passwordPlaceholder,
      prefixIcon: AppAssets.icLock,
      obscureText: !isConfirmPasswordVisible,
      trailing: IconButton(
        icon: SvgPicture.asset(
          AppAssets.icEye,
          width: 18,
          height: 14,
          colorFilter: ColorFilter.mode(
            isConfirmPasswordVisible
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
