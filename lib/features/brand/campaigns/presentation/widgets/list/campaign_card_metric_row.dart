import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/campaign_model.dart';

class CampaignCardMetricRow extends StatelessWidget {
  final CampaignModel campaign;

  const CampaignCardMetricRow({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    final (icon, text, status) = _getMetricInfo(campaign);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(AppRadii.md)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(icon, size: 18, color: AppColors.tertiary),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(text, style: AppTextStyles.labelSm(color: AppColors.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            status,
            style: AppTextStyles.labelSm(color: campaign.status == CampaignStatus.active ? AppColors.secondary : AppColors.tertiary),
          ),
        ],
      ),
    );
  }

  (IconData, String, String) _getMetricInfo(CampaignModel c) {
    if (c.status == CampaignStatus.completed) return (Icons.task_alt, '100% Milestones Settled', '${c.postsLiveCount} Posts Live');
    if (c.status == CampaignStatus.expired) return (Icons.history, 'Campaign concluded • Archived', 'Archived');
    return (
      Icons.group_rounded,
      '${c.applicantsCount} Applicants • ${c.shortlistedCount} Shortlisted',
      '${c.inReviewCount} In Review',
    );
  }
}
