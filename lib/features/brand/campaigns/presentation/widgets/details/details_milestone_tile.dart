import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/campaign_milestone_model.dart';

class DetailsMilestoneTile extends StatelessWidget {
  final CampaignMilestoneModel milestone;

  const DetailsMilestoneTile({super.key, required this.milestone});

  @override
  Widget build(BuildContext context) {
    final isCurrent = milestone.status == CampaignMilestoneStatus.current;
    final isDone = milestone.status == CampaignMilestoneStatus.completed;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isCurrent ? AppColors.primaryFixed.withValues(alpha: 0.25) : AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        border: isCurrent ? Border.all(color: AppColors.primary.withValues(alpha: 0.3)) : null,
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isDone ? AppColors.secondaryFixed : (isCurrent ? AppColors.primaryFixed : AppColors.surfaceContainer),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isDone ? Icons.check_circle_rounded : (isCurrent ? Icons.pending_rounded : Icons.lock_rounded),
              size: 18,
              color: isDone ? AppColors.secondary : (isCurrent ? AppColors.primary : AppColors.tertiary),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(milestone.title, style: AppTextStyles.labelLg(color: AppColors.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                    if (isCurrent) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(AppRadii.xs)),
                        child: Text('CURRENT', style: AppTextStyles.labelSm(color: AppColors.onPrimary)),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(milestone.subtitle, style: AppTextStyles.bodySm(color: AppColors.tertiary)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '₹${milestone.amount.toInt()}',
                style: AppTextStyles.labelLg(color: isCurrent ? AppColors.primary : (isDone ? AppColors.onSurface : AppColors.tertiary)),
              ),
              Text(
                isDone ? 'Completed' : (isCurrent ? 'Action Needed' : 'Upcoming'),
                style: AppTextStyles.labelSm(color: isDone ? AppColors.secondary : (isCurrent ? AppColors.primary : AppColors.tertiary)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
