import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/campaign_milestone_model.dart';

class CreationMilestoneTile extends StatelessWidget {
  final CampaignMilestoneModel milestone;
  final VoidCallback onDelete;

  const CreationMilestoneTile({
    super.key,
    required this.milestone,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.md),
      ),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: AppColors.secondaryFixed,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '${milestone.stageNumber}',
              style: AppTextStyles.labelSm(color: AppColors.onSecondaryFixed),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  milestone.title,
                  style: AppTextStyles.labelMd(color: AppColors.onSurface),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  milestone.subtitle,
                  style: AppTextStyles.bodySm(color: AppColors.tertiary),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '₹${milestone.amount.toInt()}',
            style: AppTextStyles.headlineSm(color: AppColors.onSurface),
          ),
          const SizedBox(width: 4),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete_outline_rounded, size: 18, color: AppColors.outline),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
        ],
      ),
    );
  }
}
