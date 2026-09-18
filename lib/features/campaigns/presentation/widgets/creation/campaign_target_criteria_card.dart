import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'campaign_criteria_data.dart';
import 'campaign_target_criteria_chips.dart';

class CampaignTargetCriteriaCard extends StatelessWidget {
  final Set<String> selectedPlatforms;
  final Set<String> selectedNiches;
  final ValueChanged<String> onTogglePlatform;
  final ValueChanged<String> onToggleNiche;

  const CampaignTargetCriteriaCard({
    super.key,
    required this.selectedPlatforms,
    required this.selectedNiches,
    required this.onTogglePlatform,
    required this.onToggleNiche,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        boxShadow: const [BoxShadow(color: Color(0x060B1C30), blurRadius: 10, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.gps_fixed_rounded, size: 20, color: AppColors.primary),
              const SizedBox(width: 8),
              Text('Target Creator Criteria', style: AppTextStyles.headlineSm(color: AppColors.onSurface)),
            ],
          ),
          const SizedBox(height: 14),
          Text('Eligible Platforms', style: AppTextStyles.labelMd(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 8),
          CampaignTargetPlatformsWrap(selectedPlatforms: selectedPlatforms, onTogglePlatform: onTogglePlatform),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Follower Audience Tier', style: AppTextStyles.labelMd(color: AppColors.onSurfaceVariant)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(color: AppColors.primaryFixed, borderRadius: BorderRadius.circular(AppRadii.sm)),
                child: Text('10K — 250K+', style: AppTextStyles.labelMd(color: AppColors.primary)),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text('Creator Niches', style: AppTextStyles.labelMd(color: AppColors.onSurfaceVariant)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: targetCriteriaNiches.map((n) {
              final isSel = selectedNiches.contains(n);
              return InkWell(
                onTap: () => onToggleNiche(n),
                borderRadius: BorderRadius.circular(AppRadii.md),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSel ? AppColors.inverseSurface : AppColors.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(AppRadii.md),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(n, style: AppTextStyles.labelMd(color: isSel ? AppColors.inverseOnSurface : AppColors.onSurface)),
                      if (isSel) ...[const SizedBox(width: 4), const Icon(Icons.check, size: 14, color: AppColors.inverseOnSurface)],
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
