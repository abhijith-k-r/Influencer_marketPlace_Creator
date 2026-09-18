import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/features/creator/payments/models/creator_earning_campaign_model.dart';

class CreatorPaymentCampaignOverviewCard extends StatelessWidget {
  final CreatorEarningCampaignModel campaign;

  const CreatorPaymentCampaignOverviewCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(color: CreatorColors.outlineVariant.withValues(alpha: 0.6)),
        boxShadow: [BoxShadow(color: CreatorColors.primary.withValues(alpha: 0.04), blurRadius: 16, offset: const Offset(0, 4))],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  campaign.avatarUrl, width: 44, height: 44, fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(width: 44, height: 44, color: CreatorColors.primaryContainer, child: const Icon(Icons.business_rounded, color: CreatorColors.primary)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(campaign.brandName, style: AppTextStyles.labelLg(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700)),
                    Text('DEAL ID #UK-9402 • ${campaign.brandCategory}', style: AppTextStyles.labelSm(color: CreatorColors.outline)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: CreatorColors.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(AppRadii.full)),
                child: Row(
                  children: [
                    const Icon(Icons.verified_user_rounded, size: 12, color: CreatorColors.primary),
                    const SizedBox(width: 4),
                    Text('Escrow Active', style: AppTextStyles.labelSm(color: CreatorColors.primary).copyWith(fontSize: 10, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(campaign.campaignTitle, style: AppTextStyles.headlineSm(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Contract Budget', style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(fontSize: 10)),
                  Text(campaign.totalBudget, style: AppTextStyles.headlineSm(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w800)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Secured in Escrow', style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(fontSize: 10)),
                  Text('100% Vaulted', style: AppTextStyles.labelLg(color: const Color(0xFF00A86B)).copyWith(fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(value: campaign.progressPercent, minHeight: 6, backgroundColor: CreatorColors.surfaceContainerHigh, valueColor: const AlwaysStoppedAnimation<Color>(CreatorColors.primary)),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(campaign.milestonesReleasedText, style: AppTextStyles.labelSm(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w600)),
              Text(campaign.securedAmountText, style: AppTextStyles.labelSm(color: CreatorColors.outline)),
            ],
          ),
        ],
      ),
    );
  }
}
