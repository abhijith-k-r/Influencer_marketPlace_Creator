import 'package:flutter/material.dart';
import 'package:creator_side/core/constants/app_assets.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorRedeemCampaignHeader extends StatelessWidget {
  const CreatorRedeemCampaignHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(color: CreatorColors.outlineVariant.withValues(alpha: 0.6)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              AppAssets.brandAvatar1,
              width: 52,
              height: 52,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                width: 52,
                height: 52,
                color: CreatorColors.primaryContainer,
                child: const Icon(Icons.campaign_rounded, color: CreatorColors.primary),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00A86B).withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(AppRadii.full),
                  ),
                  child: Text(
                    'MILESTONE 2 COMPLETED',
                    style: AppTextStyles.labelSm(
                      color: const Color(0xFF00A86B),
                    ).copyWith(fontSize: 10, fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'UrbanKicks Studio',
                  style: AppTextStyles.headlineSm(
                    color: CreatorColors.onSurface,
                  ).copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 2),
                Text(
                  'Sneaker Gen-2 Launch Drop',
                  style: AppTextStyles.labelSm(color: CreatorColors.outline),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
