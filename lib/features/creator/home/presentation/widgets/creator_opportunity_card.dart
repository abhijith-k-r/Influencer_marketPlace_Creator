import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/features/creator/home/data/models/creator_opportunity_model.dart';
import 'creator_opportunity_action_row.dart';
import 'creator_opportunity_matrix_panel.dart';

class CreatorOpportunityCard extends StatelessWidget {
  final CreatorOpportunityModel opportunity;
  final VoidCallback onDetailsTap;
  final VoidCallback onApplyTap;

  const CreatorOpportunityCard({
    super.key,
    required this.opportunity,
    required this.onDetailsTap,
    required this.onApplyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
        boxShadow: AppShadows.cardSoft,
      ),
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
                child: const Icon(Icons.campaign_rounded, color: CreatorColors.primary, size: 24),
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
                            opportunity.brandName,
                            style: AppTextStyles.headlineSm(
                              color: CreatorColors.onSurface,
                            ).copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.verified_rounded, size: 16, color: CreatorColors.primaryContainer),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      opportunity.campaignTitle,
                      style: AppTextStyles.bodySm(
                        color: CreatorColors.onSurfaceVariant,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: const BoxDecoration(
                  color: CreatorColors.primaryFixed,
                  borderRadius: AppRadii.roundedFull,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(opportunity.badgeIcon, size: 12, color: CreatorColors.onPrimaryFixedVariant),
                    const SizedBox(width: 4),
                    Text(
                      opportunity.badgeText,
                      style: AppTextStyles.labelSm(
                        color: CreatorColors.onPrimaryFixedVariant,
                      ).copyWith(fontSize: 10, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          CreatorOpportunityMatrixPanel(opportunity: opportunity),
          const SizedBox(height: 14),
          CreatorOpportunityActionRow(
            onDetailsTap: onDetailsTap,
            onApplyTap: onApplyTap,
          ),
        ],
      ),
    );
  }
}
