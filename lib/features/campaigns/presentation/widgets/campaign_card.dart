import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/campaign_model.dart';

/// Campaign discovery card showcasing brand, title, compensation, and deadline.
class CampaignCard extends StatelessWidget {
  final CampaignModel campaign;
  final VoidCallback onTap;

  const CampaignCard({super.key, required this.campaign, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedMd,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadii.roundedMd,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(campaign.brandName, style: AppTextStyles.brandPill),
                    Container(
                      padding: AppSpacing.paddingLiveBadge,
                      decoration: const BoxDecoration(
                        color: AppColors.pillBackground,
                        borderRadius: AppRadii.roundedPill,
                      ),
                      child: Text(
                        campaign.platform,
                        style: AppTextStyles.brandPill,
                      ),
                    ),
                  ],
                ),
                AppSpacing.verticalSm,
                Text(
                  campaign.title,
                  style: AppTextStyles.fieldLabel.copyWith(fontSize: 14),
                ),
                AppSpacing.verticalSm,
                Text(
                  campaign.description,
                  style: AppTextStyles.body.copyWith(fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Divider(color: AppColors.inputBackground, height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Compensation',
                          style: AppTextStyles.body.copyWith(fontSize: 10),
                        ),
                        Text(
                          campaign.payout,
                          style: AppTextStyles.fieldLabel.copyWith(
                            color: AppColors.primary,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      campaign.deadline,
                      style: AppTextStyles.body.copyWith(
                        fontSize: 11,
                        color: AppColors.error,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
