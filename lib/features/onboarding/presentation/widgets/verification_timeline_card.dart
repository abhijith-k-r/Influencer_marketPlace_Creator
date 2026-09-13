import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Timeline indicator showcasing the verification review stages.
class VerificationTimelineCard extends StatelessWidget {
  const VerificationTimelineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.paddingCard,
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedLg,
      ),
      child: Column(
        children: [
          _buildStage(
            Icons.check_circle_rounded,
            AppColors.success,
            'Profile Submission',
            'Completed successfully',
            true,
          ),
          _buildStage(
            Icons.hourglass_top_rounded,
            AppColors.primary,
            'Platform Team Review',
            'In progress (Est. 24-48 hours)',
            true,
          ),
          _buildStage(
            Icons.verified_user_rounded,
            AppColors.dotDivider,
            'Verified Badge & Sponsorships',
            'Unlock executive brand deals',
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildStage(
    IconData icon,
    Color color,
    String title,
    String subtitle,
    bool showLine,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(icon, color: color, size: 24),
            if (showLine)
              Container(width: 2, height: 32, color: AppColors.inputBackground),
          ],
        ),
        AppSpacing.horizontalMd,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.fieldLabel),
              Text(subtitle, style: AppTextStyles.body.copyWith(fontSize: 12)),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ],
    );
  }
}
