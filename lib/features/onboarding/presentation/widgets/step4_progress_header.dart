import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// Progress header for Step 4 matching Figma:
/// 'STEP 4 OF 5 • PORTFOLIO' and '80% Completed' with 80% gradient bar.
class Step4ProgressHeader extends StatelessWidget {
  const Step4ProgressHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      color: AppColors.pillBackground,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '4',
                      style: AppTextStyles.brandPill.copyWith(
                        color: AppColors.primary,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'STEP 4 OF 5 • PORTFOLIO',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.brandPill.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 11,
                        letterSpacing: 0.66,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '80% Completed',
              style: AppTextStyles.fieldLabel.copyWith(
                fontSize: 12,
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
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
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryLight],
                  ),
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
