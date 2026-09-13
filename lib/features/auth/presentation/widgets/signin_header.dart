import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Top header for the Sign In screen with auto_awesome badge and greetings.
class SigninHeader extends StatelessWidget {
  const SigninHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: AppColors.buttonPrimary,
                borderRadius: AppRadii.roundedSm,
                boxShadow: AppShadows.cardSoft,
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.auto_awesome,
                size: 16,
                color: AppColors.surfaceWhite,
              ),
            ),
            AppSpacing.horizontalXs,
            Container(
              padding: AppSpacing.paddingLiveBadge,
              decoration: const BoxDecoration(
                color: AppColors.pillBackground,
                borderRadius: AppRadii.roundedPill,
              ),
              child: Text(
                AppStrings.creatorPlatform,
                style: AppTextStyles.brandPill,
              ),
            ),
          ],
        ),
        AppSpacing.verticalMd,
        Text(
          AppStrings.signinTitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.h1,
        ),
        AppSpacing.verticalSm,
        Text(
          AppStrings.signinSubtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }
}
