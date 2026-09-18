import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/campaign_model.dart';

class CampaignOverviewHeroCard extends StatelessWidget {
  final CampaignModel campaign;

  const CampaignOverviewHeroCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    final isPublic = campaign.accessType == CampaignAccessType.public;
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.card),
        boxShadow: const [BoxShadow(color: Color(0x080B1C30), blurRadius: 16, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: AppColors.secondaryFixed, borderRadius: BorderRadius.circular(AppRadii.full)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.public_rounded, size: 14, color: AppColors.onSecondaryFixed),
                    const SizedBox(width: 4),
                    Text(isPublic ? 'Public Campaign' : 'Private Campaign', style: AppTextStyles.labelSm(color: AppColors.onSecondaryFixed)),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: AppColors.surfaceContainerHigh, borderRadius: BorderRadius.circular(AppRadii.full)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(width: 6, height: 6, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
                    const SizedBox(width: 6),
                    Text('Active', style: AppTextStyles.labelSm(color: AppColors.onSurface)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(campaign.title, style: AppTextStyles.headlineLg(color: AppColors.onSurface)),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.storefront_rounded, size: 16, color: AppColors.tertiary),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  '${campaign.brandName} Studio • ${campaign.category}',
                  style: AppTextStyles.bodySm(color: AppColors.tertiary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(AppRadii.lg)),
            child: Row(
              children: [
                Expanded(child: _buildStat('Total Budget', '₹${campaign.totalBudget.toInt()}', 'Allocated', AppColors.primary)),
                Expanded(child: _buildStat('Duration', '${campaign.durationMonths} Mos', campaign.dateRange, AppColors.onSurface)),
                Expanded(child: _buildStat('Escrow', '₹${campaign.escrowBudget.toInt()}', '100% Safe', AppColors.secondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String label, String value, String sub, Color valColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.labelSm(color: AppColors.tertiary)),
        const SizedBox(height: 2),
        Text(value, style: AppTextStyles.headlineSm(color: valColor), maxLines: 1),
        const SizedBox(height: 2),
        Text(sub, style: AppTextStyles.labelSm(color: AppColors.tertiary), maxLines: 1),
      ],
    );
  }
}
