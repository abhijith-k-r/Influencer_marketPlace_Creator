import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/campaign_milestone_model.dart';
import 'details_milestone_tile.dart';

class DetailsMilestonesCard extends StatelessWidget {
  final List<CampaignMilestoneModel> milestones;

  const DetailsMilestonesCard({super.key, required this.milestones});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.card),
        boxShadow: const [
          BoxShadow(
            color: Color(0x060B1C30),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
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
                    Text('Payment Milestones', style: AppTextStyles.headlineSm(color: AppColors.onSurface)),
                    const SizedBox(height: 2),
                    Text('Escrow Protected via Smart Safe', style: AppTextStyles.bodySm(color: AppColors.tertiary), maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(AppRadii.full),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.lock_rounded, size: 14, color: AppColors.secondary),
                    const SizedBox(width: 4),
                    Text('Escrow ${milestones.length}/${milestones.length}', style: AppTextStyles.labelSm(color: AppColors.secondary)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: milestones.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return DetailsMilestoneTile(milestone: milestones[index]);
            },
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainer,
              borderRadius: BorderRadius.circular(AppRadii.md),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.shield_outlined, size: 18, color: AppColors.secondary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Funds are securely released only upon your explicit milestone review and approval.',
                    style: AppTextStyles.bodySm(color: AppColors.onSurface),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
