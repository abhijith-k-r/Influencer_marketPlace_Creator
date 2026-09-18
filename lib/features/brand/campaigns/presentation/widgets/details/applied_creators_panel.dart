import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/campaign_model.dart';
import 'creator_avatar_stack.dart';

class AppliedCreatorsPanel extends StatelessWidget {
  final CampaignModel campaign;
  final VoidCallback onReviewApplicants;

  const AppliedCreatorsPanel({
    super.key,
    required this.campaign,
    required this.onReviewApplicants,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(AppRadii.xl)),
      child: Column(
        children: [
          CreatorAvatarStack(applicants: campaign.applicants, totalCount: campaign.applicantsCount),
          const SizedBox(height: 10),
          Wrap(
            spacing: 6,
            runSpacing: 4,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildDot(AppColors.primary),
                  const SizedBox(width: 4),
                  Text('3 Approved', style: AppTextStyles.labelSm(color: AppColors.onSurfaceVariant)),
                ],
              ),
              Text('•', style: AppTextStyles.labelSm(color: AppColors.outlineVariant)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildDot(AppColors.secondary),
                  const SizedBox(width: 4),
                  Text('2 In Negotiation', style: AppTextStyles.labelSm(color: AppColors.onSurfaceVariant)),
                ],
              ),
              Text('•', style: AppTextStyles.labelSm(color: AppColors.outlineVariant)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildDot(AppColors.tertiary),
                  const SizedBox(width: 4),
                  Text('13 Pending', style: AppTextStyles.labelSm(color: AppColors.onSurfaceVariant)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: onReviewApplicants,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.surfaceContainerLowest,
                foregroundColor: AppColors.onSurface,
                elevation: 1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadii.md)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Review Applicants', style: AppTextStyles.labelLg(color: AppColors.onSurface)),
                  const SizedBox(width: 6),
                  const Icon(Icons.arrow_forward_rounded, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(Color c) => Container(width: 6, height: 6, decoration: BoxDecoration(color: c, shape: BoxShape.circle));
}
