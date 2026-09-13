import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_spacing.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// Progress header for Step 2 matching Figma: 'STEP 2 OF 5' & '40% Completed'.
class Step2ProgressHeader extends StatelessWidget {
  const Step2ProgressHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: AppColors.trustBadgeBackground,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '2',
                    style: AppTextStyles.brandPill.copyWith(
                      color: AppColors.primary,
                      fontSize: 10,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  'STEP 2 OF 5',
                  style: AppTextStyles.brandPill.copyWith(
                    color: AppColors.textPrimary,
                    letterSpacing: 0.55,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: const BoxDecoration(
                color: AppColors.trustBadgeBackground,
                borderRadius: AppRadii.roundedPill,
              ),
              child: Text(
                '40% Completed',
                style: AppTextStyles.fieldLabel.copyWith(
                  fontSize: 11,
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
                width: constraints.maxWidth * 0.40,
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
