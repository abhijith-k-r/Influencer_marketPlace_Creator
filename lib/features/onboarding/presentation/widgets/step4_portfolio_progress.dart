import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_spacing.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// Progress bar for Step 4 of 5 matching Figma onboarding pattern.
class Step4PortfolioProgress extends StatelessWidget {
  const Step4PortfolioProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'STEP 4 OF 5',
              style: AppTextStyles.brandPill.copyWith(
                color: AppColors.primary,
                letterSpacing: 0.55,
              ),
            ),
            Flexible(
              child: Text(
                'Experience & Portfolio',
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.fieldLabel.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        AppSpacing.verticalSm,
        Container(
          height: 8,
          decoration: const BoxDecoration(
            color: AppColors.trustBadgeBackground,
            borderRadius: AppRadii.roundedPill,
          ),
          alignment: Alignment.centerLeft,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                width: constraints.maxWidth * 0.80,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: AppRadii.roundedPill,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
