import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorRedeemCampaignHeader extends StatelessWidget {
  final String brandName;
  final String campaignName;
  final String milestoneName;

  const CreatorRedeemCampaignHeader({
    super.key,
    this.brandName = 'FitFuel Nutrition',
    this.campaignName = 'Summer Hydration Reel',
    this.milestoneName = 'Milestone 2 • Story Cut Approved',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
        border: Border.all(color: CreatorColors.outlineVariant.withValues(alpha: 0.6)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: CreatorColors.surfaceContainerHigh,
              borderRadius: AppRadii.roundedMd,
            ),
            child: const Icon(
              Icons.campaign_rounded,
              color: CreatorColors.primary,
              size: 24,
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
                        brandName,
                        style: AppTextStyles.labelSm(
                          color: CreatorColors.outline,
                        ).copyWith(fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.verified_rounded, size: 14, color: CreatorColors.primaryContainer),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  campaignName,
                  style: AppTextStyles.labelLg(
                    color: CreatorColors.onSurface,
                  ).copyWith(fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  milestoneName,
                  style: AppTextStyles.labelSm(
                    color: CreatorColors.primary,
                  ).copyWith(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
