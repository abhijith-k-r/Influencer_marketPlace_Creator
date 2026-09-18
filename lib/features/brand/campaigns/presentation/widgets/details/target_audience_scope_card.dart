import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/campaign_model.dart';

class TargetAudienceScopeCard extends StatelessWidget {
  final CampaignModel campaign;

  const TargetAudienceScopeCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.card),
        boxShadow: const [
          BoxShadow(color: Color(0x060B1C30), blurRadius: 10, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Target Audience & Scope', style: AppTextStyles.headlineSm(color: AppColors.onSurface)),
              const Icon(Icons.tune_rounded, size: 20, color: AppColors.tertiary),
            ],
          ),
          const SizedBox(height: 12),
          _buildScopeItem(
            icon: Icons.smart_display_rounded,
            iconBg: AppColors.primaryFixed,
            iconColor: AppColors.primary,
            label: 'Target Platforms',
            value: campaign.targetPlatforms.join(' Reel + 2x Stories'),
          ),
          const SizedBox(height: 8),
          _buildScopeItem(
            icon: Icons.person_pin_circle_rounded,
            iconBg: AppColors.secondaryFixed,
            iconColor: AppColors.secondary,
            label: 'Creator Criteria',
            value: campaign.creatorCriteria,
          ),
          const SizedBox(height: 8),
          _buildScopeItem(
            icon: Icons.movie_edit,
            iconBg: AppColors.surfaceContainerHigh,
            iconColor: AppColors.tertiary,
            label: 'Deliverables Spec',
            value: campaign.deliverablesSpec,
          ),
        ],
      ),
    );
  }

  Widget _buildScopeItem({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.lg),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
            child: Icon(icon, size: 18, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.labelSm(color: AppColors.tertiary)),
                const SizedBox(height: 2),
                Text(value, style: AppTextStyles.labelMd(color: AppColors.onSurface)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
