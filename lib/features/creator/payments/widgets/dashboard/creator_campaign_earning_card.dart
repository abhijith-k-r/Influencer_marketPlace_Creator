import 'package:flutter/material.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/theme/creator_colors.dart';
import '../../models/creator_earning_campaign_model.dart';
import 'creator_campaign_earning_footer.dart';

class CreatorCampaignEarningCard extends StatelessWidget {
  final CreatorEarningCampaignModel campaign;

  const CreatorCampaignEarningCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    final c = campaign;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Color(0x060B1C30), blurRadius: 14, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(c.avatarUrl, width: 44, height: 44, fit: BoxFit.cover, errorBuilder: (_, _, _) => Container(width: 44, height: 44, color: CreatorColors.surfaceContainerHigh, child: const Icon(Icons.storefront_rounded, color: CreatorColors.primary))),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${c.brandName} • ${c.brandCategory}', style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(fontWeight: FontWeight.w700), maxLines: 1, overflow: TextOverflow.ellipsis),
                    Text(c.campaignTitle, style: AppTextStyles.headlineSm(color: CreatorColors.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: CreatorColors.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                child: Text(c.statusLabel, style: AppTextStyles.labelSm(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: CreatorColors.surfaceContainerLow, borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Milestone Progress', style: AppTextStyles.bodySm(color: CreatorColors.onSurfaceVariant)),
                    Text(c.totalBudget, style: AppTextStyles.headlineSm(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w800)),
                  ],
                ),
                const SizedBox(height: 6),
                ClipRRect(borderRadius: BorderRadius.circular(6), child: LinearProgressIndicator(value: c.progressPercent, minHeight: 6, backgroundColor: CreatorColors.surfaceContainerHigh, valueColor: const AlwaysStoppedAnimation<Color>(CreatorColors.primary))),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: Text(c.milestonesReleasedText, style: AppTextStyles.labelSm(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis)),
                    Text(c.securedAmountText, style: AppTextStyles.labelSm(color: CreatorColors.outline)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          CreatorCampaignEarningFooter(campaign: c),
        ],
      ),
    );
  }
}
