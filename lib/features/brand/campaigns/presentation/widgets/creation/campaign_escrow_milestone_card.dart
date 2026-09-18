import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/campaign_milestone_model.dart';
import 'creation_milestone_tile.dart';

class CampaignEscrowMilestoneCard extends StatelessWidget {
  final List<CampaignMilestoneModel> milestones;
  final VoidCallback onAddMilestone;
  final ValueChanged<int> onDeleteMilestone;

  const CampaignEscrowMilestoneCard({
    super.key,
    required this.milestones,
    required this.onAddMilestone,
    required this.onDeleteMilestone,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.account_balance_wallet_rounded, size: 20, color: AppColors.secondary),
                        const SizedBox(width: 8),
                        Text('Escrow Milestone Plan', style: AppTextStyles.headlineSm(color: AppColors.onSurface)),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text('Automated payouts locked safely until deliverable review', style: AppTextStyles.bodySm(color: AppColors.onSurfaceVariant)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: AppColors.surfaceContainerHigh, borderRadius: BorderRadius.circular(AppRadii.full)),
                child: Text('${milestones.length} Stages', style: AppTextStyles.labelSm(color: AppColors.onSurface)),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: milestones.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return CreationMilestoneTile(
                milestone: milestones[index],
                onDelete: () => onDeleteMilestone(index),
              );
            },
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: onAddMilestone,
            borderRadius: BorderRadius.circular(AppRadii.md),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.primaryFixed.withValues(alpha: 0.4),
                borderRadius: BorderRadius.circular(AppRadii.md),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add_circle_outline_rounded, size: 18, color: AppColors.primary),
                  const SizedBox(width: 8),
                  Text('Add New Milestone', style: AppTextStyles.labelLg(color: AppColors.primary)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
