import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';
import '../models/creator_opportunity_model.dart';
import 'creator_opportunity_action_row.dart';
import 'creator_opportunity_matrix_panel.dart';

class CreatorOpportunityCard extends StatelessWidget {
  final CreatorOpportunityModel opportunity;

  const CreatorOpportunityCard({super.key, required this.opportunity});

  @override
  Widget build(BuildContext context) {
    final opp = opportunity;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Color(0x060F172A), blurRadius: 16, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(color: CreatorColors.surfaceContainerLow, borderRadius: BorderRadius.circular(6)),
                child: Row(
                  children: [
                    Icon(opp.badgeIcon, size: 14, color: CreatorColors.primary),
                    const SizedBox(width: 4),
                    Text(opp.badgeText, style: AppTextStyles.labelSm(color: CreatorColors.onPrimaryFixedVariant).copyWith(fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.schedule_rounded, size: 13, color: CreatorColors.outline),
                  const SizedBox(width: 3),
                  Text(opp.closesIn, style: AppTextStyles.labelSm(color: CreatorColors.outline)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(opp.avatarUrl, width: 44, height: 44, fit: BoxFit.cover, errorBuilder: (_, _, _) => Container(width: 44, height: 44, color: CreatorColors.surfaceContainerHigh, child: const Icon(Icons.storefront_rounded, color: CreatorColors.primary))),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(child: Text(opp.brandName, style: AppTextStyles.headlineSm(color: CreatorColors.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis)),
                        const SizedBox(width: 4),
                        const Icon(Icons.verified_rounded, size: 16, color: CreatorColors.primary),
                      ],
                    ),
                    Text(opp.campaignTitle, style: AppTextStyles.bodyMd(color: CreatorColors.onSurfaceVariant), maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          CreatorOpportunityMatrixPanel(opportunity: opp),
          const SizedBox(height: 12),
          CreatorOpportunityActionRow(brandName: opp.brandName),
        ],
      ),
    );
  }
}
