import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Contextual creator benefit metric ribbon on the Sign In page.
class AuthBenefitRibbon extends StatelessWidget {
  const AuthBenefitRibbon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedMd,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(child: _buildMetric('FAST PAYOUTS', 'Net 24-hr', AppColors.textPrimary)),
          _buildDivider(),
          Expanded(child: _buildMetric('ESCROW HOLD', '100% Secured', AppColors.primary)),
          _buildDivider(),
          Expanded(child: _buildMetric('SPONSORSHIPS', 'Tier-1 Brands', AppColors.textPrimary)),
        ],
      ),
    );
  }

  Widget _buildMetric(String title, String subtitle, Color subtitleColor) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTextStyles.brandPill.copyWith(
            fontSize: 9,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          subtitle,
          style: AppTextStyles.fieldLabel.copyWith(
            fontSize: 11,
            color: subtitleColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 22,
      color: AppColors.trustBadgeBackground,
    );
  }
}
