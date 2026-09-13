import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Terms of Service and Privacy Policy checkbox with rich text hyperlinks.
class TermsCheckboxRow extends StatelessWidget {
  final bool isChecked;
  final VoidCallback onToggle;

  const TermsCheckboxRow({
    super.key,
    required this.isChecked,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggle,
      borderRadius: AppRadii.roundedSm,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCheckbox(),
            AppSpacing.horizontalMd,
            Expanded(child: _buildRichText()),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckbox() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: isChecked ? AppColors.primary : AppColors.inputBackground,
        borderRadius: AppRadii.roundedSm,
      ),
      alignment: Alignment.center,
      child: isChecked
          ? SvgPicture.asset(
              AppAssets.icCheck,
              width: 11,
              height: 8,
              colorFilter: const ColorFilter.mode(
                AppColors.surfaceWhite,
                BlendMode.srcIn,
              ),
            )
          : null,
    );
  }

  Widget _buildRichText() {
    return RichText(
      text: TextSpan(
        style: AppTextStyles.legalText,
        children: [
          const TextSpan(text: AppStrings.termsPrefix),
          TextSpan(
            text: AppStrings.termsOfService,
            style: AppTextStyles.legalText.copyWith(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(text: AppStrings.termsAnd),
          TextSpan(
            text: AppStrings.privacyPolicy,
            style: AppTextStyles.legalText.copyWith(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
