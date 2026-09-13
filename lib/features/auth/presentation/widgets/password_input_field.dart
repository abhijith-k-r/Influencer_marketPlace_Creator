import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'custom_text_field.dart';
import 'password_strength_meter.dart';

/// Password field with strength indicator and visibility toggle.
class PasswordInputField extends StatelessWidget {
  final bool isPasswordVisible;
  final int passwordStrength;
  final ValueChanged<String> onChanged;
  final VoidCallback onToggleVisibility;

  const PasswordInputField({
    super.key,
    required this.isPasswordVisible,
    required this.passwordStrength,
    required this.onChanged,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          label: AppStrings.passwordLabel,
          placeholder: AppStrings.passwordPlaceholder,
          prefixIcon: AppAssets.icLock,
          obscureText: !isPasswordVisible,
          labelTrailing: Text(
            AppStrings.passwordMinLengthHint,
            style: AppTextStyles.brandPill.copyWith(
              color: AppColors.textSecondary,
              fontSize: 11,
            ),
          ),
          trailing: IconButton(
            icon: SvgPicture.asset(
              AppAssets.icEye,
              width: 18,
              height: 14,
              colorFilter: ColorFilter.mode(
                isPasswordVisible ? AppColors.primary : AppColors.textSecondary,
                BlendMode.srcIn,
              ),
            ),
            onPressed: onToggleVisibility,
          ),
          onChanged: onChanged,
        ),
        PasswordStrengthMeter(strength: passwordStrength),
      ],
    );
  }
}
