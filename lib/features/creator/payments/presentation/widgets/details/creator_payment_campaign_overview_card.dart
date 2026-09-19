import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/features/creator/payments/data/models/creator_earning_campaign_model.dart';

class CreatorPaymentCampaignOverviewCard extends StatelessWidget {
  final CreatorEarningCampaignModel campaign;

  const CreatorPaymentCampaignOverviewCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Campaign Deal Value',
                style: AppTextStyles.labelSm(
                  color: CreatorColors.outline,
                ).copyWith(fontWeight: FontWeight.w600),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: const BoxDecoration(
                  color: CreatorColors.primaryFixed,
                  borderRadius: AppRadii.roundedFull,
                ),
                child: Text(
                  'Deal Active',
                  style: AppTextStyles.labelSm(
                    color: CreatorColors.onPrimaryFixedVariant,
                  ).copyWith(fontSize: 10, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            campaign.totalDealAmount,
            style: AppTextStyles.headlineLg(
              color: CreatorColors.onSurface,
            ).copyWith(fontSize: 28, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 4),
          Text(
            '${campaign.brandName} • ${campaign.campaignTitle}',
            style: AppTextStyles.bodySm(
              color: CreatorColors.outline,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _buildMetricTile('Earned', campaign.earnedAmount, CreatorColors.primary),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildMetricTile(
                  'Remaining in Escrow',
                  campaign.escrowAmount ?? '₹0',
                  CreatorColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricTile(String label, String value, Color valueColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLow,
        borderRadius: AppRadii.roundedMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(fontSize: 10)),
          const SizedBox(height: 4),
          Text(value, style: AppTextStyles.labelLg(color: valueColor).copyWith(fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}
