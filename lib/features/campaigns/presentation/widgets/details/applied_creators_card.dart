import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/campaign_model.dart';
import 'applied_creators_panel.dart';

class AppliedCreatorsCard extends StatelessWidget {
  final CampaignModel campaign;
  final VoidCallback onReviewApplicants;

  const AppliedCreatorsCard({
    super.key,
    required this.campaign,
    required this.onReviewApplicants,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.card),
        boxShadow: const [BoxShadow(color: Color(0x060B1C30), blurRadius: 10, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(color: AppColors.primaryFixed, shape: BoxShape.circle),
                    child: const Icon(Icons.group_rounded, size: 18, color: AppColors.primary),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Applied Creators', style: AppTextStyles.headlineSm(color: AppColors.onSurface)),
                      Text('${campaign.applicantsCount} total submissions', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: onReviewApplicants,
                child: Row(
                  children: [
                    Text('View All', style: AppTextStyles.labelLg(color: AppColors.primary)),
                    const Icon(Icons.chevron_right_rounded, size: 18, color: AppColors.primary),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          AppliedCreatorsPanel(
            campaign: campaign,
            onReviewApplicants: onReviewApplicants,
          ),
        ],
      ),
    );
  }
}
