import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/features/creator/payments/data/models/creator_earning_campaign_model.dart';
import 'creator_campaign_earning_footer.dart';

class CreatorCampaignEarningCard extends StatelessWidget {
  final CreatorEarningCampaignModel campaign;
  final VoidCallback onTap;

  const CreatorCampaignEarningCard({
    super.key,
    required this.campaign,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: AppRadii.roundedXl,
        child: InkWell(
          borderRadius: AppRadii.roundedXl,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        color: CreatorColors.surfaceContainerHigh,
                        borderRadius: AppRadii.roundedMd,
                      ),
                      child: const Icon(
                        Icons.campaign_rounded,
                        color: CreatorColors.primary,
                        size: 22,
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
                                child: Text(
                                  campaign.brandName,
                                  style: AppTextStyles.headlineSm(
                                    color: CreatorColors.onSurface,
                                  ).copyWith(fontSize: 15, fontWeight: FontWeight.w700),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (campaign.isVerified) ...[
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.verified_rounded,
                                  size: 15,
                                  color: CreatorColors.primaryContainer,
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            campaign.campaignTitle,
                            style: AppTextStyles.bodySm(
                              color: CreatorColors.onSurfaceVariant,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    _buildStatusPill(campaign.status),
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: CreatorColors.surfaceContainerLow,
                    borderRadius: AppRadii.roundedMd,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Earned So Far',
                              style: AppTextStyles.labelSm(
                                color: CreatorColors.outline,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              campaign.earnedAmount,
                              style: AppTextStyles.headlineMd(
                                color: CreatorColors.primary,
                              ).copyWith(fontWeight: FontWeight.w800),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'Total Deal Payout',
                              style: AppTextStyles.labelSm(
                                color: CreatorColors.outline,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              campaign.totalDealAmount,
                              style: AppTextStyles.labelMd(
                                color: CreatorColors.onSurface,
                              ).copyWith(fontWeight: FontWeight.w600),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: AppRadii.roundedFull,
                        child: LinearProgressIndicator(
                          value: campaign.progressRatio,
                          minHeight: 5,
                          backgroundColor: CreatorColors.surfaceContainerHighest,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            CreatorColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                CreatorCampaignEarningFooter(campaign: campaign, onTap: onTap),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusPill(String status) {
    final isSettled = status == 'Settled';
    final isActionReq = status == 'Action Required';

    final Color bgColor = isSettled
        ? CreatorColors.surfaceContainerHigh
        : (isActionReq ? const Color(0x2EBA1A1A) : CreatorColors.primaryFixed);
    final Color textColor = isSettled
        ? CreatorColors.onSurfaceVariant
        : (isActionReq ? CreatorColors.error : CreatorColors.onPrimaryFixedVariant);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: AppRadii.roundedFull,
      ),
      child: Text(
        status.toUpperCase(),
        style: AppTextStyles.labelSm(
          color: textColor,
        ).copyWith(fontSize: 10, fontWeight: FontWeight.w800),
      ),
    );
  }
}
