import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// Header section matching Figma Step 4 specs:
/// 'Trusted Creator Pipeline' badge, 'Show your previous work' h1, and subtitle.
class Step4PortfolioHeader extends StatelessWidget {
  const Step4PortfolioHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: const BoxDecoration(
            color: AppColors.trustBadgeBackground,
            borderRadius: AppRadii.roundedPill,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.verified,
                size: 14,
                color: AppColors.primary,
              ),
              const SizedBox(width: 6),
              Text(
                'Trusted Creator Pipeline',
                style: AppTextStyles.brandPill.copyWith(
                  color: AppColors.primary,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Show your previous work',
          style: AppTextStyles.h1,
        ),
        const SizedBox(height: 6),
        Text(
          'Highlight past campaigns to showcase your quality, authentic reach, '
          'and brand collaboration experience.',
          style: AppTextStyles.subtitle,
        ),
      ],
    );
  }
}
